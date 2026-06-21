# Cloud Render Launch — HANDOFF

A ~34s launch video for **HyperFrames Cloud Render** (managed rendering on HeyGen), built as a
proper **seek-safe HyperFrames project** that plays in **HyperFrames Studio**. This doc is the
source of truth for the next agent. Read it fully before editing.

---

## 1. What this video is

No-VO, text + visuals. Story (Before-After-Bridge), told through a **persistent Claude Code chat
window**: user kicks off a podcast render → asks to also render 5 projects from yesterday → Claude
**checks** (Lottie) → reads the **local render crawling at 1%** → reports back → *"Don't get blocked
by your machine."* → connect HeyGen → **fleet renders all 6 in parallel** → "all finished" → payoff
grid + logo.

- Storyboard: `STORYBOARD.md` · Design law: `design-system/frame.md` · Static mockups: `contact-sheet.html`
- **Two brands on screen, kept apart:** Claude Code = the interface (clay `#D97757`, the terminal
  window, the pixel-pet); HyperFrames/HeyGen = the product (mint→cyan `#3CE6AC`→`#00E3FF`).
- Everything sits on warm paper `#F0EFE9`.

---

## 2. How to preview (HyperFrames Studio)

```bash
cd /Users/jakemoran/Desktop/CC
unset HYPERFRAME_RUNTIME_URL   # REQUIRED for cli preview — a wrong value fails silently
node repos/hyperframes/packages/cli/dist/cli.js preview --no-open --port 5211 \
  projects/active/cloud-render-launch
```

Opens the Studio at `http://localhost:5211`. (launch.json config: `cloud-render-hf`.) Select the
**index** composition and press play to watch the full film; select any scene to preview it alone.

- **Has NOT been rendered.** Do not render unless Jake explicitly asks (standing rule).

---

## 3. Architecture (don't break these)

Follows the proven `projects/active/sfx-music-launch` pattern.

- **`index.html`** = the root. A `#cloud-render-launch` div (`data-composition-id`, `data-duration`)
  containing one section `<div data-composition-id data-composition-src data-start data-duration
  data-track-index>` per scene. A **master timeline** (`window.__timelines["cloud-render-launch"]`,
  paused) drives **only the seam transitions** (opacity/scale/position of the section wrappers).
- **`compositions/*.html`** = 10 scenes, each a `<template>` with a root `data-composition-id` div,
  scoped `<style>` (`#root-id .x`), and a `<script>` that builds a **paused** GSAP timeline and
  registers it on `window.__timelines["<id>"]`. 1cqw = 19.2px (container-type:size on a 1920×1080 root).
- Scenes: `opener, ask, checks, worker, responds, textbeat, connect, fleet, finished, payoff`.
- Seams in `index.html`: zoom-through (checks→worker, finished→payoff), cut-the-curve
  (responds→textbeat), hard cuts for chat continuity.

### Seek-safety rules (these make it work in Studio + render deterministically)
- Timelines **paused**, registered on `window.__timelines`. No `Date.now()` / unseeded random.
- **No spawned tweens or DOM creation inside callbacks.** Pre-create all elements; reveal via
  timeline tweens. `textContent` typing via a tween `onUpdate` (slice) is fine (forward-safe).
- **Root resolution MUST use the fallback** (this was the bug that made the Index static):
  ```js
  const R = (document.currentScript && document.currentScript.closest('#op-root'))
            || document.querySelector('#op-root');
  if (!R || !window.gsap) return;
  ```
  Why: when the runtime inlines a sub-comp into the Index and re-runs its `<script>`,
  `document.currentScript` exists but the recreated script is OUTSIDE the root div, so
  `.closest('#root')` returns null. Without the `|| querySelector` fallback the script bails and the
  timeline never registers → the scene is **static in the Index** (but fine when previewed alone).
- **Verify the Index drives nested timelines** by deep-walking the `<hyperframes-player>` shadow root:
  its iframe's `window.__timelines` should list ALL scene ids + `cloud-render-launch` (not just the
  master). If a scene id is missing, its script bailed.

### Note on `immediateRender:false`
`payoff` and `textbeat` currently use `gsap.from(..., {immediateRender:false})` so they were visible
"at rest." That was a workaround from when I wrongly thought the Index didn't drive nested timelines.
**It DOES drive them now** (after the root-resolution fix), so you can author normal hidden→reveal
entrances. See issue #4 and #6 — those two scenes should be reworked to proper masked/hidden entrances.

---

## 4. Issues to fix (priority order)

