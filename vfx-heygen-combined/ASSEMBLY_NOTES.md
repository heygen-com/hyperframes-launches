# VFX + HeyGen Combined Assembly

## Purpose

This project is the isolated workspace for combining:

- `/Users/jakemoran/Desktop/CC/projects/active/vfx-text-cursor`
- `/Users/jakemoran/Desktop/CC/projects/active/heygen-iphone-canvas-test`

The original projects should remain untouched. Edit files in this project when building the combined version.

## Working Files

- `index.html` starts as a copy of the current HeyGen iPhone Canvas Test composition.
- `assets/` and `models/` are copied from the HeyGen project so its current late beats keep working.
- `source-projects/vfx-text-cursor/` is a local source copy of the VFX text cursor project.
- `source-projects/heygen-iphone-canvas-test/` is a local source copy of the original HeyGen project for comparison.

## Intended Assembly

1. Start with the VFX text cursor composition.
2. Hold the `now available` / `HyperFrames` state for about 3 seconds.
3. Transition upward with motion blur into the HeyGen phone entrance.
4. Compress or shift only the early HeyGen phone entrance as needed.
5. Preserve the later HeyGen beats, including the prompt/send-button beat, chromatic split, CTA, portal reveal, and `assets/hyperframes-dark.svg` ending.
