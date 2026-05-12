# Port Plan — Logo Intro → Launch Video

Status: 2026-05-12. Hand-off for the next agent. Goal: take the standalone
`inspector-logo-intro` composition and **fold it in as the new opening of this
launch video**, while **replacing its background system with the cleaner one
we built here**. Treat this doc as the source of truth; ask Jake when the spec
under-determines a decision.

## TL;DR

1. **Two projects, one outcome**: `inspector-logo-intro/index.html` is a
   ~12.75s standalone logo film; this project (`hyperframes-inspector-launch-contact-sheet/index.html`)
   is the 34.3s launch video. The logo film should become the new **Scene 00**
   sequence and the existing Scene 00 (dark Claude prompt box) shifts to follow.
2. **Don't copy the intro's background code verbatim.** Its halftone draw is
   the same shader but the *motion strategy is rough* (master tween rates are
   ~4× too slow for its duration; per-beat bg transitions are abrupt rather
   than V2 cut-the-curve with peak bloom). Use this project's bg architecture.
3. **Touch points are well-defined.** Both projects already share the same
   halftone code, color palette, and CSS variables — the merge is mechanical
   if you follow the order below.

## Source: `inspector-logo-intro`

Path: `/Users/jakemoran/Desktop/CC/projects/active/inspector-logo-intro`

Composition shape (`index.html`):

| Track | Element | data-start | data-duration | What it is |
|---|---|---|---|---|
| 0 | `#halftone-bg` | 0 | 12.75 | Oversized halftone plate (same shader) |
| 1 | `#green-flash` | 0 | 1.33 | Dark-green overlay that fades to reveal the halftone |
| 2 | `#logo-container` | 0.42 | 5.00 | HyperFrames wordmark fly-through (spring-physics) |
| 3 | `#inspector-text` | 1.42 | 10.83 | "Inspector" letters stagger in beside the logo |
| 4 | `#mag-glass` | 2.75 | 2.00 | Magnifying-glass lens scan over "Inspector" |
| 5 | `#selection-highlight` | 5.58 | 6.67 | Cyan text-selection rect drawn by the cursor |
| 6 | `#cursor` | 5.58 | 6.67 | macOS-style pointer that selects + interacts |
| 7 | `#inspector-panel` | 6.92 | 5.33 | Inspector property panel slides in from the right |
| 8 | `#color-picker` | 7.92 | 1.33 | Color swatch opens, picks coral |
| 9 | `#font-list` | 9.25 | 1.33 | Font list opens, picks a new family |

Assets: `assets/hf-logo.svg`, `assets/hf-logo-light.png`.

Beat sheet narrative (full detail in `inspector-logo-intro/STORYBOARD.md`):

1. **0.00–0.25s** Background warp — flat green → halftone field
2. **0.25–0.85s** Logo flies through camera, spring-settles
3. **0.85–1.65s** Logo slides left, "Inspector" assembles from the right
4. **1.65–2.85s** Magnifying glass scans across "Inspector"
5. **2.85–3.35s** Camera zooms into "Inspector"
6. **3.35–4.15s** Cursor enters, drags-selects the letter `t`
7. **4.15–8.x** Inspector panel opens, color/font controls demonstrate
8. **~8.x–12.75** Hand-off: cursor drags the text off-screen leftward to exit

## Destination: this project

Path: `/Users/jakemoran/Desktop/CC/projects/active/hyperframes-inspector-launch-contact-sheet`

