# Timeline Editor Launch v2 — Handoff

## What this project is

A ~34s launch video for the Hyperframes **Timeline Editor**. v2 is a fork of `timeline-editor-launch` that now extends through five+ acts:

1. **Act 0** (0 – 6.7s) — intro VO, word conveyor ending on "timing is 🔔 tricky", bell Lottie + SFX.
2. **Act 2a** (6.7 – 9.6s) — first Claude chat ask ("move the sound effect 0.1s earlier"). Claude "Done." now snaps in (no cursor, no typing).
3. **Act 0b** (9.6 – 12.1s) — reprise of "timing is tricky" + tighter bell.
4. **Act 2b** (12.1 – 15.75s) — 29-prompt spiral with blur ramp; last 0.45s is a cut-the-curve EXIT (content accelerates UP + 10px blur) that pairs with Act 3's entry.
5. **Act 3** (15.75 – 23.2s) — scene-B decelerates UP from matched 10px blur → mask-reveal "Not Anymore" (hold 0.9s) → exit left → "Just use the timeline" slides in → orange pill grows symmetrically → pill compacts into timeline bar → cursor slides up from bottom-left, clicks, drags pill across screen (click fires click-sfx at 20.78s; drag triggers Act 4).
6. **Act 4** (21.0 – 26.7s) — studio screen recording (`Fixedsfx.mp4` → `final-video.mp4`) with zoom-through entry (scale 1.45→1, blur 14→0 via custom `entryEase = -0.806t² + 1.806t`).
7. **Act 5** (26.7 – 31.1s) — "Save some time / Save some credits / Just click & [drag]" three-row reveal. Each row slides up from a per-row mask, staggered. On VO end-words: "time" 3D-flips to reveal the clock PNG, "credits" gold-shimmer gradient wipe, cursor clicks the orange pill and drags it off-screen left (pill widens to ~2200px). Last 0.45s: cut-the-curve EXIT (scene slides left + 10px blur).
8. **Act 6** (31.1 – 33.8s) — Hyperframes / HeyGen logo reveal. Cut-the-curve LEFT entry (stage decelerates from x:+280, blur 10px). VO "Hyperframes" cue fades in `logo-a` (clipped to show the big bottom wordmark only via `clip-path: inset(53% 0 0 0)`). VO "HeyGen" cue fades in `logo-b` (full SVG overlays — mark + top "Hyperframes by HeyGen" lockup text appear).

Root duration: **33.8s**. Body bg is `#f5f5f7` so any inter-act gaps read as warm white, not black.

## Where it runs

- Project root: `/Users/jakemoran/Desktop/CC/projects/timeline-editor-launch-v2/`
- Studio preview: `http://localhost:5190/#project/timeline-editor-launch-v2`
  - Served via a symlink at `hyperframes/packages/studio/data/projects/timeline-editor-launch-v2` → project dir.
  - Launch config in `.claude/launch.json` as `timeline-editor-launch-v2` (port 5228, unused in practice — we share the 5190 studio).
- **Render via local HF source, not npx.** `npx hyperframes` still resolves to the cached npm package (0.4.12) and misses `fix(core): restore nested seek scrubbing`. Use:
  ```
  /Users/jakemoran/.bun/bin/bun run --cwd /Users/jakemoran/Desktop/CC/hyperframes \
    packages/cli/src/cli.ts render --workers 3 \
    --output /Users/jakemoran/Desktop/CC/projects/timeline-editor-launch-v2/renders/timeline-editor-launch-v2.mp4 \
    /Users/jakemoran/Desktop/CC/projects/timeline-editor-launch-v2
  ```
  Pinned HF version: **0.4.13-alpha.2** (commit `29b6274`). 3 workers is the sweet spot — 6 workers OOMed Chrome around frame 780 (act3 pill-expansion frames).
- **Do not auto-render after edits.** Only when Jake says "render it" / "ship it" / explicit ask.

## Upcoming work — three structural changes

Jake has flagged three rewrites for the next session. Don't start these until you've read the current act compositions and understand where the seams are.

### 1. Group-based word slides in Act 0 (currently per-word)

`compositions/act0-intro-bell.html` uses a cluster-centered word conveyor: words slide in one at a time from the right at their VO onset, and the oldest word evicts left when the cluster exceeds `MAX_CLUSTER_WIDTH`. Jake wants this replaced with **group-based** slides:

- Split the VO script into groups that each fit within the safe frame padding (roughly ≤1600px wide, same as today's cluster cap — but grouped by meaning/breath, not by width).
- When the first word of a group is spoken, the **entire group** slides on together. Hold through the group's VO.
- When the **next group's first word** starts, the current group slides off left *entirely, all at once*, while the new group slides on from the right.
- No per-word eviction, no trio-collapse math, no cycle loop. Just group-in → group-out → next.
- Keep the "timing is tricky" + bell split/shake at the end — that's its own beat and the Lottie/SFX sync already works.

Implementation notes:
- VO timings are in `act0-intro-bell.html` (search for `WORD_STARTS` and the per-word tweens) and the VO file is `assets/vo-intro.mp3`. Start by laying out the proposed groups against the existing `WORD_STARTS` timing — the VO hasn't changed.
- The existing cluster measurement code (lines ~175-200, `leftEdgeInLine` / `rightEdgeInLine` / `trioCenterCollapsed`) can go. Each group can be a single `<div>` with natural inline width, centered via `x` tween from off-screen-right to center, then off to off-screen-left.
- Keep font/size/weight identical to what's on screen now.

### 2. Persistent chat UI across Acts 2a / 0b / 2b

Jake's colleague wants the three chat sections to feel like **one continuous chat session** instead of three separate screens with different backgrounds. Concept:

- The **Claude prompt composer** UI slides in **from the bottom of the Act 0 scene** while "timing is tricky" is still on-screen (no cut to a new beige background).
- First interaction plays: user types the prompt, send-button pulses, Claude responds with "Done." (still the snap, no typing cursor).
- Then the "timing is tricky + bell" sequence replays **above** the composer — the reprise happens in the same scene, composer stays parked at the bottom.
- After the reprise, the chat thread above the composer begins to populate with the full spiral sequence (the 29 prompts) — messages push upward as they accumulate, eventually scrolling the "timing is tricky" text off the top of the frame.

Key constraint: we only lift the **chat box UI** (composer + thread bubbles) out of today's sub-compositions. The background for the whole sequence is the same warm white intro scene — no more `#F5F4ED` chat-app background, no more topbar/model-pill chrome. Bubbles float on the intro background.

This means act2a, act0b, and act2b as they exist today will be merged / rewritten. The Lottie bell and bell-SFX cues need to stay synced to their current absolute times (6.25s for Act 0 bell, 10.89s for Act 0b bell) — those are audio-driven and shouldn't drift because the DOM got restructured.

Files to touch:
- `compositions/act2a-first-ask.html` — extract composer markup + first-ask timeline.
- `compositions/act0b-reprise.html` — probably disappears; the reprise beat moves into the merged scene.
- `compositions/act2b-spiral.html` — extract the thread-population logic; keep the scroll-up / blur-ramp pacing. Today's cut-the-curve EXIT at 3.2-3.65s local still needs to hand off to Act 3 with matched `y:-280 blur:10px` (but see change #3 — that handoff may go away).
- `index.html` — collapse the three acts into one wrapper (one sub-comp or, if timeline complexity balloons, a master controller comp). Preserve bell-sfx data-starts.

### 3. Spiral-into-video transition (retire Act 3 in its current form)

When the 29-prompt spiral hits its blur peak, instead of cutting to Act 3's "Not Anymore" reveal, Jake wants:

- The messages column continues to **scroll upward** past the final hold frame, pushing the "timing is tricky" big text **up and off the top** of the frame along with the chat bubbles.
- As the stack clears the top edge, **transition directly into Act 4's video** (`assets/final-video.mp4`, the studio screen-recording). The video's existing zoom-through entry (scale 1.45→1, blur 14→0 on `#act4-final-video`) still fires, but is now triggered by the spiral's upward scroll reaching a threshold — not by a cursor click on a timeline bar.

This rewires the Act 3 → Act 4 seam. Act 3 as it exists today ("Not Anymore" reveal → "Just use the timeline" → pill → cursor-drag → click-triggers-video) goes away. The `click-sfx` at 20.78s and the cursor sequence in Act 3 are dropped.

Implementation notes:
- Master timing for when Act 4's video kicks in will be recomputed once the spiral's scroll-off duration is chosen.
- `vo-not-anymore.mp3` (currently triggered at 16.2s) likely gets repurposed or removed — confirm with Jake before deleting.
- Act 4 itself doesn't need to change much; the video element at root of `index.html` (id `act4-final-video`, `data-start="21.0"`, `data-duration="5.7"`) stays, just retime `data-start` to the new seam.

## What's working that shouldn't get touched without good reason

- **Bell Lottie load pattern** (lines 150-170 of `act0-intro-bell.html` and matching block in `act0b-reprise.html`). Uses `fetch('assets/bell.json')` — this path works in both studio preview AND render (both return raw JSON). Earlier we used `../files/assets/bell.json` which 404'd during render; don't revert to that. The `goToAndStop` stub + GSAP-driven frame tween is fragile; leave it.
- **Act 4 video at root of `index.html`.** HF won't drive `<video>.currentTime` unless the element is a direct child of the root composition (confirmed experimentally — wrapping the video inside `act4-video.html` caused it to freeze on frame 0). The sub-comp only owns the entry animation, which targets `#act4-final-video` by ID in the parent document.
- **Cut-the-curve seams** at Act 2b→3 (upward) and Act 5→6 (leftward). Both rely on **matched 10px blur at the boundary** and opposite-direction offsets (one side off at `-280`, other entering from `+280`). Don't adjust one side without adjusting the other.
- **`#f5f5f7` body bg** in `index.html`. This is what kills the black-flash at cut-the-curve boundaries — if you see `background: #000` come back, something reverted.
- **Pill centering via `xPercent: -50 / yPercent: -50`** set at time 0 in `act3-not-anymore.html`. Without it, the pill grows asymmetrically from its flex-layout position (left edge stays pinned, right edge grows) and creates a "pause then explode" leftward reveal. Jake specifically flagged and fixed this — don't revert.
- **`overwrite: "auto"` on the cursor `x` tweens** in Act 3 (arrival and drag). Without them HF's lint flags overlapping transforms and GSAP's tween resolver can pick the wrong tail value.

## Assets inventory

- `assets/vo-intro.mp3` — full intro VO (5.44s).
- `assets/bell.json` / `bell.lottie` — Lottie bell (patched with empty `fonts`/`chars`/`meta` for lottie-web compat).
- `assets/bell.mp3` — notification-bell SFX (swapped in for the earlier alex_jauk bell ring).
- `assets/click-sfx.mp3` — cursor click, used in both Act 3 drag and Act 5 drag.
- `assets/final-video.mp4` — Fixedsfx (studio screen recording, 5.7s).
- `assets/bgmusic.wav` — Detroit Jam (MA_EchoVerse, trimmed to 34s at 44.1kHz stereo PCM). Don't re-encode to mp3 — earlier attempts played choppy.
- `assets/clock.png` — the clock PNG for the Act 5 "time" transform (currently 320×320 in the scene).
- `assets/vo-not-anymore.mp3` — trimmed "Not Anymore" (1s of silence cut out of the gap between "Not" and "Anymore" to match shortened hold). Likely goes away with change #3.
- `assets/vo-save-time.mp3` — "Save some time / Save some credits / Just click & drag" (3.58s).
- `assets/vo-last3.mp3` — "Hyperframes / HeyGen" (1.91s).
- `assets/hyperframes-logo.svg` — full "Hyperframes by HeyGen" lockup. Act 6 uses two copies: one clipped to the bottom HyperFrames wordmark, one unclipped for the HeyGen reveal.

## Known stuff Jake liked that we'd keep parity on

- "Save some time" near the top of frame, "Just click & drag" bottom edge — symmetric 120px vertical padding in Act 5.
- Drag gesture trajectory in Act 5 ends at `x = 820 + DRAG_DX` (cursor tracks pill's grab point; pill widens from ~1200 to ~2200 while translating left so "drag" stays at the same screen position relative to the pill).
- Bell/click SFX volumes at 0.3 and 0.8 respectively; bgmusic at 0.15.
- No expanding ring halo behind either Lottie bell — Jake explicitly killed those.

## Project conventions (unchanged from v1)

- Every sub-composition has a `<template>` wrapper with `data-composition-id`, `data-width="1920"`, `data-height="1080"`, `data-start`, `data-duration`. HF shows/hides by GSAP timeline duration — pad short timelines with `tl.to({}, { duration: TARGET }, 0)`.
- Root `index.html` master timeline stays empty + paused.
- No `repeat: -1` — HF lint forbids infinite loops. Use `Math.floor(total / cycleDur) - 1`.
- Always `cd` into the project dir before `npx hyperframes lint` (or run lint via the local bun invocation).
- Mockups live in `mockups/` — standalone HTML keyframes Jake opens directly in a browser.
