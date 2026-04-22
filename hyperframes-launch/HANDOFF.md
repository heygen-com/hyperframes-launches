# Handoff — Hyperframes Go Make Something

**Latest:** 2026-04-15 (Session 4)
**Session:** Audio playback fix + seamless beat transitions (eliminated black frames)
**Preview:** `npx hyperframes preview projects/gms-sandbox --port 5206`
**Render:** `npx hyperframes render projects/gms-sandbox/ --output projects/gms-sandbox/renders/gms-sandbox.mp4`

---

## Session 4 (2026-04-15) — Audio + Seamless Transitions

### Audio in preview
VO/music/SFX were silent on first preview load — browser autoplay policy blocks `audio.play()` until the user has interacted with the page. The HF runtime swallows the rejection via `.play().catch(() => {})`, so there's no console error. **Fix: click the studio Play button once**; audio unlocks and stays unlocked for the session. Nothing in the composition needed to change (`id`, `src`, `data-start`, `data-duration`, `data-track-index`, `data-volume` are all present and correct on each `<audio>` element).

### Black frame flashes between beats
Every "seamless" beat boundary was flashing black. **Root cause:** HF decides composition visibility from each sub-composition's **GSAP timeline duration** (`timeline.duration()`), not from the `data-duration` attribute on the master host — the runtime strips `data-duration` from non-root composition hosts (see `hyperframes/packages/core/src/runtime/init.ts:231-246`, `:1205-1220`). Ten sub-compositions had timelines shorter than their master slot, so HF set `visibility:hidden` early and the next beat hadn't started yet → black.

**Fix pattern** (applied to every short composition, just before `window.__timelines[…] = tl;`):

```js
// Pad timeline to master slot duration (XYZs) to prevent black frames at beat tail
tl.to({}, { duration: XYZ }, 0);
```

The empty-object tween is a no-op that extends `timeline.duration()` without animating anything.

### Changes

| File | Edit |
|---|---|
| `index.html` | flex-shader master slot moved to 14.10→15.30 (was 14.11, 0.01s gap). Lottie master `data-duration` dropped from 1.13 → 1.12 to avoid float-precision overlap at 14.10. |
| `compositions/flex-css.html` | timeline pad → 1.71 (was 1.69) |
| `compositions/flex-lottie.html` | timeline pad → 1.13 (was 0.92) |
| `compositions/flex-shader.html` | timeline pad → 1.20 on both WebGL and 2D-fallback code paths (was 0.94) |
| `compositions/flex-threejs.html` | timeline pad → 1.21 (was 1.20) |
| `compositions/anatomy.html` | timeline pad → 8.54 (was 8.38) |
| `compositions/flex-music.html` | timeline pad → 0.58 (was 0.48) |
| `compositions/flex-sfx.html` | timeline pad → 0.93 (was 0.90) |
| `compositions/flex-it.html` | timeline pad → 0.15 (was 0.12) |
| `compositions/flex-all.html` | timeline pad → 0.33 (was 0.30) |
| `compositions/flex-compose.html` | timeline pad → 2.22 (was 2.03) |

### How to verify visibility if this regresses

Inside the studio preview, in the console:

```js
const p = document.querySelector('hyperframes-player');
const iw = p.shadowRoot.querySelector('iframe').contentWindow;
Object.fromEntries(Object.entries(iw.__timelines).map(([k,v]) => [k, +v.duration().toFixed(4)]));
```

Compare each key against its master slot (`data-duration` in `index.html`). Any composition with `timeline.duration() < master slot` will flash black at its tail.

Lint + validate are clean after these changes (pre-existing `caption_exit_missing_hard_kill` warnings on `canvas-open.html` and `flex-gsap.html` are unrelated to transitions).

---

## What's left

Remaining work is scoped to the **first 3 beats** (0.00 → 12.30s): `intro.html`, `proposition.html`, and `flex-css.html`. Beats from flex-gsap onward are considered locked pending review. Anything after the first three in the schedule table below should be treated as done-unless-a-regression-is-found.

---

## Current Beat Schedule

Source of truth is `index.html`. VO is `assets/voiceover_v3_gap.mp3` (49.76s, v3 script — see `SCRIPT_V3.md`). Master duration 51.60s.

| Beat | Composition | Start → End | Master dur | VO |
|---|---|---|---|---|
| Intro | `intro.html` | 0.00 → 6.95 | 6.95s | "Imagine you could make videos like this." + 1s silent gap + "Your agent already can — just give it HyperFrames." |
| Proposition | `proposition.html` | 6.95 → 10.59 | 3.64s | "Open source. HTML in, video out." |
| Flex CSS | `flex-css.html` | 10.59 → 12.30 | 1.71s | "CSS animations." |
| Flex GSAP | `flex-gsap.html` | 12.30 → 12.97 | 0.67s | "G-Sap." |
| Flex Lottie | `flex-lottie.html` | 12.97 → 14.09 *(visible to 14.10)* | 1.12s | "Lottie." |
| Flex Shader | `flex-shader.html` | 14.10 → 15.30 | 1.20s | "Shaders." |
| Flex Three.js | `flex-threejs.html` | 15.30 → 16.51 | 1.21s | "Three.js." |
| Anatomy | `anatomy.html` | 16.51 → 25.05 | 8.54s | "A div is a keyframe… JavaScript is your animation engine." |
| Thesis | `thesis.html` | 25.05 → 28.87 | 3.82s | "Anything a browser can render can be a frame in your video." |
| Flex drop | `flex-drop.html` | 28.87 → 29.23 | 0.36s | "Drop in" |
| Flex music | `flex-music.html` | 29.23 → 29.81 | 0.58s | "music," |
| Flex sfx | `flex-sfx.html` | 29.81 → 30.74 | 0.93s | "sound effects," (SFX: twinkle-glock at 29.87) |
| Flex footage | `flex-footage.html` | 30.74 → 31.57 | 0.83s | "footage" (videos: Frame 1.mp4, option2.mp4, Frame 3.mp4) |
| Flex "it" | `flex-it.html` | 31.57 → 31.72 | 0.15s | "— it" |
| Flex "all" | `flex-all.html` | 31.72 → 32.05 | 0.33s | "all" |
| Flex compose | `flex-compose.html` | 32.05 → 34.27 | 2.22s | "composes together." (A-roll: pill.mp4) |
| Engine | `engine.html` | 34.27 → 43.31 | 9.04s | "Your agent writes code… pixel-perfect, every time." |
| CTA | `cta.html` | 43.31 → 47.85 | 4.54s | "Give your agent the skill. Tell it what to make. Watch it build." |
| Close | `canvas-close.html` | 47.85 → 51.60 | 3.75s | "HyperFrames. Go make something." |