Current composition: **15 scenes, 34.3s total**, root id `inspector-launch-v1`.
First scene today is `scene-00` (dark Claude prompt box typing "we created
HyperFrames because we believe"). The intro film needs to slot in **before**
that.

After the port, scene order should be:

```
scene-00 → NEW: logo intro (~12.75s)
scene-01 → was scene-00 (Claude prompt box)
scene-02 → was scene-01 (Creating video should be easy)
...all existing scenes renumber +1...
```

Or **keep scene-00 dark prompt** and add the logo intro as a wrapper before
the existing track-1 elements (logo film runs on its own tracks 8–15, the
existing scene timeline still starts at the same `at` after a +12.75s shift).
Either works — see "Approach A vs B" below.

## Approach A vs Approach B

**Approach A — Re-id everything.** Rename the existing scene-00..scene-14 to
scene-01..scene-15, add scene-00 as the intro container, register entry
tweens for scene-00 as a new entry in the `scenes` array.

- Pros: clean conceptual model, scene-00 fits the existing system.
- Cons: ~30 ids and ~50 entry-tween offset references to renumber. High
  cognitive load. Easy to miss one and quietly break things.

**Approach B — Keep current ids, prepend a non-scene "intro" block.** Add
the logo film elements as a sibling block of `<section id="scene-*">`s with
their own `data-start` values starting at 0, and **shift every existing
`scene-*` data-start by +12.75s**. Don't touch the scene ids. The `scenes`
array gets a synthetic head entry (or just shifted entries) and a special
"intro phase" before the cut-the-curve system kicks in at the new scene-00.

- Pros: scene ids stay stable; the existing entry-tween numeric offsets are a
  bulk `+12.75` shift, easy to do with one pass.
- Cons: the intro doesn't go through the cut-the-curve scenes machinery —
  needs its own ad-hoc tween block, and the bg transition from intro → first
  scene needs to be wired manually.

**Recommendation: Approach B.** The intro is structurally different from the
14 cut-the-curve text scenes — it's a continuous spring-physics sequence with
shader effects and a cursor demo, not a sequence of discrete same-shape
beats. Forcing it into the `scenes[].entry` taxonomy ("none" / "left" /
"right" / "up" / "down" / "zoom" / "continue") is more friction than value.

## Step-by-step port (Approach B)

### 1. Move assets and bring in the markup

- Copy `inspector-logo-intro/assets/hf-logo.svg` →
  `hyperframes-inspector-launch-contact-sheet/assets/hf-logo.svg`.
- From `inspector-logo-intro/index.html`, copy the **intro HTML block** (the
  9 track-1+ elements: `#green-flash`, `#logo-container`, `#inspector-text`,
  `#mag-glass`, `#selection-highlight`, `#cursor`, `#inspector-panel`,
  `#color-picker`, `#font-list`) into this project's `index.html` **before
  the first `<section id="scene-00">`**.
- Keep them on their existing track indices (1–9) or push them to a higher
  range (e.g. 10–18) so they don't conflict with the existing track-1 scenes.

### 2. Shift everything else +12.75s

- **Every existing `<section id="scene-*">` `data-start`** gets `+12.75`.
- **Every existing `tl.to/fromTo/set/call(..., absoluteTime)`** offset for
  scene-00 through scene-14 gets `+12.75` in the script block.
- The `scenes` array `at` values: `+12.75` for every entry.
- The build block for scene-05's `SCENE_START` constant: `13.5 → 26.25`.
- `TIMELINE_DUR` and root `data-duration`: `34.3 → 47.05`.
- Canvas `#global-halftone` `data-duration` matches root.

This is mechanical but error-prone — do it in one Edit pass per region (HTML
sections, scenes array, JS entry tween block) and lint after each.

### 3. Bring the intro's element-level animations across

Copy the per-element GSAP tweens from the intro's script (green-flash fade,
logo spring fly-through, inspector-text letter stagger, mag-glass scan,
cursor path, panel slide, color/font picker tweens) into this project's
main IIFE. **Keep their offsets at their original times (0–12.75s)** — they
play *before* the shifted scene tweens.

Caveats:

- **Spring easings** — the intro uses GSAP's `springSoft` / custom springs.
  Verify the same eases work with this project's GSAP version
  (`gsap@3.14.2`, loaded from jsdelivr).
- **Cursor SVG** — it's already in the intro markup, just bring it over.
  Don't recreate it. Note: there's already a `.click-cursor` cursor in
  Scene 11; rename the intro one (e.g. `#intro-cursor`) to avoid collision.
- **Magnifying glass WebGL shader** — the intro mentions the shader is
  ported from a Remotion repo. Check if the port is *actually working* in
  the intro's current build before relying on it. If not, treat the lens as
  a CSS/SVG fallback (radial mask + scale + chromatic-aberration filter)
  for now and flag for follow-up.

### 4. Wire up the master timeline duration

The `setBgTransition`, `setStageEntry`, `setStageExit`, `addBgDrift`, and
master continuous tween in this project all use `TIMELINE_DUR` and the
scenes-array `at`/`dur` values. After step 2, those auto-adjust to the new
length — verify by linting and scrubbing.

### 5. The intro → scene-00 hand-off

The intro ends at 12.75s; the first existing scene starts at `12.75 + 1.8 =
14.55s` (was 1.8s for scene-01 in current numbering — under Approach B
scene-00 stays at the new 12.75s + 0.0 inset, which means scene-00 originally
at `at: 0` now at `at: 12.75`). We need a graceful join:

