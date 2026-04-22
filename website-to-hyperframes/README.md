# website-to-hyperframes — Demo Launch Video

The launch video for the `website-to-hyperframes` skill — a 41.8s, 1920×1080, 30 fps
piece that shows four AI coding agents typing the same single prompt
("website → video"), then cuts to a music-drop capability reel of real web-to-video
outputs, and closes on the install command.

Built entirely with [HyperFrames](https://hyperframes.heygen.com) — HTML compositions,
GSAP animations, captured `<video>` clips, and a single render command. No timeline
editor, no After Effects. The whole thing is deterministic; `npx hyperframes render`
reproduces it frame-for-frame.

- **Duration:** 41.8s
- **Resolution:** 1920×1080 @ 30fps
- **Structure:** 1 root composition (`index.html`) + 2 sub-compositions + 11 captured clips
- **Techniques on display:** GSAP, CSS, captured `<video>` compositing, per-beat VO + SFX, kinetic typography

## Prerequisites

- Node.js >= 22
- FFmpeg

That's it. No package install step — HyperFrames runs via `npx`.

## Quick start

```bash
git clone <this-repo>.git website-to-hyperframes-demo
cd website-to-hyperframes-demo

npx hyperframes preview        # opens the studio in your browser
npx hyperframes render         # renders index.html → MP4 in ./renders/
```

Useful variants:

```bash
npx hyperframes render --quality draft        # fast, for iteration
npx hyperframes render --workers 1            # sequential capture (stable on video-heavy comps)
npx hyperframes lint                          # report issues in compositions
```

Render takes ~3.5 min on an M2 across 6 worker processes. Output is a 1920×1080 30 fps
H.264 MP4 with baked-in music/VO/SFX at –14 LUFS.

See the full CLI reference: `npx hyperframes --help` or the [CLI docs](https://hyperframes.heygen.com/packages/cli).

## Project layout

```
index.html                    Root composition — timeline, audio tracks, sub-composition slots
meta.json                     Duration, resolution, fps
SCRIPT.md                     Final narration script (the text that was spoken)
STORYBOARD.md                 Beat-by-beat creative plan
compositions/
  act-1-cold-open.html        (0.0–12.0s) Four-IDE typing + "any site becomes video"
  act-3-clips/                (12.0–33.8s) 11 captured web-to-video clips
    a3-01-stripe.mp4 … a3-11-github.mp4
  act-4-end-card.html         (33.8–41.8s) HyperFrames wordmark + install cmd
audio/
  vo/                         19 per-beat narration takes + regenerate tooling
  sfx/                        keyboard typing, mouse click, bass drop
  music-candidates/           the music bed
fonts/                        Inter, JetBrains Mono, Bungee Shade
logos/                        Claude, Codex, Cursor, Gemini marks (used in Act 1)
```

## Act breakdown

| Act | Window | What happens |
|---|---|---|
| **1** | 0.0 – 12.0s | Cold open. `$ npx skills add heygen-com/hyperframes` types into a Claude-code terminal, morphs into 4 IDE skins (Claude, Cursor, Codex, Gemini) all typing natural "make me a video" prompts, scatters into a 2×2 grid, and reveals *"Now — any site becomes video."* |
| **3** | 12.0 – 33.8s | Music drop. 11 real web-to-video capability clips, each labeled top-left (`01 · Product Launch / stripe.com` style) with narration-synced bottom caption. |
| **4** | 33.8 – 41.8s | HyperFrames wordmark, `Give your agent a URL`, install command revealed. |

Act 2 was prototyped and cut.

## Regenerating the voiceover

The shipped VO is ElevenLabs "Rachel". To swap in a different voice (cloned voice,
different ElevenLabs take, HeyGen Starfish TTS, etc.), see
[`audio/vo/REGENERATE.md`](audio/vo/REGENERATE.md) — it documents the per-line script,
target durations, and includes a one-shot script that regenerates all 19 lines in
place with matching filenames.

## Learn more about HyperFrames

- **Repo:** https://github.com/heygen-com/hyperframes
- **Docs:** https://hyperframes.heygen.com
- **Agent skills** (recommended for authoring with Claude Code / Cursor / etc.):

  ```bash
  npx skills add heygen-com/hyperframes
  ```

  Then invoke `/hyperframes` to author compositions, `/hyperframes-cli` for CLI help,
  and `/gsap` for animation.

## Credits

- **Voiceover** — ElevenLabs, voice "Rachel". 19 per-beat takes in [`audio/vo/`](audio/vo/).
- **Music** — *Strong Character — Powerful Fuzz (Action Sport Rock)* by
  [LightStockMusic](https://pixabay.com/users/lightstockmusic-32090305/) via Pixabay
  ([track 513742](https://pixabay.com/music/main-title-strong-character-powerful-fuzz-action-sport-rock-513742/)) — Pixabay Content License. Trimmed 3s from the head so the natural drop at file-time 15s lands at timeline 12.0s (Act 3 open).
- **SFX** — Pixabay Content License (`audio/sfx/` — keyboard typing, mouse click, bass drop).
- **Act 3 clips** — captured with `npx hyperframes capture` from the originating
  websites (stripe.com, tailwindcss.com, framer.com, spotify.com, heygen.com, vercel.com,
  vibecode.app, linear.app, dribbble.com, github.com); trimmed to beat length with `ffmpeg`.
  Brand marks and UI shown are property of their respective owners and are used here as
  illustrative capability examples only — consistent with fair-use "this is what the
  framework can do" editorial purpose. **If you fork this project to ship as your own
  launch, replace these clips with captures of sites you have rights to.**
- **Fonts** — Inter (SIL OFL 1.1), JetBrains Mono (Apache 2.0), Bungee Shade (SIL OFL 1.1).

## License

The composition source (`README.md`, `SCRIPT.md`, `STORYBOARD.md`, `index.html`,
`compositions/*.html`, and all animation code) is released under **MIT**.

Bundled media retains its own license as noted in Credits — Pixabay Content License
for music + SFX permits free commercial use without attribution, and the captured
clips in `compositions/act-3-clips/` contain third-party brand content used editorially.

If you fork this for your own launch video, the animation code (HTML + GSAP + timing
data) is yours to reuse under MIT; swap the media before shipping.
