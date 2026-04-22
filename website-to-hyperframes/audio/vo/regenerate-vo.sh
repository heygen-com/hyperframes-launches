#!/usr/bin/env bash
# Regenerate all launch-video VO lines via HeyGen /v3/voices/speech.
#
# Usage:
#   export HEYGEN_API_KEY="sk_V2_..."
#   export VOICE_ID="your_starfish_voice_id"   # from GET /v3/voices?engine=starfish
#   bash regenerate-vo.sh          # regenerate all 23 lines
#   bash regenerate-vo.sh 05       # regenerate only line 05 (for audition)
#   bash regenerate-vo.sh 01 05 15 # regenerate just those lines
#
# Requires: curl, jq, ffmpeg.
# Output files are written in place; originals are backed up to ./_backup/ first.

set -euo pipefail

VOICE_ID="${VOICE_ID:-}"
SPEED="${SPEED:-1.0}"
API="https://api.heygen.com/v3/voices/speech"

if [[ -z "${HEYGEN_API_KEY:-}" ]]; then
  echo "ERROR: HEYGEN_API_KEY is not set." >&2
  echo "  export HEYGEN_API_KEY=\"sk_V2_...\"" >&2
  exit 1
fi

if [[ -z "$VOICE_ID" ]]; then
  echo "ERROR: VOICE_ID is not set." >&2
  echo "  export VOICE_ID=\"<starfish-compatible voice_id>\"" >&2
  echo "  Find one with: curl -H \"X-Api-Key: \$HEYGEN_API_KEY\" \\" >&2
  echo "    \"https://api.heygen.com/v3/voices?engine=starfish&type=public&limit=20\"" >&2
  exit 1
fi

for bin in curl jq ffmpeg; do
  command -v "$bin" >/dev/null || { echo "ERROR: '$bin' not found on PATH." >&2; exit 1; }
done

# Verify the voice is visible to this key before we burn credits.
echo "• Verifying voice_id $VOICE_ID …"
probe=$(curl -sS -o /tmp/_vo_probe.json -w '%{http_code}' \
  "https://api.heygen.com/v2/voices/$VOICE_ID" \
  -H "X-Api-Key: $HEYGEN_API_KEY")
if [[ "$probe" != "200" ]]; then
  echo "ERROR: voice lookup returned HTTP $probe" >&2
  cat /tmp/_vo_probe.json >&2; echo >&2
  echo "  This key cannot see voice $VOICE_ID. Generate a key from the Space that owns it." >&2
  exit 2
fi
name=$(jq -r '.data.name // "?"' /tmp/_vo_probe.json)
echo "  ✓ found: $name"

# filename|text
lines=(
"01-promo-for-your-app.mp3|Promo for your app?"
"02-brand-video.mp3|Brand video?"
"03-social-ad.mp3|Social ad?"
"04-launch-clip.mp3|Launch clip?"
"05-announcement.mp3|Now — any site becomes video."
"06-product-launches.mp3|Product launches."
"07-feature-showcases.mp3|Feature showcases."
"08-brand-reels.mp3|Brand reels."
"09-custom-shaders.mp3|Custom shaders."
"10-product-demos.mp3|Product demos."
"11-three-d-scenes.mp3|3D scenes."
"12-portfolios.mp3|Portfolios."
"13-typography.mp3|Typography."
"14-hyperframes.mp3|HyperFrames."
"15-give-your-agent-a-url.mp3|Give your agent a URL."
"16-go-make-something.mp3|Go make something."
"17-music-apps.mp3|Music apps."
"18-team-design.mp3|Team design."
"19-dev-metrics.mp3|Dev metrics."
"20-infrastructure.mp3|Infrastructure."
"21-brand-openers.mp3|Brand openers."
"22-logo-reveals.mp3|Logo reveals."
"23-drawn-in-svg.mp3|Drawn in SVG."
)