- The intro's last visible state should be **whatever scene-00 expects as
  its initial bg state** (currently `bg: { x: 60, y: 40, scale: 1.04,
  hue: 0, sat: 1.04, density: 0.94, radius: 1.0, palette: 0.4, wash: 0.06 }`).
- At intro end (~12.75s), the intro's final bg state should be tweened to
  match this so scene-00's initial `gsap.set` (already done at t=0 of the
  composition in `Object.assign(bgState, initField)`) lines up cleanly.
- The simplest way is to **remove the script-load `gsap.set` for the initial
  bg** and rely on the intro's bg tweens to land the halftone in scene-00's
  expected resting state. Add a `tl.set("#global-halftone", initBg, 12.75)`
  + `tl.set(bgState, initField, 12.75)` to lock it in for scene-00.

## Background strategy — what to apply to the intro

The intro currently has the same shader halftone code but a *much weaker*
motion config. Here's the cleaner strategy we developed in this project and
how to apply it.

### Architecture (already in this project's `index.html`)

```
bgState (shared object)
  ├─ continuously animated by ONE master tween (linear, never stops)
  │   flow, phase, ribbon advance monotonically across TIMELINE_DUR
  └─ per-cut tweens layer on top for bloom, mass-shift, plate motion
      these run during scene-to-scene transitions only
```

Key invariant: **`flow`/`phase`/`ribbon` never have zero-velocity boundaries**.
Their advance is always linear, master-tween-driven. Per-cut tweens touch
*bloomable* properties (`blend`, `density`, `radius`, `lift`, `palette`,
`wash`, `warp`, `shapeScale`, `ribbonScale`) and `massShiftY` for up/down cuts,
but never `flow` / `phase` / `ribbon`. This is what kills the
"move-stop-move-stop" feel.

### Constants you should reuse

```js
// Resting baseline boost — keeps the landed scene visibly warm
const REST_LIFT = 0.09;
const REST_WASH = 0.12;
const REST_PALETTE = 0.16;
const REST_SHAPE = 0.14;
const REST_RIBBON = 0.05;
```

These are baked into `drawHalftone`'s effective values — already correct in
the intro's code, no change needed.

### Master continuous tween

For this project (34.3s, scenes mostly 1.5–3s each):

```js
const FINAL_FLOW   = 5.25;   // ≈ 0.153 / second
const FINAL_PHASE  = 4.06;   // ≈ 0.118 / second
const FINAL_RIBBON = 4.48;   // ≈ 0.131 / second

tl.to(bgState, {
  flow:   FINAL_FLOW,
  phase:  FINAL_PHASE,
  ribbon: FINAL_RIBBON,
  duration: TIMELINE_DUR,
  ease: "none",
  onUpdate: () => drawHalftone(bgState)
}, 0);
```

**Intro is currently at flow 1.15 / phase 0.88 / ribbon 0.97 over 12.75s ≈
0.090 / 0.069 / 0.076 per second.** That's roughly **0.6× the launch
project's rate** — perceptibly stagnant against the rest of the video. After
the port, recalibrate to the per-second rates above by scaling for the new
combined duration (47.05s):

```
FINAL_FLOW   = 0.153 × 47.05 ≈ 7.20
FINAL_PHASE  = 0.118 × 47.05 ≈ 5.55
FINAL_RIBBON = 0.131 × 47.05 ≈ 6.16
```

### Per-cut V2 bloom — intro probably doesn't need it everywhere

The intro is one continuous sequence with **no scene cuts inside it**. So
`setBgTransition` (with its split power3.in / back.out(0.4) plate tween +
peak bloom + mass-shift) isn't needed *during* the intro. It IS needed for
the **intro → scene-00 hand-off** (treat it as one zoom-through or as a
fade) and for every subsequent scene-to-scene transition, all of which
already exist in this project's machinery.

### Plate position drift through the intro

Within the intro itself, use sparse tl.to tweens on the halftone canvas
position (`x` / `y` / `scale` / `filter`) to match beat moments — e.g.

- Beat 2 (logo punches through): subtle plate scale-up + radial-style hue
  shift, to amplify the impact.
- Beat 3 (logo slides left): plate drifts left 0.1s before the logo moves,
  matching the lead-time rule in `DESIGN.md`.
- Beat 4 (mag-glass scans): plate hue cycles slightly, density bumps to
  emphasize the lens magnification feel.
- Beat 5 (zoom in): plate scales up to match the camera push.

Each of those plate moves can layer cleanly on top of the master continuous
tween because they target *different state properties*.