> **DONE (2026-06-19): A, B, C.** All five chat comps (`opener, ask, responds, connect, finished`)
> now share one bottom-anchored `.feed > .stack` layout. New rows start clipped below the fold
> (`.r-in`); on arrival the stack translates up by exactly `newRow.offsetHeight + gap` so prior rows
> shift up and the oldest fades — this is both the issue-C reaction AND the issue-A continuity (each
> scene bottom-anchors its last *settled* row, so scene N's end frame == scene N+1's start frame by
> construction). `connect`/`finished` resume the real transcript (full M4 reply, no truncation) per
> Jake's full-continuity call. Cursor target (issue B) now computed from the live `.ret`
> `getBoundingClientRect` (the old offset-chain helper ignored the `.win` `translate(-50%,-50%)` and
> parked the cursor off-screen). Verified in Studio: 11/11 timelines register in the composed index;
> all 4 chat seams match with ≤0.5px drift; cursor lands on `↵` within 0.5px.
>
> **Refinements (round 2):** (1) composer text bumped to 1.6cqw/weight-500 in ask/connect/responds/
> finished so typed text matches the bubble it becomes when sent (opener left as-is). (2) Thinking is now
> a bottom-slot row (`.think` inside `.feed`, `bottom:0`): on appear, history shifts up and it sits
> closest to the composer; the reply replaces it in that slot. Applied to responds, finished, AND a new
> brief thinking beat in opener (opener also drops its Local/CC chips as the window docks → the "On it…"
> reply clears the composer by ~44px). Opener SEND fixed: M1 starts clipped below the fold (feed empty
> through typing + morph — message never seen at the window bottom) then RISES up from behind the docked
> prompt box after the morph, same clipped-rise the other scenes use (was a fade-in-place at the bottom).
> (5) M1 text → "Hey, can we render my edited podcast video we worked on in HyperFrames?" (updated in
> opener/ask/responds — all 3 must stay identical for continuity). The longer prompt WRAPS to 2 lines: the
> input box auto-grows (`.tline` white-space:pre-wrap + inputbar content-height) during typing then
> collapses on send before the morph; opener cursor now measures the live `.ret` (temporarily fills the
> prompt to find the ↵ at its wrapped position) so it lands on ↵ regardless of wrap. M1 feed bubble also
> wraps to 2 lines everywhere. (3) `connect` rewritten realistic — NO auto-connect; faithfully recreates
> Claude Code's bash PERMISSION PROMPT. Flow: user types *"Okay cool — how do I do that?"* → Claude *"I'll
> connect HeyGen for you."* → the composer morphs into the permission card (`.permit`: ">_ Bash command /
> hyperframes auth login / Connect this project to HeyGen Cloud Render / Do you want to proceed? / ❯ 1.Yes
> / 2.… / 3.…", clay border, selected row highlighted) and the chat pushes UP by `PSHIFT` (permit height −
> composer height) so messages clear the card — cursor clicks **Yes** → permit closes, composer restores,
> the command runs in the feed as the tool row `$ hyperframes auth login` → `✓ Connected to HeyGen`
> (`.okpart` 2-stage). `finished` resumes end frame `[Q, A, TOOL]` (A = "I'll connect HeyGen for you.").
> (4) `responds` +1.0s read total (dur 3.4→4.4, cut 18.34→19.34); connect dur 3.8→6.4. **Film now 38.4s**
> (was 34.8) — downstream data-starts + master seam times in index.html shifted. Re-verified: 11/11
> register, 4 seams ≤0.5px, permit shows & chat clears it ~60-70px, cursor on ↵ and on "Yes" ≤0.5px,
> ✓-result reveals + composer restores at end.
> **Refinements (round 3):** M1 text → "…we worked on in HyperFrames?" (opener/ask/responds, wraps to
> 2 lines; input box auto-wraps+grows during typing, opener cursor measures live `.ret`).
> **D DONE** — `textbeat` now uses the masked upward waterfall (`.wm` overflow:hidden / `.wi` yPercent
> 115→0, stagger .12); mint gradient kept. (The old handoff note to also waterfall the *connect* entrance
> is SUPERSEDED — connect is now a full chat scene whose messages rise from behind the prompt box; a
> word-waterfall there would clash, so it keeps the rise.) **E DONE** — `fleet` all 6 bars fill to 100%
> and all show "✓ done", staggered completions (cascade 0→2→4→6); "✓ done" pre-filled in markup + revealed
> by opacity (seek-safe, no callback). **F DONE (payoff, latest):** clean **2-row × 3-col GRID** of 16:9 cards (CSS grid `repeat(3,1fr)` +
> `aspect-ratio:16/9`, `left/right:3cqw` centred vertically) maximising horizontal space — cards ~582×328px,
> native 16:9 (object-fit:cover, no distortion). Each card plays a REAL render clip from `assets/renders/`
> (6 most-recent projects with renders: aiewf, mcp, sfx, promo, outro, framemd — downscaled to 640×360,
> ~4.5s, `-an`, via ffmpeg from projects/*/renders/). Videos use `data-start=0 data-duration=3.6
> data-track-index=50-55 muted` (drive like the pet — manual tl.seek won't advance currentTime; that's a
> verify limitation, they play in render). Labels = story names. Cascade (column sweep TL,BL,TM,BM,TR,BR),
> then the MIDDLE COLUMN (cards[1],cards[4]) clears + logo reveals in the vacated centre.
>
> **Payoff final tweaks (latest):** (1) TOP-LEFT clip is now `assets/renders/spotify.mp4` (was aiewf —
> dropped; 6 clips are now spotify/mcp/sfx/promo/outro/framemd). (2) SUBTEXT CONFIRMED: the real CLI is
> `hyperframes cloud render` (repos/hyperframes docs/packages/cli.mdx — "HeyGen runs the render, pay per
> credit") — the subtext is correct. The *service* is called "HeyGen Cloud Render" in the story (connect
> scene); the *command* people type is `hyperframes cloud render`. (3) LOGO HAND-OFF: ~1s after the
> HyperFrames lockup reveals (2.15s), it crossfades to the HeyGen parent logo at ~3.3s. Payoff extended
> 3.6→**5.0s** (film now **41.0s**; payoff is last so nothing downstream shifts; video data-duration 4.5).
> **⚠ `assets/heygen-logo.svg` is a PLACEHOLDER** (copied from archive/design-html-launch
> HeyGen_Primary_Logo_Black_RGB.svg) — Jake to drop in the real one (same path, or tell me the name);
> sized `width:20cqw`, adjust if his differs. **All A–F DONE.**
>
> **Transitions pass (round 4):** (1) **ask→checks** is now an UPWARD cut-the-curve (master): chat slides
> up + fades (`yPercent:-13`, power2.in, .22s) and checks rises up in (`yPercent:14→0`, power3.out, .32s).
> (2) **worker is now FULL-SCREEN** (`.win` set to 1920×1080 radius 0 at rest) running the render scan,
> then MORPHS DOWN to the chat-window footprint at its tl end (win→1599×875 r26, log fades) — master
> crossfades worker→responds as the window forms (terminal text → cloud reply). Mirrors the SFX
> window↔full-screen morph (opposite direction). (3) **textbeat** reverted from the upward waterfall to a
> RIGHT→LEFT sweep (words `xPercent:60→0`, stagger `from:'end'`) — continues responds' leftward exit.
> (4) **connect→fleet**: fleet now starts at the chat-window footprint (crossfade from connect), MORPHS
> UP to full-screen (win→1920×1080), then the bar rows reveal ONE BY ONE (staggered `0.6+i*0.27`, each
> pops in → fills → "✓ done"). worker & fleet are the two full-screen "terminal" scenes; chat scenes stay
> windowed; morphs bridge them.
>
> **Transitions pass (round 5 — revised):** (1) checks→worker: worker now enters scaling UP (`scale
> 0.86→1`, was 1.12→1). (2) worker is full-screen the WHOLE scene (no self-morph now); log is centred +
> large (`.con` translate -50%,-50%, 2.1cqw); the slow ETA line has a mint→cyan highlight sweep (`.mark`
> scaleX 0→1) and the counter TICKS DOWN 1s (elapsed 00:09→00:10, eta ~14m 51s→50s via onUpdate). (3)
> fleet content centred + large (font 2.1cqw, bigger bars). (4) **worker→responds morph is now real**:
> responds STARTS full-screen and MORPHS DOWN to the window in its own tl while the traffic lights,
> prompt box, and messages animate ON (`win` 1920×1080→1599×875; bar/composer/pastRows fade+rise in over
> 0–0.6); master just crossfades worker→responds at full-screen (seamless dark). (5) fleet→finished does
> the SAME morph-down reveal in `finished`. responds +0.6 (dur 5.0) and finished +0.6 (dur 3.2) for the
> entrance → **film now 39.6s**; downstream data-starts + seams retimed. Continuity end-frames preserved
> (responds→connect, connect→finished still match).
>
> **Seamless-seam fix (round 6):** the morph crossfades were flashing the page bg (opacity-crossfading two
> opaque layers lets the cream bleed through at the midpoint). Fixed: the OUTGOING comp fades its CONTENT
> to a BARE dark surface at its end (worker `.con`→0; fleet `.con`→0; connect `.feed`+`.composer`→0 but
> KEEP `.bar`), then a HARD CUT (set/set, no overlap) to the INCOMING which starts at the IDENTICAL bare
> dark surface (responds/finished full-screen dark content-hidden; fleet windowed dark WITH traffic lights
> matching connect). Hard cut between matched darks = invisible; content swaps via the fades + morph
> reveal. No more fade-to-background. Verified: at each cut section opacity is a clean {out:1,in:0}→
> {out:0,in:1} switch.
>
> **Pixel-pet rules (round 7) — ported from sfx-music-launch:** the `pet-typing.mp4` pixel-pet now follows
> the SFX rules in ALL chat comps (opener/ask/responds/connect/finished): the `.pet` div lives INSIDE
> `.inputbar` (perched on the prompt's top edge: `right:3cqw; bottom:100%; width:7.6cqw; height:4.4cqw`),
> the feathered mask is on the `<video>` (not the container) so the bg dissolves — no visible box, LOOPED
> with multiple `<video>` instances to cover each comp (opener/connect use 2; others 1), unique ids +
> data-track-index (40–46), and it's NEVER faded (persists; opener's pet now rides the morph instead of
> fading). Because our chat is BOTTOM-anchored (SFX was top-anchored), the pet collided with the newest
> message, so the shared `.feed` bottom was raised 13cqw→16.5cqw (uniform → continuity holds) giving a
> ~34px gap above the pet. Verified: pet perched (parent=inputbar, bottom on input top), no message
> overlap, opener→ask & responds→connect seams still match.
>
> **Textbeat motion (round 8, corrected round 9):** IMPORTANT — the "cut-the-curve" Jake wants is the
> Spotify-style SINGLE `power4` whip (fast throw across a seam), NOT the 3-phase nudge-curve. The 3-phase
> nudge (slow ramp→burst→long tail) is for SLOW group repositioning; its long tail made the words linger
> and read as GAPS. Reference: `scratch/plv-spotify/videos/spotify-personal/scene_1.html` (exit `power4.in`)
> & `scene_2.html` (entry `power4.out`, x-throw, stagger). Current textbeat: ENTRY = `gsap.set(words,
> {opacity:0,x:82}); tl.to(words,{opacity:1,x:0,duration:.32,ease:'power4.out',stagger:.055})` — reading
> order ("Don't" first), tight overlap (~3 words in flight at once), settles by ~0.85s. EXIT = downward
> waterfall `tl.to(words,{y:200,opacity:0,duration:.4,ease:'power3.in',stagger:.05},1.9)`. Using a SINGLE
> staggered tl.to (not a forEach) keeps it lint-clean (no overlapping_gsap_tweens) with no `overwrite`.
> textbeat→connect: connect WINDOW drops in via MASTER `#s-connect` `y:-130→0` single `power4.out` .45s
> (fast, was 3-phase). No retiming. Next: render when Jake asks ([[no-auto-render]]).

### A. Chat scenes aren't persistent across cuts  ⭐ biggest  ✅ DONE
The chat scenes (`opener → ask → responds → connect → finished`) should read as **one continuous
window** — when we cut from one to the next, the messages should be in the **same place at the same
size**. Right now they jump: `opener.html` uses a `.convo` layout (absolute `.usermsg` top-right +
`.agent` at `top:8.5cqw`) while `ask/responds/connect/finished` use a `.feed` flexbox, and font sizes
/ positions differ.
- **Fix:** give ALL chat comps ONE identical chat layout — same `.win` geometry (already 83.3cqw×81cqh),
  same `.feed` structure, same row font-size (1.6cqw), same gaps, same composer. The end frame of
  `opener` (after its morph docks) must match the first frame of `ask` pixel-for-pixel. Easiest path:
  make `opener` end in the SAME `.feed` layout the others use (convert its `.convo` to `.feed`), and
  factor the shared chat CSS so it's identical everywhere.
- Acceptance: scrub across each chat→chat cut — the existing messages don't move.

### B. Cursor click position in `ask` (scene 2) is wrong  ✅ DONE
`compositions/ask.html` — the cursor tween lands at `left:92.5% top:88.5%`, which isn't on the `↵`
send key. **Fix:** target the actual `.ret` glyph (compute its center from `R.querySelector('.ret')`'s
offset, or hand-tune to sit on it). Mirror the opener's tap grammar (tip-tap scale .84, `↵` flashes
clay). Check `connect` too (same pattern).

### C. Chat should react when a new message lands  ✅ DONE
Right now history is static (just dimmed). Desired: **when a new message comes in, shift the previous
messages UP at the same moment, and fade the oldest down/out** — so the newest message is prominent.
The shift-up and the fade happen together, only on the arrival beat.
- **Fix:** in each chat comp, on the new-message reveal, add a timeline tween that translates the prior
  rows up by ~one row height (`y`) while fading the oldest (`opacity → ~0`), synced with the new row's
  entrance. Keep it seek-safe (tweens on pre-existing rows, no DOM mutation).

### D. `textbeat` waterfall is wrong — use the SFX technique  ✅ DONE
Currently the line is already on screen at scene start and doesn't do a real waterfall.
- **Fix:** copy the **upward masked waterfall** from `sfx-music-launch/compositions/button-spam.html`
  (the `.claim` "Video without sound is…"). Pattern:
  ```html
  <!-- each word wrapped: <span class="wm"><span class="wi">word</span></span> ; .wm{overflow:hidden} -->
  ```
  ```js
  gsap.set(words, { yPercent: 115 });            // masked below their line (HIDDEN at rest)
  tl.to(words, { yPercent: 0, duration: .55, ease: 'power4.out', stagger: .12 }, t0);
  ```
  Remove the current `from(immediateRender:false)` approach. Words start hidden (below the mask) and
  waterfall up. Keep the mint→cyan gradient on "machine."
- **Apply the same waterfall logic to the `connect` scene** entrance (per Jake) — the new line should
  waterfall in the same way rather than a plain fade.
- Reference: `sfx-music-launch/compositions/until-now.html` also shows masked word swaps.

### E. `fleet` — all 6 must finish  ✅ DONE
`compositions/fleet.html` — the payoff of this scene is that **all 6 renders complete**, but right now
the bars fill to partial % (`targets=[100,72,61,80,52,66]`) and only one shows "✓ done".
- **Fix:** animate **every** bar to 100% and show **"✓ done"** on all 6 by the end of the scene
  (stagger the completions so it feels alive, but they ALL land done). That sets up `finished` ("All 6
  projects have finished rendering.").

### F. `payoff` — logo bleed + tile count  ✅ DONE
`compositions/payoff.html`:
1. The **logo SVG is visible behind/through the tiles before it animates on** (it's `z-index:3` and was
   made visible-at-rest). **Fix:** the logo must be **hidden until its reveal** (opacity 0 at frame 0,
   then animate in) so it only appears once the center clears. (Now that the Index drives timelines,
   a normal hidden→reveal is fine.)
2. There are **12 tiles (4×3)** but there are only **6 videos**. **Fix:** **6 tiles total** (e.g., 3×2),
   one per finished project (podcast + the 5 from yesterday). Rework the center-clear/logo placement
   for a 6-tile layout (e.g., logo lands over the center, tiles part to make room).

---

## 5. Reference files
- **Morph + cursor + typing (seek-safe):** `sfx-music-launch/compositions/terminal-sfx.html` (this is
  what `opener` is based on; note its `root || querySelector` fallback).
- **Masked waterfall entry:** `sfx-music-launch/compositions/button-spam.html` (`.claim`), `until-now.html`.
- **Root stitch + seam master timeline:** `sfx-music-launch/index.html`.
- **Lottie, frame-driven (render-safe):** `claude-paper/compositions/thinking-big.html` (basis for
  `checks`; the `Claude Icon Loading` lottie lives at `assets/claude-thinking.json`).
- **Design tokens / fonts / motion law:** `design-system/frame.md`.

## 6. Conventions / gotchas
- Fonts: local `@font-face` with **literal family names** (Hanken Grotesk, Spline Sans Mono, Galaxie
  Copernicus) pointing to `fonts/`. cqw units; root is `container-type:size`.
- Lint with the Studio "Lint" button or `npx hyperframes lint` — currently clean except a minor
  `overlapping_gsap_tweens` warning on the opener cursor tap (harmless; can add `overwrite:'auto'`).
- Timings are loose (~34s); Jake may want it tightened toward ~30s after the above fixes.
- Assets in `assets/`: `pet-typing.mp4` (Claude pixel-pet), `hyperframes-dark.svg` (HeyGen·HyperFrames
  lockup), `claude-thinking.json`/`.lottie`, fonts in `fonts/`.
- **Do not auto-render.** Wait for an explicit request.
