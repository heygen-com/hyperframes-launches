# figma-launch — HANDOFF

**Status: v6 RENDERED** (`renders/figma-launch-square-v6.mp4`, 64.0s, 46.6MB, 7 click
SFX in the mux, outro frames spot-checked via ffmpeg). v5 (55.9s) = pre-outro cut. Jake's revision pass (2026-07-09): act1 card-2 two-stage
highlight, new bg patterns on act3/4 + act5, act5/act9 card seams are now ZOOM-THROUGHS
(zero overlap, card enters already playing — poster beat deleted), act6 clicks re-aimed +
cursor exits off the TOP + scene 0.3s faster, act8 hierarchy swapped ("And yes," is the
big line) with motion-only green + shimmer, and 5 click SFX on the master. All seams
re-verified frame-exact in preview. Latest full state also lives in the `figma-launch`
memory.

## What this is

Launch film for the `/figma` skill (Figma → HyperFrames). Square 1080×1080, silent,
HeyGen-for-Developers brand (ABC Solar Display / TT Norms Pro/Mono, green #5ef17c, glass
cards, dark pattern bg). Docs for the feature: https://hyperframes.heygen.com/guides/figma

## Structure (master `index.html`, 55.85s)

| t | comp | beat |
|---|------|------|
| 0–11.8 | act1 | cold open ("…great" mask-reveal → "but" letters → line DOCKS into tweet 1) → 3 glass x-post cards, each: land → dimensional pop (scale expo.out + rotY −7/rotX 6 + shimmer) → green highlight sweep on key phrase → swap left. Card 2 is a TWO-STAGE sweep: `#act1-hl2a` "couldn't get it to" (7.7) then `#act1-hl2` "match what we built in Figma" (8.35) |
| 11.8–14.7 | act2 | one-way zoom ladder: 9 hard cuts, zoom ONLY climbs 1.32→4.4, cadence .8/.5/.4/.3/.2/.15/.12/.1; "Couldn't capture" highlight dead-center every cut; enters via INVERSE ZOOM (answers card 3's receding exit) |
| 14.7–15.8 | act3 | "Until now" — 0.3s beat, leftward in/out |
| 15.8–18.0 | act4 | "Introducing" (0.3 hold → slides up/scales down, STAYS) → giant green mono "/figma" (0.3 hold) → both exit LEFT |
| 18.0–35.95 | act5 | Claude Code terminal (sfx-launch grammar): big prompt box types Jake's exact copy w/ blue inline link → cursor taps ↵ → composer morphs to dock, window shrinks → findings stream (real seedance hexes) → closer line → window **ZOOM-THROUGHS off** (scale 1→1.22 power3.in + linear fade, gone at cut 25.95) → **output card** (`assets/first-output.mp4`) picks up growing (.75→1 expo.out on the master), ALREADY PLAYING — no poster beat |
| 35.95–41.15 | act6 | lightweight FIGMA UI rebuild: select `app-flow` frame title → Share → Copy link → toast; enters via inverse zoom; cursor exits off the TOP; stage exits UPWARD; 5.2s |
| 41.15–44.15 | act7 | "Making videos / from your designs / has never been easier." — UPWARD MASK REVEALS (answers act6's upward exit) |
| 44.15–46.15 | act8 | "And yes," (100px, first) → 0.3s later "figma motion works" (84px); ONLY "motion" is green, with a bg-clip-text gradient shimmer sweep at 0.95 |
| 46.15–55.85 | act9 | motion prompt in docked composer → Claude REPLIES → window ZOOM-THROUGHS off (cut 52.95) → tail card (`assets/motion-output.mp4`) grows in ALREADY PLAYING → card exits LEFT mid-motion (master tween @55.5) |
| 55.85–59.15 | act10 | install beat: "Try it yourself" (ABC Solar 72px white) + `npx hyperframes@latest skills` (TT Norms Mono 50px green) — leftward in AND out (cut-the-curve into the outro). Command CONFIRMED against the CLI: there is no `skills add`; `npx hyperframes@latest skills` installs the set (figma incl.), `skills update figma` = named on-demand |
| 59.15–64.05 | act11 | DARK square port of `projects/active/hyperframes-logo-outro`, riding the SAME bg pattern as act10 (transparent root + own shade — NOT opaque black): act10's lines exit LEFT and the wings answer from the right on the same vector (cut-the-curve over the shared surface) → cursor click → flight + liquid fill → mark lands PIXEL-EXACT in the lockup slot (lockup y −62; Δ(+329.4,−131.0), scale 0.5194) → **GitHub star beat**: dark pill (outline star · "Star" · chip 34.1k) snaps up @2.05, cursor CLICKS @2.85–2.95 → star fills GOLD, label odometers Star→Starred, count 34.1k→34.2k → hold. CURSOR NEVER MASK-EXITS: after click 1 it steps down-right and PARKS at (640,780) through the flight, comes UP to the pill, and finally exits fully off the bottom (y→1160, no fade). CustomEase CDN in MASTER head |

Click SFX: 7 master-level `<audio>` clips (`assets/sfx-click.mp3`, 0.648s, vol .4,
tracks 15–19 + 22–23) at 21.42 / 37.30 / 38.75 / 39.75 / 49.65 / 59.85 / 62.04 — every
cursor click in the film.

Master timeline carries ONLY the two output-card seam tweens (guarded by
`getElementById` — unguarded master tweens spam "GSAP target not found" per sub-comp).

## Standing rules (Jake's, do not regress)

- **Zoom is one-way.** Never pull back across cuts; Z direction = sign of scale velocity.
- **Zero overlap at swaps** — outgoing fully gone (autoAlpha kill after exit tween) before incoming shows.
- **BG pattern = ONE encode per act**, single full pass matching the act window, no
  looping/chaining, all via `setpts` to the EXACT window. Current: bg-act1 8.38s (from
  `bg-pattern.mp4`) / bg-act34 3.3s (from Jake's `heygen-pattern_1200x1200 (16).mp4`,
  8.0s 120fps) / bg-act5 14.45s (from `heygen-pattern_1200x1200 (15).mp4`, 8.0s 30fps,
  slowed 1.8×) / bg-act78 5.0s + bg-act9 9.7s + bg-act1011 8.2s spanning BOTH outro acts (from `bg-pattern.mp4`). Sources live in
  ~/Downloads. **Re-encode whenever an act's duration changes.**
- Highlights = the green→cyan selection gradient; green is rationed.
- Output videos live in the 960×540 rounded card at (60,270) — never full-bleed.
- No idle motion; no pet (removed); silent build (BGM/SFX in post).

## Gotchas from this session (will bite you)

1. **The preview server rewrites files** (stamps `data-hf-id` attrs) while running →
   python/string edits silently no-op AND `snapshot` can serve a stale bundle. Protocol:
   **kill the server → grep the exact current line → edit → lint/snapshot cold → restart**
   (`npx hyperframes preview --force-new`, port 3002, HYPERFRAME_RUNTIME_URL unset).
2. **Measured-pose + entry-tween race:** any `fromTo` with default `immediateRender`
   applies its from-state at build, BEFORE function-based measurement sets evaluate —
   `getBoundingClientRect` includes ancestor transforms, so poses overcorrect (act2's
   card landed 1250px off-screen). Use `immediateRender:false` on entry tweens that share
   an element/ancestor with a measured pose.
3. **Media EOF stutter:** `data-media-start` near a clip's end starves the decoder
   (the 0.32s replay at the fast clip's EOF). Source segments well inside the file.
4. **Media in sub-comp templates renders BLACK** (lint catches it now) — all
   `<video>`/`<img class="clip">` live in master `index.html`. Transforms on master-level
   media are fine (that's how the card entries work).
5. **Double-tween glitch:** the act5 closer was animated by BOTH the `.rl` loop and its
   dedicated tween → visible flicker. Loop selector is now `.rl:not(.closer)`. Watch for
   this pattern when adding lines to reply blocks.
6. **CSS transform + GSAP tween conflict** (lint error): elements the timeline moves must
   not carry CSS transforms — centering via gsap `xPercent/yPercent` set, or `fromTo`
   (exempt). Same family: `left/top` tweens banned (use x/y), per-element
   `transformPerspective` via a `tl.set` (not inline in two tweens → overlap warning),
   and NEVER a real 3D/perspective ancestor (kills master videos — hf-video-render).
7. **`box-sizing` is NOT reset in comps** — pad/width math is explicit border-box on the
   cards; a new padded fixed-width element will overflow like the cards did.
8. **`.hlfill` sweeps need per-card ids** (`#act1-hl1/2/3`) — a shared class selector
   fires all instances at once. Highlight phrases are unbreakable inline-blocks: must fit
   one line (≤ ~920px at 38px).
9. **act2 echo layers clone hero cards via `innerHTML` at load** — edit the 3 hero cards
   only; clones inherit (incl. names/copy).
10. **Fonts:** local `@font-face` from `assets/fonts/` (bundles at render). ABC Solar
    Display Bold + TT Norms Pro 400/500/700 + TT Norms Mono.

## Assets of note

- `assets/first-output.mp4`, `assets/motion-output.mp4` — Jake's hand-cleaned CapCut
  clips (the two card payloads). `output-poster.png` = frame 0 of first-output —
  RETIRED from the wiring (cards now enter already playing), kept for reference.
- `assets/fig-f1..f4.png` — stills from the seedance render, used as the Figma frames.
- `assets/bg-act*.mp4` — per-act pattern passes (see rule above).
- `assets/seedance-flow.mp4` (original 18s render), `seedance-flow-fast.mp4`,
  `end-card.mp4` — retired from the wiring but kept for reference.
- Contact sheet (`contact-sheet.html`) and `STORYBOARD.md` are direction-level docs;
  the build has evolved past some frame-level details in them — the comps are truth.

## If asked for tuning

Common dials: pop intensity (`scale 1.045` / `rotationY -7` / `rotationX 6` in act1),
ladder cadence (act2 `cuts` table), hold lengths (act3/4 exits), typing speeds (act5/act9
`duration` on the char tween), card geometry (master CSS `#output-vid` block). After ANY
act duration change: retime master starts downstream + re-encode that act's bg pass +
lint + cold snapshot. Do not render unless asked.
