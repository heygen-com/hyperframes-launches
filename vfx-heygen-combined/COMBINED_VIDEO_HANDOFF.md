# Combined Video Handoff

## Goal

Combine these two HyperFrames projects into one video:

- First composition: `/Users/jakemoran/Desktop/CC/projects/active/vfx-text-cursor`
- Second composition: `/Users/jakemoran/Desktop/CC/projects/active/heygen-iphone-canvas-test`

The combined video should start with the VFX text cursor piece, then transition into the HeyGen iPhone Canvas Test piece we have been iterating on.

## Current HeyGen Project State

Primary file:

`/Users/jakemoran/Desktop/CC/projects/active/heygen-iphone-canvas-test/index.html`

Current duration:

`21s`

Important current late beats:

- `The game has changed` text appears after the prompt/send-button beat.
- A WebGL chromatic RGB layer split follows.
- A black CTA beat appears:

```text
Upgrade
to try it now
```

- A portal shader reveal then consumes that CTA frame and reveals a white frame with the dark HyperFrames logo:

`assets/hyperframes-dark.svg`

Last known validation:

- `npm run check` passes.
- Expected warnings only:
  - `composition_file_too_large`
  - GLTFLoader custom UV warnings from `iphone.glb`

## Next Assembly Plan

1. Use `vfx-text-cursor` as the first composition in the combined video.
2. Cut the VFX text cursor sequence so the `now available` and `HyperFrames` text is only on screen for about `3s`.
3. After that 3-second hold, start an upward cut-the-curve transition from the VFX text cursor into the first beat of the HeyGen iPhone Canvas Test.
4. The transition should move the VFX glass frame and VFX text upward with blur/velocity, while the HeyGen phone simultaneously slides upward into frame.
5. This means the HeyGen phone entrance will need to be retimed faster than it is in the standalone HeyGen project.
6. The intent is to mirror the existing cut-the-curve logic already used inside the HeyGen project for the phone-to-prompt-box transition: fast matched motion, blur at the handoff, no hard opacity pop.

## Transition Notes

- Treat the VFX glass frame/text and the HeyGen phone as two halves of one upward motion.
- The VFX layer should accelerate upward and blur out.
- The HeyGen phone should enter from below on the same directional path and decelerate into its first visible pose.
- Avoid a simple crossfade. The user wants the motion handoff to carry the transition.
- Keep opacity separate from position/blur so the transition does not pop.
- The phone entrance currently starts around the beginning of the HeyGen timeline and may need to be compressed/shifted to land correctly after the VFX transition.

## Warnings For Next Agent

- Use HyperFrames Studio preview for iteration. The user prefers scrubbing in Studio over rendering during edits.
- The old `HANDOFF.md` in this folder is stale in duration and next-beat details. Use this document for the combined-video plan.
- The HeyGen `index.html` is large. Be careful with broad edits; prefer targeted timeline/CSS changes or split into sub-compositions if doing major assembly work.
- The current HeyGen file includes several WebGL systems:
  - Three.js iPhone render
  - WebGL chromatic split
  - WebGL portal reveal
- Do not remove or replace those systems while doing the assembly unless explicitly asked.
- When adjusting the first HeyGen phone beat, preserve the later phone-to-prompt transition timing unless the combined transition requires a global retime.
- The portal ending depends on `assets/hyperframes-dark.svg`; keep that asset path valid if moving files.
- If `npm run check` needs network to fetch HyperFrames, rerun with network approval if the sandbox reports `ENOTFOUND`.