### Suggested cleanup pass

Before/while porting, do a one-shot rewrite of the intro's bg tweens to
match the launch project's grammar:

1. Audit every `tl.to(bgState, { ... })` in the intro's script.
2. Remove the ones that explicitly touch `flow` / `phase` / `ribbon` —
   those are master-tween territory.
3. For per-beat plate moves, use the same pattern as this project's
   `setBgTransition` *continue* path (smooth `power1.inOut`, 0.5–1.0s
   tweens; no slam).
4. Add `massShiftY` tweens for any beat that feels like an upward camera
   move (e.g. zoom-in on Inspector).
5. Validate by scrubbing: the field should never look frozen, never have
   visible "phase resets", and never have the dot raster look pixel-locked.

## Risks & gotchas

- **Selector collision**: intro has `#cursor`. This project's Scene 11 has
  `.click-cursor`. Different selectors → safe. Just don't introduce a new
  `#cursor` in this project.
- **Track-index collision**: pick non-overlapping track indices for the
  intro elements. Lint will flag overlaps explicitly.
- **WebGL/canvas in 3D**: we hit a wall earlier in this project trying to
  render canvas content inside a `transform-style: preserve-3d` parent
  (Scene 01b agent-flip). The fix was to wait for `DOMLoaded` on the lottie
  player + drive playback from the GSAP timeline. **If the magnifying-glass
  shader uses canvas inside a 3D-transformed parent, it will likely break in
  headless render**. Verify with a draft render before assuming it works.
- **lottie-web is loaded** for Scene 01b's agent flip. Don't load a second
  copy — reuse the existing CDN script tag.
- **`AGENT_LOTTIE_DATA` is a global** at the top of the inline script. Make
  sure the intro's script doesn't redefine globals with the same names.
- **GSAP `repeat: -1`** is banned by the lint. The intro probably has the
  caret-blink pattern using `repeat: N, yoyo: true` — keep it that way.
- **Floating-point overlap**: `18.6 + 2.1 = 20.700000000000003`, which the
  lint flags as a clip overlap. After shifting `data-start` values by
  +12.75, audit the new sums and adjust durations by 0.01 where needed
  (we already did this for scene-07 / scene-08 in the current cut).

## Verification checklist

After the port, before declaring done:

- [ ] `npx hyperframes lint` reports **0 errors** (warnings about file size /
      track density are expected).
- [ ] Scrubbing from t=0 through TIMELINE_DUR shows no visible bg
      "stutter" or "reset" — the dot field should glide continuously.
- [ ] At t=12.75 (intro→scene-00 hand-off) the bg state matches scene-00's
      resting config (no plate snap, no color jump).
- [ ] Every existing scene's content still appears at the correct visual
      time (just 12.75s later than before the port). Spot-check scenes 01,
      05, 11, 14 since those have the trickiest internal timelines.
- [ ] A draft render (`hyperframes render --quality draft --fps 30`)
      completes and the intro is visible in the MP4. Confirm with an
      `ffmpeg -ss <T> -frames:v 1` extract per beat.

## Things to ASK Jake about before starting

1. **Approach A vs B** — defaulting to B but he may want fewer moving parts
   (A) if he plans to delete an old scene.
2. **Magnifying glass shader** — port or fallback? If the WebGL port is
   half-finished, an SVG/CSS approximation may be a better short-term move.
3. **Total length** — the launch is currently 34.3s. With +12.75s for the
   intro it becomes 47.05s, which is long for a launch film. Confirm before
   committing.
4. **Lockup at the end** — the launch ends with the "HyperFrames Inspector"
   lockup (Scene 14). With the intro showing the same lockup at the start,
   we'd be book-ending — intentional or redundant?

## Files to read before touching anything

In this project:

- `index.html` — the whole launch cut. Pay particular attention to:
  - The `bgState`, `REST_*` constants, `drawHalftone`, `paintShaderWash`,
    `shaderField` functions
  - The `scenes` array and `setBgTransition` / `setStageEntry` / `setStageExit`
  - The master continuous tween (`tl.to(bgState, { flow, phase, ribbon }, ..., 0)`)
- `HANDOFF.md` — the original launch-project handoff
- `STORYBOARD.md` / `DESIGN.md` — palette, motion rules, what NOT to do

In the intro project:

- `inspector-logo-intro/index.html` — the source to port
- `inspector-logo-intro/STORYBOARD.md` — beat-by-beat narrative + motion
  intent (it's detailed, read all of it)