Archived (not in master schedule): `canvas-open.html`, `canvas-zoom.html`, `contrast.html`, `transition-flex-in.html`, `transition-iris.html` → `compositions/archive/`.

---

## Audio tracks (current)

| Element | Asset | Range | Vol | Notes |
|---|---|---|---|---|
| `#voiceover` | `voiceover_v3_gap.mp3` | 0.00–49.76 | 1.0 | v3 VO with 1s silent gap at ~3s for intro montage |
| `#underscore` | `musicfix.mp3` | 0.00–51.60 | 0.15 | Warm ambient pad under the whole video |
| `#sfx-click` | `twinkle-glock.mp3` | 29.87–31.40 | 0.2 | Tonal sparkle at "sound effects" beat, tail bleeds into footage |
| `#footage-frame-1` | `Frame 1.mp4` | 30.74–31.57 | — | Muted, B-roll |
| `#footage-frame-2` | `option2.mp4` | 30.74–31.57 | — | Muted, B-roll |
| `#footage-frame-3` | `Frame 3.mp4` | 30.74–31.57 | — | Muted, B-roll |
| `#compose-aroll` | `pill.mp4` | 32.05–34.27 | — | Muted, composed A-roll for flex-compose |

Archived VO takes, music candidates, and unused SFX live in `assets/archive/`. Voice-audition clips live in `archive/voice-auditions/`.

### Transcript

`transcript_v3.json` — word-level timestamps for the current `voiceover_v3_gap.mp3`. The pre-gap backup is in `archive/`.

---

## Script

Current script is `SCRIPT.md` (v3). `archive/SCRIPT_V2.md` is kept for history but is NOT what the current VO speaks.

See `SCRIPT.md` for the v3 rewrite rationale (contrast beat cut, cold open rewritten, flex section repositioned before anatomy, "GSAP" → "JavaScript" in anatomy copy, brand restyled to **HyperFrames**).

---

## Architecture notes still relevant

- **CTA beat** (`cta.html`) is a terminal workspace: `❯` zsh prompt + block cursor → types `npx hyperframes init` → scaffold output → types prompt. Preview panel slides in with mini composition assembly. Zoom-out exit.
- **Close beat** (`canvas-close.html`) is repurposed from the `ascii-lightning` project — full canvas-rendered ASCII art with procedural lightning, BFS crawl maps, 3-layer depth noise. Single `<canvas>` driven by a GSAP proxy. Canvas 2D only, no WebGL → safe for headless Chrome rendering.
- **Shader beat** (`flex-shader.html`) has a Canvas 2D fallback for headless Chrome. Renderer logs `GPU stall due to ReadPixels` during the shader segment, but output is fine — swap to 2D fallback only if that region looks stuttery in the final MP4.
- **Flex section ordering.** In v3 the flex compositions (CSS / GSAP / Lottie / Shader / Three.js) play BEFORE anatomy, not after. Anatomy copy was updated so "GSAP" became "JavaScript" — see `SCRIPT.md` v2→v3 table.

---

## Commands

```bash
# Preview
npx hyperframes preview projects/gms-sandbox --port 5206

# Lint + validate (run both before previewing / rendering)
npx hyperframes lint projects/gms-sandbox/
npx hyperframes validate projects/gms-sandbox/

# Render
npx hyperframes render projects/gms-sandbox/ --output projects/gms-sandbox/renders/gms-sandbox.mp4

# Re-transcribe if VO changes
npx hyperframes transcribe assets/voiceover_v3_gap.mp3 --model medium.en --output transcript_v3.json
```

---

## File tree

Load-bearing only. Anything historical (old index variants, legacy scripts, superseded VO takes, voice auditions, unused compositions) is in `archive/` at the appropriate level and is safe to ignore.

```
projects/gms-sandbox/
├── HANDOFF.md                      THIS FILE — start here
├── SCRIPT.md                       approved v3 script
├── STORYBOARD.md                   full v3 storyboard (creative reference)
├── index.html                      root — 51.60s, VO + music + SFX + 19 sub-compositions
├── meta.json
├── transcript_v3.json              word-level timestamps for the current VO
├── assets/                         audio/video/lottie loaded by index.html
│   └── archive/                    superseded VO takes + unused music/SFX
├── compositions/                   19 sub-compositions referenced by the master schedule
│   └── archive/                    old compositions (canvas-open/zoom, contrast, unused transitions)
├── renders/
│   └── gms-sandbox.mp4             latest full render
└── archive/                        top-level historical files (old scripts, old indexes, voice-auditions)
```
