# Voiceover Regeneration

The shipped voiceover on [`renders/launch.mp4`](../../renders/launch.mp4) is
ElevenLabs "Rachel". If you fork this project and want to swap in a different
voice — your own cloned voice, a different ElevenLabs take, or HeyGen's
Starfish TTS — this folder has everything you need to regenerate all 23 VO
lines in place with matching filenames and target durations.

---

## What you need

- **Endpoint:** `POST https://api.heygen.com/v3/voices/speech` (Starfish engine) — or any other TTS with a per-line synthesis API.
- **Auth header:** `X-Api-Key: $HEYGEN_API_KEY`
- **voice_id:** a Starfish-compatible voice ID from your HeyGen space. Find one with `GET /v3/voices?engine=starfish` and listen to its `preview_audio_url`. A test call `GET /v2/voices/{id}` must return 200 before running the full batch.
- **speed:** start at `1.0`. If the new voice runs long on any line (see target durations below), rerun that single line with `speed: 1.05` or `1.10` — do **not** globally raise the speed, pacing is tuned per line.
- **input_type:** `"text"` (plain text; no SSML needed)

Docs used:
- Generate Speech — <https://docs.heygen.com/reference/generate-speech>
- List/Verify Voices — <https://docs.heygen.com/reference/list-voices>

---

## The 23 lines

The filename is the file the master timeline loads — **names must match exactly**. "Target duration" is what the current edit is cut to; if the new VO comes back within ±10% of target, nothing downstream needs adjustment. Bigger drift means we re-measure and re-flow timings in `index.html`.

| # | Filename | Text to synthesize | Target duration |
|---|---|---|---|
| 01 | `01-promo-for-your-app.mp3` | `Promo for your app?` | 1.30s |
| 02 | `02-brand-video.mp3` | `Brand video?` | 1.02s |
| 03 | `03-social-ad.mp3` | `Social ad?` | 0.98s |
| 04 | `04-launch-clip.mp3` | `Launch clip?` | 1.02s |
| 05 | `05-announcement.mp3` | `Now — any site becomes video.` | 2.14s |
| 06 | `06-product-launches.mp3` | `Product launches.` | 1.25s |
| 07 | `07-feature-showcases.mp3` | `Feature showcases.` | 1.35s |
| 08 | `08-brand-reels.mp3` | `Brand reels.` | 1.02s |
| 09 | `09-custom-shaders.mp3` | `Custom shaders.` | 1.30s |
| 10 | `10-product-demos.mp3` | `Product demos.` | 1.21s |
| 11 | `11-three-d-scenes.mp3` | `3D scenes.` | 1.35s |
| 12 | `12-portfolios.mp3` | `Portfolios.` | 1.11s |
| 13 | `13-typography.mp3` | `Typography.` | 1.07s |
| 14 | `14-hyperframes.mp3` | `HyperFrames.` | 1.16s |
| 15 | `15-give-your-agent-a-url.mp3` | `Give your agent a URL.` | 2.83s |
| 16 | `16-go-make-something.mp3` | `Go make something.` | 1.21s |
| 17 | `17-music-apps.mp3` | `Music apps.` | 0.98s |
| 18 | `18-team-design.mp3` | `Team design.` | 1.07s |
| 19 | `19-dev-metrics.mp3` | `Dev metrics.` | 1.07s |
| 20 | `20-infrastructure.mp3` | `Infrastructure.` | 1.16s |
| 21 | `21-brand-openers.mp3` | `Brand openers.` | 1.16s |
| 22 | `22-logo-reveals.mp3` | `Logo reveals.` | 1.30s |
| 23 | `23-drawn-in-svg.mp3` | `Drawn in SVG.` | 1.63s |

Lines used in the current edit: **01–08, 10, 11, 13–17, 20–23**.
Lines 09, 12, 18, 19 are unused alt takes — regenerate for parity, or skip.

Pronunciation hints:
- Line 11: read as **"three-D scenes"** (not "eleven scenes"). Starfish normally handles `3D` fine, but if it misreads, substitute the text `Three-D scenes.`
- Line 14: read as **"Hyper-Frames"** (two beats, capital F).
- Line 23: read as **"S-V-G"** (spelled out, three letters).

---

## One-shot regeneration script

`regenerate-vo.sh` (in this folder) does everything: calls `/v3/voices/speech` for each line, downloads the audio, converts to 44.1 kHz mono MP3 (what the master timeline expects), writes the file in place.

```bash
cd launch-video-2/audio/vo
export HEYGEN_API_KEY="sk_V2_..."          # your HeyGen API key
export VOICE_ID="your_starfish_voice_id"   # voice_id from GET /v3/voices?engine=starfish
bash regenerate-vo.sh
```

Output: 23 `.mp3` files overwritten in this directory, plus `_audit.csv` with new vs. target durations so you can spot any line that drifted from the original edit's pacing and needs a speed bump. Requires `curl`, `jq`, and `ffmpeg` (all standard dev-box stuff).

A test mode is included — `bash regenerate-vo.sh 05` will only regenerate line 05, for auditioning the voice before spending credit on the full batch.

---

## After the files land

1. Play back the new takes (especially 05 and 15 — the two long lines — and 11/23 for pronunciation).
2. Check `_audit.csv`. Any line where `drift > 0.15s` is a candidate for `speed 1.05` re-run on that single line.
3. Re-render the master: `cd /Users/ularkimsanov/Desktop/hyperframes-3 && npx hyperframes render launch-video-2/ --output launch-video-2/renders/website-to-hyperframes-launch-v2.mp4`
4. If any VO is still noticeably off vs. target, ping me and I'll adjust the `data-start` / `data-duration` values in `index.html` to fit the new voice's natural pacing (this is a 2-minute change — we've done it before when swapping music).
