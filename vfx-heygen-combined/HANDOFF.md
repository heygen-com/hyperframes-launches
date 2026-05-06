# HeyGen iPhone Canvas Test — Handoff

## Project

HyperFrames project:

`/Users/jakemoran/Desktop/CC/projects/active/heygen-iphone-canvas-test`

Primary composition:

`index.html`

Preview:

`http://localhost:3013/#project/heygen-iphone-canvas-test`

Important workflow preference: keep using the actual HyperFrames Studio preview in Chrome/local host. Do not render unless explicitly requested.

## Current Composition

The composition is currently `7.5s`.

It has two major sections:

1. A 3D iPhone over the supplied video background.
2. A zoomed prompt-box scene that types the HyperFrames update command and clicks the real orange send button.

The iPhone section uses:

- `models/iphone.glb`
- `assets/bg.mp4`
- `assets/pointing-finger-clean.png`
- `captures/heygen-mobile/screen-strip.png`

The phone screen uses the captured HeyGen mobile page strip. The scroll is driven by `S.scroll` and currently goes near the bottom of the captured page:

```js
tl.to(S, { scroll: 0.9, duration: 2.45, ease: "power1.out" }, 2.05);
```

## Current Animation Beats

Phone / hand sequence:

- Phone starts below frame and slides up.
- Large angled finger enters from the lower right.
- Finger swipes up.
- Phone begins spinning during the swipe.
- Phone scroll continues through the spin.
- Phone push-in/rotate happens after the spin.
- Phone exits left into the prompt scene.

Prompt transition:

- Phone exit starts around `4.04s`.
- Prompt scene starts around `4.08s`.
- Phone opacity fades quickly now so it does not show through the prompt box:

```js
tl.to("#theater", { opacity: 0, duration: 0.18, ease: "power2.out" }, "phoneExit");
```

Prompt scene:

- Prompt app starts zoomed in:

```js
gsap.set("#prompt-app", { scale: 3.15, x: 560, y: -120 });
```

- It types:

```text
npx hyperframes upgrade
```

- The camera pan now uses one continuous accelerating move:

```js
tl.to("#prompt-app", {
  x: -1260,
  duration: 1.6,
  ease: "power1.in"
}, 4.13);
```

- The surrounding prompt UI fades/blurs away around `5.41s`.
- The real `.prompt-send` button scales and moves while the cursor approaches.
- The cursor clicks the actual `.prompt-send` button. There is no fake button clone anymore.

Current send button/cursor cluster:

```js
tl.to(".prompt-send", {
  x: 0,
  y: -95,
  duration: 0.22,
  ease: "power2.out"
}, 5.51);

tl.to(".prompt-send", {
  scale: 3,
  boxShadow: "0 12px 34px rgba(217, 119, 87, 0.42)",
  duration: 0.22,
  ease: "power3.out"
}, 5.51);
```

## Visual / Motion Preferences Learned

- Use the real HyperFrames Studio for review, not a fake preview wrapper.
- The user prefers scrubbing in Studio over renders during iteration.
- Cut-the-curve transitions should feel like matched fast position/blur handoffs.
- Avoid opacity popping: opacity often needs to be separated from position/blur.
- Avoid mechanical linear camera motion. The prompt camera pan should feel like it starts with typing and ramps into the send-button action.
- The prompt send button must be the real `.prompt-send` element, not a clone.
- When scaling the send button, clear the surrounding prompt UI rather than masking the button with a fake overlay.

## Next Intended Beat

After the cursor clicks the send button:

1. The orange send button should slide upward.
2. The cursor should slide upward with it.
3. Use an upward cut-the-curve transition.
4. New text should come on below, using the same cut-the-curve style animation.
5. Draft line:

```text
HTML in Canvas unlocks new possibilities for motion graphics that have never been seen before
```

The next beat should likely begin right after the click release, currently around `6.36s` to `6.52s`.

The likely direction:

- Start the send button and cursor upward exit after the click bounce.
- Add blur and opacity ramp as they exit.
- Bring the text on from below with the matching inverse upward cut-the-curve.
- Keep the timing energetic, but avoid a hard opacity pop.

## Follow-Up Reference

The user said the next section will “steal from the shader”, then build another beat from there.

Likely candidate project/source to inspect next:

`/Users/jakemoran/Desktop/CC/projects/active/shaderpark-ripple-dipple`

Before implementing that next beat, inspect that shader project and decide which visual element or transition should be borrowed.

## Validation

Current `npm run check` status:

- 0 lint errors
- 0 validation errors
- 0 layout issues
- Expected warnings only:
  - `composition_file_too_large`
  - GLTFLoader custom UV warnings from `iphone.glb`

