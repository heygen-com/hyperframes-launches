# Texture Launch Video

Standalone HyperFrames video project extracted from the HyperFrames repo worktree.

## Contents

- `index.html` - main composition source
- `hyperframes.json` - HyperFrames project config
- `assets/gsap.min.js` - local GSAP runtime used by the composition
- `assets/texture-mask-text/` - texture mask assets used by the text scenes
- `assets/vfx/shadertoy-frostbyte-dof.mp4` - shader background footage
- `canva-trend-references/` - lightweight placeholder reference images for collage/photo cards
- `compositions/domain-warp-dissolve.html` - registry transition block reference
- `renders/` - final rendered MP4s, when present

## Commands

```bash
npx hyperframes validate .
npx hyperframes preview .
npx hyperframes render . --output renders/texture-launch-video.mp4
```

## Notes

This folder intentionally excludes the HyperFrames monorepo internals such as `packages/`, `docs/`, `registry/`, `skills/`, and repository config. It is meant to be copied into another launch-video repo as a self-contained composition.

The original `canva-trend-references/*.png` source folder was not present when this clean project was extracted, so this package includes placeholder PNGs to keep the composition portable and renderable. If you find the original reference folder later, drop it in here and overwrite the placeholders.
