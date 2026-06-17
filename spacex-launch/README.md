# HyperFrames × Grok — "HyperFrames by HeyGen" launch video

An HTML-as-video launch film built with [HyperFrames](https://github.com/heygen-com/hyperframes).
Flow: connector morph → chat prompt → Grok answers → follow-up request →
"Making your video…" → SpaceX result card ($1.0T valuation count-up) → outro.

**Final render:** [`renders/hyperframes-spacex-launch_1080p60.mp4`](renders/hyperframes-spacex-launch_1080p60.mp4) — 39.5s, 1920×1080 @ 60fps, VO + music + SFX baked in.

## Render it yourself

Requires Node.js ≥ 22 and FFmpeg. No local install step — everything runs through `npx`.

```bash
npx hyperframes lint .                                   # validate
npx hyperframes inspect .                                # layout/overflow check
npx hyperframes preview                                  # live studio preview
npx hyperframes render . --quality high --fps 60 \
  --output renders/hyperframes-spacex-launch_1080p60.mp4 # final delivery
```

## Layout

- `index.html` — master timeline: sections + seam transitions (crossfades, cut-the-curve, zoom-through) and the full audio bed (music / SFX / VO tracks).
- `compositions/` — one HTML sub-composition per scene (each a paused, seek-safe GSAP timeline):
  - `connector-morph.html`, `chat-response.html`, `response-scroll.html`, `followup-type.html`,
    `thinking-big-2.html`, `compose-tasklist.html` (the SpaceX result card), `outro.html`.
  - `apple-money-count.html` is an installed registry block; the result card now ports its
    count-up pattern inline, so the file itself is no longer wired in.
- `assets/`, `fonts/` — images, SFX source, and embedded fonts.
- `*.mp3` (root) — music bed, click/keyboard/toggle SFX, and `voiceover_explainer.mp3` (the result-card narration).
- `_backups/` — earlier Tesla-themed cut, kept for reference.

## Audio

- `voiceover_explainer.mp3` — result-card VO (ElevenLabs). Current voice: **George** (British male).
- `launch-music-trimmed.mp3` — music bed. `mouse-click.mp3` / `keyboard-typing.mp3` / `bass-drop-1.mp3` — SFX.
