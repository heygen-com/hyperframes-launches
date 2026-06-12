# SFX & Music Launch — Full Film

Launch film for **CLI-callable SFX & Music in HyperFrames** (HeyGen API).
Brand atoms stolen verbatim from `claude-paper` `FRAME-claude.md`:
cream paper **#F0EEE6** · ink **#262624** · muted **#6F6E66** · single rationed clay **#D97757** ·
Hanken Grotesk (UI/display) · Galaxie Copernicus serif (giant reply beats) ·
Spline Sans Mono (terminal/labels). Terminal window dark = **#1F1F1E**, composer inset **#2C2C2B**.

**Runtime = 35.8s. Built SILENT — sound is baked in post (see §Audio cue map).**
**Latest render: `renders/sfx-music-launch-v2.mp4` (35.8s, lint-clean).**

The hook: a launch video is spammed-clicked in dead silence ("Boring."), then an agent adds
SFX, then music, live in the terminal — each capability *demonstrated by the film hearing itself*.

---

## The arc (6 acts)

The 10.4s render `assets/intro.mp4` IS the "video output" placeholder — it stands in for every
video-playback beat (Figma frames 1/2/6/10/11/12) until the real launch render is dropped in.
Live HF sub-comps carry the terminal beats (Figma 3-5, 7-9) and the outro (Figma 14-17).
Figma frame 13 ("Music + SFX Now Free…") is **deleted** per direction.

| Act | id | type | start | dur | media-start | beat | seam OUT |
|----|-----|------|-------|-----|------|------|----------|
| **1 · Intro** | `sec-intro` | `intro.mp4` | 0.0 | 10.4 | 0 | Silent "Click SFX" spam → sound-rings in silence → **Boring.** → "you had to **find** them yourself" → **That changes today.** | center mask-open @10.4 |
| **2 · Terminal: SFX** | `sec-term-sfx` | comp | 10.4 | 6.8 | — | window opens from center; types the SFX prompt → `thinking…` → reply; +0.5s read hold; animated pet types | **EXPLODES out** @16.9 (scale↑ + blur + fade) |
| **3 · Replay + SFX** | `sec-replay1` | `intro.mp4` | 16.9 | 3.0 | 1.3 | the CLICKING, replayed — **click SFX lands here** | mask-open music @19.6 |
| **4 · Terminal: Music** | `sec-term-music` | comp | 19.6 | 6.8 | — | window opens; types *"find me a soundtrack with a nice bounce"* → reply; +0.5s read hold; animated pet types | **EXPLODES out** @26.1 |
| **5 · Replay + Music** | `sec-replay2` | `intro.mp4` | 26.1 | 2.1 | 1.1 | the clicking, replayed — **music bed lands here** | LEFTWARD cut-the-curve @28.0 (swipes off left) |
| **5.5 · Text card** | `sec-available` | comp | 28.0 | 3.0 | — | intro's leftward-cut grammar: B1 *"Music and SFX"* → cut → B2 *"Now available for **free** with the HeyGen API"* (bold; **free** = bright clay #D97757) | swipes off left @30.9 |
| **6 · Outro** | `sec-outro` | comp | 30.9 | 4.9 | — | **HyperFrames `</>` mark liquid-fills cyan→green → EXPLODES out → reverse-implodes into the HeyGen·HyperFrames lockup → holds ~1s → EXPLODES out** (exit, ends on cream) | end |

End = **35.8s**. z-index: intro 1 · replay1 2 · term-sfx 3 · replay2 4 · term-music 5 · available 6 · outro 7.
Terminal **EXPLODE-out** seam = `scale 1.55 + blur(18px) + opacity 0`, `power2.in`, 0.34s (ollama push-out grammar).

---

## Seam grammar (stolen from claude-paper)

- **Center mask-open** (into a terminal): the dark window scales up from a point at frame center
  (`scale 0.04 → 1`, `opacity 0 → 1`, **expo.out**, ~0.6s) on the cream ground — "the window
  materializes." This is the move called out in the brief.
- **Window recede / zoom-through** (out of a terminal): window `scale 1 → 0.82` + `blur(0→14px)` +
  fade, `power3.in`, ~0.32s; the video underneath (lower z-index, already at its `data-start`) is
  revealed. Optional subtle `scale 1.04 → 1` settle on the incoming video.
