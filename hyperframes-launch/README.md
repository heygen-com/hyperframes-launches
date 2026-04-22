# HyperFrames Launch Video

<p align="center">
  <img src="docs/preview.gif" alt="First 5 seconds of the launch video" width="600">
</p>

The composition source for HeyGen's HyperFrames launch video — a real production project you can clone, preview, and render yourself. Use it as a worked example of how to assemble a non-trivial video in [HyperFrames](https://github.com/heygen-com/hyperframes).

- **Duration:** 49.77s
- **Resolution:** 1920×1080 @ 30fps
- **Structure:** 1 root composition (`index.html`) + 17 sub-compositions wired together
- **Techniques on display:** CSS animations, GSAP, Lottie, shaders, Three.js, footage compositing, captions, SFX

## Prerequisites

- Node.js >= 22
- FFmpeg

That's it. No package install step — HyperFrames runs via `npx`.

## Quick start

```bash
git clone git@github.com:heygen-com/hyperframes-launch-video.git
cd hyperframes-launch-video

npx hyperframes preview        # opens the studio in your browser
npx hyperframes render         # renders index.html → MP4 in ./renders/
```

Useful variants:

```bash
npx hyperframes render --quality draft        # ~fast, for iteration
npx hyperframes render --workers 1            # sequential capture (stable on video-heavy comps)
npx hyperframes lint                          # report issues in compositions
```

See the full CLI reference: `npx hyperframes --help` or the [CLI docs](https://hyperframes.heygen.com/packages/cli).

## Project layout

```
index.html            Root composition — timeline, audio tracks, sub-composition slots
compositions/         Sub-compositions referenced from index.html
  glass-intro.html    Opening sequence (figma-glass-frame, ~15s)
  flex-*.html         The "drop in X" montage — CSS, GSAP, Lottie, shaders, Three.js…
  thesis.html, cta.html, engine.html, …
assets/               Video, audio, and image media
meta.json             Duration, resolution, fps
HANDOFF.md            Production notes — what was changed, why, what's still open
SCRIPT.md             Voiceover script
STORYBOARD.md         Scene-by-scene direction
```

## Learn more about HyperFrames

- **Repo:** https://github.com/heygen-com/hyperframes
- **Docs:** https://hyperframes.heygen.com
- **Agent skills** (recommended for authoring with Claude Code / Cursor / etc.):

  ```bash
  npx skills add heygen-com/hyperframes
  ```

  Then invoke `/hyperframes` to author compositions, `/hyperframes-cli` for CLI help, and `/gsap` for animation.

## Notes on this project

- The rendered video uses voiceover + SFX but no continuous underscore music track. If you're extending this example, add an `<audio>` element referencing your music file to `index.html`.
- `npx hyperframes lint` surfaces a few pre-existing warnings (overlapping clips, GSAP tween overlap). The render still produces correctly; these are documented in `HANDOFF.md` as known punch-list items.

## License

The HyperFrames framework is [Apache 2.0](https://github.com/heygen-com/hyperframes/blob/main/LICENSE). This repository's composition source and media are published for reference use.