# filename|target_duration (from current master edit)
declare -A targets=(
  [01-promo-for-your-app.mp3]=1.30
  [02-brand-video.mp3]=1.02
  [03-social-ad.mp3]=0.98
  [04-launch-clip.mp3]=1.02
  [05-announcement.mp3]=2.14
  [06-product-launches.mp3]=1.25
  [07-feature-showcases.mp3]=1.35
  [08-brand-reels.mp3]=1.02
  [09-custom-shaders.mp3]=1.30
  [10-product-demos.mp3]=1.21
  [11-three-d-scenes.mp3]=1.35
  [12-portfolios.mp3]=1.11
  [13-typography.mp3]=1.07
  [14-hyperframes.mp3]=1.16
  [15-give-your-agent-a-url.mp3]=2.83
  [16-go-make-something.mp3]=1.21
  [17-music-apps.mp3]=0.98
  [18-team-design.mp3]=1.07
  [19-dev-metrics.mp3]=1.07
  [20-infrastructure.mp3]=1.16
  [21-brand-openers.mp3]=1.16
  [22-logo-reveals.mp3]=1.30
  [23-drawn-in-svg.mp3]=1.63
)

# Select subset if numeric args were passed (e.g. `bash regenerate-vo.sh 05 15`).
selected=()
if (( $# > 0 )); then
  for arg in "$@"; do
    hit=""
    for L in "${lines[@]}"; do
      fn="${L%%|*}"
      [[ "$fn" == "$arg-"* ]] && { selected+=("$L"); hit=1; break; }
    done
    [[ -z "$hit" ]] && { echo "ERROR: no line matches '$arg'" >&2; exit 3; }
  done
else
  selected=("${lines[@]}")
fi

mkdir -p _backup
audit="_audit.csv"
echo "filename,text,new_duration,target,drift" > "$audit"

for entry in "${selected[@]}"; do
  fn="${entry%%|*}"
  txt="${entry#*|}"
  target="${targets[$fn]}"

  [[ -f "$fn" ]] && cp "$fn" "_backup/$fn"

  # Request speech.
  payload=$(jq -n --arg text "$txt" --arg vid "$VOICE_ID" --argjson speed "$SPEED" \
    '{text:$text, voice_id:$vid, speed:$speed}')
  resp=$(curl -sS -X POST "$API" \
    -H "X-Api-Key: $HEYGEN_API_KEY" -H "Content-Type: application/json" \
    -d "$payload")
  url=$(echo "$resp" | jq -r '.data.audio_url // empty')
  dur=$(echo "$resp" | jq -r '.data.duration // empty')
  if [[ -z "$url" ]]; then
    echo "  ✗ $fn  —  API error:" >&2
    echo "$resp" | jq . >&2
    exit 4
  fi

  # Download & normalize: 44.1 kHz mono MP3 at ~128 kbps, to match the rest of the project.
  tmp=$(mktemp -t heygen-vo.XXXXXX)
  curl -sSL "$url" -o "$tmp.src"
  ffmpeg -hide_banner -loglevel error -y -i "$tmp.src" \
    -ac 1 -ar 44100 -b:a 128k -f mp3 "$fn"
  rm -f "$tmp" "$tmp.src"

  actual=$(ffprobe -v error -show_entries format=duration \
    -of default=noprint_wrappers=1:nokey=1 "$fn")
  drift=$(awk -v a="$actual" -v t="$target" 'BEGIN{printf "%+.2f", a - t}')
  printf '  ✓ %-34s  %.2fs  (target %.2fs, drift %s)\n' "$fn" "$actual" "$target" "$drift"
  # Escape commas in text for CSV.
  csv_txt=$(echo "$txt" | sed 's/"/""/g')
  printf '%s,"%s",%.3f,%.2f,%s\n' "$fn" "$csv_txt" "$actual" "$target" "$drift" >> "$audit"
done

echo
echo "Done. Wrote ${#selected[@]} file(s). Audit → $audit"
echo "Originals backed up to ./_backup/."