- **Cut-the-curve / inverse zoom-through** for video→outro: replay recedes, the outro marks enter
  from `scale 1.18 + blur` settling `expo.out`.
- Cream `#F0EEE6` is the body ground behind every section, so exposed edges stay seamless.

z-index (later = on top): intro 1 · replay1 2 · term-sfx 3 · replay2 4 · term-music 5 · outro 6.
Terminals always sit ABOVE their adjacent video so the recede reveals the clip beneath.

---

## On-screen copy (verbatim — confirm before lock)

**Act 2 — SFX terminal**
- User: `Lets add sound effects for the mouse clicks and a subtle pulse sound for the animation that follows each click.`
- Agent: `I'll search HeyGen's audio library for SFX that fit.` / `Loading mouse clicks / text typing / subtle whooshes` / `Applying to HyperFrames render…`

**Act 4 — Music terminal**
- User: `Perfect. Can you find me a soundtrack with a nice bounce to it?`
- Agent *(Figma frame 9 still held the SFX text — NEW draft, confirm):*
  `On it — searching HeyGen's music library.` / `Found one: warm, upbeat, ~110 BPM.` / `Scoring your render now…`

Terminal chrome: traffic-lights · `Local` / `Documents` chips · composer placeholder
`Describe a task or ask a question` · `Auto` amber pill · `+` · mic · `Opus 4.8` · `High` · orb.
**Animated pixel pet** (`assets/pet-typing.mp4`, ported from `hf-ollama-v7`) perched on the prompt's
top-right edge, typing throughout BOTH terminals — looped as two clips (0–5.27s, 5.27–6.3s).

---

## Audio cue map (for the post sound pass — film ships silent)

| film time | cue | source |
|-----------|-----|--------|
| 0.0–10.4 | **SILENCE** (the joke; do not fill) | — |
| Act 2 ~11.0–16.4 | (optional) soft keystroke ticks on the typed prompt | — |
| Act 3 ~16.7–19.4 | mouse-click SFX on each cursor tap; keystroke ticks; card-exit whooshes | the SFX being sold |
| Act 4 ~19.7–25.1 | (optional) quiet keystroke ticks on the typed prompt | — |
| Act 5 ~25.1–27.2 | **music bed in** (warm, bouncy ~110 BPM) + clicks continue | the soundtrack being sold |
| Act 5.5 ~27.0–30.0 | music continues under the text card; soft swipe whooshes on the two cut-the-curves | — |
| Act 6 ~29.9–34.1 | music tail under the logo; liquid-fill swell + a confirm sting on the lockup snap | — |

Replays show `intro.mp4` media **1.1–4.1s** — the click run (taps at media ≈1.2s, 1.7s, then
2.3→4.1s every ~0.2s). Drop click SFX on those taps. Re-pull exact tap times from `intro.mp4`
if tightening.

---

## Assets
- `assets/intro.mp4` — the 10.4s silent hook render (Act 1 + both replays; trim via `data-media-start`).
- `assets/pet-typing.mp4` — animated orange pixel pet typing (5.27s, from `hf-ollama-v7`); looped in both terminals.
- `assets/heygen-hyperframes-lockup.png` — 3090×1148 transparent · Act 6 lockup (F16).
- `assets/heygen-logo.png` — transparent HeyGen primary logo (F17 end card).
- `assets/playmark-frame14.png` — 1920×1080, ink play-mark on cream (F14/15 build).
- `fonts/` — Hanken Grotesk · Galaxie Copernicus · Newsreader · Spline Sans Mono woff2 + `fonts.css`.
- Act 1 now plays the LIVE comps (`button-spam` 0–4.9 → `boring` 4.9–5.6 → `until-now`
  5.6–10.4) — `intro.mp4` is used ONLY by the two replay slices (media offsets unchanged).

## Build / verify loop
```
export BUN_INSTALL="$HOME/.bun"; export PATH="$BUN_INSTALL/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"
unset HYPERFRAME_RUNTIME_URL
npx hyperframes lint .
npx hyperframes snapshot . --frames 14      # contact sheet — iterate here
npx hyperframes render . -o "$PWD/renders/sfx-music-launch-v2.mp4" --fps 30 --quality high
```
Video/scroll/onUpdate motion is real only in a render — verify with ffmpeg frame-pulls.
