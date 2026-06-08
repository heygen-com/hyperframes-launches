# frame.md Launch — Handoff

> Living doc. Update every session: what we're working on, what's left, decisions/notes.
> Last updated: 2026-06-03

## The Product / The Point

A workflow on **hyperframes.dev** where people upload their `design.md` and we convert
it into a **`frame.md`**. The conversion keeps what design.md is *good* at (defining a
brand language through color, typography, approach) but **reframes it for video output**
— which is NOT supposed to look like screens / UI / decks.

Core narrative (format shift):
1. `design.md` taught agents how a brand *looks*.
2. But it was born for web surfaces: components, cards, navs, grids, responsive layouts.
3. When agents use that directly for video, the result borrows web logic: cards, pills, panels, decks.
4. `frame.md` translates the same brand into cinematic/frame logic: scale, pacing, motion, dwell, composition.
5. Design goes in. Frame language comes out. Better video follows.

Key lines:
- > `design.md` describes the brand. `frame.md` directs the composition.
- > The problem wasn't the agent. It was the language we gave it.
- Close: *"design.md tells us what the brand is. frame.md tells us how it moves."*

CTA: `Try it at hyperframes.dev/design`

## How We're Building

- **Scene by scene**, as portable standalone pieces, then assembled into a full
  composition later. Keeps each scene editable/diffable in isolation.
- Each scene gets a **contact sheet** (static 16:9 keyframes, no animation) to lock
  visual direction before motion.

## 10-Beat Arc (from storyboard draft)

| # | Beat | VO (short) |
|---|------|-----------|
| 1 | Hook | "When you ask an agent to make motion graphics from a web design spec, it often builds a presentation." → full-frame `Why do AI videos look like slides?` |
| 2 | **Diagnosis** | "That's not random. Most design specs were written for websites and products. They describe buttons, cards, navs, grids, spacing." |
| 3 | The Missing Layer | "But a video agent needs different instructions… 16:9 frame, how long a message lives, what moves, what needs scale, what deserves silence." |
| 4 | Product Reveal | "So we built `frame.md`." |
| 5 | Definition | "It takes the brand language from `design.md` and translates it into video-native direction." |
| 6 | UI Flow | "Paste a design spec. HyperFrames reads it, interprets it, generates a frame language your agent can direct from." |
| 7 | Text Becomes Motion | "A paragraph like 'hero band with spotlight and terminal' stops being documentation. It becomes a scene plan." |
| 8 | Contrast | "Without it, agents arrange the brand like an interface. With it, they compose the brand like a film." |
| 9 | Ownership Moment | "This is not a prettier design file. It's a new format for video agents." |
| 10 | Close | "design.md tells us what the brand is. frame.md tells us how it moves." |

Note: Scene 1 (hook) may get **shorter** once Scene 2 is dialed — Scene 2 ties back into the hook.

## Decisions Locked

- **On-screen DESIGN.md = generic spec** (NOT the attached Composio example). Don't tie
  the launch to one customer brand. The attached `DESIGN (1).md` (Composio) is reference
  only — kept in the folder as the canonical *format* example of what a design.md is.
- Handoff doc lives here at project root; updated every session.

## Open Questions / To Revisit

- **2G wording**: current `Web Language → Presentation Feeling` is softer than the
  script's sharper alts (`Web Language → Slide Logic`, or script's `Not cards. Not slides. Frames.`).
  Tune once visual rhythm is locked.

---

## Animation (Scene 02) — first version built 2026-06-02

**Now an HF project:** `index.html` (root master, empty paused timeline) + `compositions/scene-02-diagnosis.html` (the animated scene, one continuous `paused` GSAP timeline registered to `window.__timelines["scene-02-diagnosis"]`, duration 11.2s). `package.json` added. Authored at 1920×1080 in px.

**Architecture (per agreed plan):** ONE composition, one continuous timeline. The doc in 2A–2C is the SAME element as 2D — a `#cam` wrapper zooms ~6× into the top-left headings, then zooms OUT to reveal the full doc. The doc became ONE consistent markdown file (DESIGN.md = H1 46px, ## Style Prompt = H2 38px) so the zoom is seamless (differs slightly from the static sheet's separately-tuned 2A-2C vs 2D — expected).

**Morph chain:** modal build (0–2.5) → camera zoom-out + pills pop (2.5–4) → 2D hold (4–5) → 3D tilt + terms travel to depths + frags emerge (5–6.2) → resolve to web UI (6.35–7.5) → 2F hold → reflow: `#win` grows to full-bleed + `#hero`/`#brand` reposition into slide + kicker/sub/pagenum fade in (8.7–10) → 2G hold. Shared persistent elements: `#doc` (2A–2E), `.term` words (2D→2F), `#hero`+`#brand` (2F→2G).

**Preview:** `launch.json` → `frame-md-hf` (port 5190). Studio URL `http://localhost:5190/#project/frame-md-launch-storyboard`. NOTE: per-comp `?t=` preview endpoint does NOT scrub (runtime resets to 0); scrub via the Studio player. Validated OK (only contrast warnings + a validate-context runtime 404 that doesn't affect Studio).

**Camera zoom constants** (tune to match 2A-2C framing): in script, `ZOOM = {x:-2861, y:-506, scale:6}`.

**v2 rework (2026-06-02, after first Studio review) — addressed 4 feedback points:**
1. *2A-2C too zoomed:* root cause — unified doc had H1≈H2 (1.2×) but approved keyframes had
   DESIGN.md ~1.7× bigger; uniform zoom can't reproduce that. Fix: doc H1=56px / H2=34px
   (~1.65×), camera `ZOOM={x:-1505,y:162,scale:3.5}` (was scale 6). **Verified** via static
   render: full DESIGN.md + ## Style Prompt (barely clipping bottom) + full `Written for
   pages` annotation, modal spilling right/bottom, paragraph off-frame. Matches approved.
2. *2D→2F was a cheat (crossfade-by-removal):* rebuilt as ONE real morph — the SAME dark
   `#panel` (was `#doc`) ROTATES (`rotateY` 0→-18→0 with `#cam` perspective) and RESHAPES
   (left/top/width/height/radius: doc-rect → window-rect) while the DESIGN.md text dissolves
   (blur+fade) and the UI elements come on. No separate `#win`, no parallax-zoom beat.
3. *2F overlaps:* root cause — mixed coord systems (frame-coord hero/brand vs window-relative
   nav/cards). Fix: ALL 2F UI now frame-coords (`.ui` class), positions computed to not
   collide. The dark window IS `#panel` reshaped.
4. *2F→2G:* left as-is (you said it's solved) — `#panel` expands full-bleed, hero/brand
   reposition into the slide.
   NEEDS YOUR STUDIO REVIEW: the morph (#2) and 2F layout (#3) — couldn't verify headlessly
   (snapshot/validate can't load the runtime; Studio scrub resets manual seeks). Scrub in
   Studio. 2A-2C (#1) is verified.

**✅ STALE-PREVIEW BUG — ROOT-CAUSED & FIXED (2026-06-03).** For hours, edits "didn't show"
in Studio. Two real causes:
1. **Zombie servers:** preview_stop/start did NOT kill the old bun process — up to 4 piled on
   port 5190 and requests hit a stale zombie serving old code/bundle. FIX (do every restart):
   `lsof -ti :5190 | xargs kill -9` BEFORE preview_start. Check `lsof -ti :5190 | wc -l` — if >1, zombies.
2. **`no-cache`+ETag header:** the Studio canvas iframe URL has no cache-buster; the browser
   reused the first-fetched copy across edits. FIX applied: changed `previewCacheHeaders` in
   `repos/hyperframes/packages/core/src/studio-api/routes/preview.ts` from `"private, no-cache"`
   → `"no-store"`. Resolves via the `./studio-api` export `import` → `src/...ts` (NOT dist), so
   src edit + clean restart takes effect, no rebuild. **⚠️ This is a local modification to the
   shared hyperframes repo (the only modified file) — Jake to decide commit vs revert.**
   After both fixes: `curl -sI <compURL>` shows `cache-control: no-store`; Studio canvas renders
   the current build on a NORMAL reload. (One Cmd+Shift+R needed once to flush a previously-cached copy.)
   Agent verification pattern: `curl -s <compURL> | grep <thing>` (server reads files fresh per request).

**v2.1 fixes (2026-06-02):**
- Annotation fixed (was the stale scale-6 bundle, not a code bug). Now renders wrapping the
  top-left at scale 3.5.
- Removed the 5 term pills (cards/buttons/nav/grids/spacing) around DESIGN.md in 2D, plus
  their pop-in and fly-off tweens and `.term` CSS. 2D is now just the clean document.

**v2.2/2.3 (2026-06-02/03):** annotation matched to storyboard 2C. Key learnings: (a) storyboard
Written ≈33% of frame height — must be BIG (font ~95 in cam); (b) `for` must be a TIGHT cluster
reading as a word, arc hugging the corner — NOT spread-out letters floating above.

**v2.4 (2026-06-03) — CURRENT annotation values** (cam coords, inside #cam scale 3.5; after Jake's
live nudges): `Written` x525 **y180** font95 rot-90; `f` x545 **y69** font56 rot-65; `o` **x565 y46**
font56 rot-42; `r` x596 y40 font56 **rot0**; `pages` **x628 y13** font54. (All verified served.)

**v2.4 — hero copy change:** `#hero` is now **"Interfaces,<br>not <u>videos</u>"** (was "interfaces,
not frames"). Persists into the 2G slide title. ⚠️ OPEN: 2G `#sub2g` still says "…like slides —
**not frames**" → mismatches hero "not videos". Decide: update sub2g to "not videos" or leave.

**Known tuning items for next pass (visual review in Studio):**
- 2G subtext copy consistency (see above).
- Camera zoom framing (does the zoomed-in 2A-2C exactly match the approved static look? `## Style Prompt` clipping bottom?).
- `Written for pages` annotation placement at the zoomed-in scale (was always the fiddliest).
- 2E term→fragment positions (do `nav`/`cards`/`grids` land convincingly on the frags?).
- 2E→2F: frags currently crossfade into the window rather than geometrically morphing into the navbar/cards — upgrade if it reads weak.
- Easing/timing once VO exists.

## Scene Status

### Scene 01 — Hook
- Status: **not started** (may be shortened after Scene 2 is dialed).

### Scene 02 — Diagnosis  ← CURRENT FOCUS
- Static keyframes: `scene-02-contact-sheet.html` (7 frames, locked).
- **ANIMATED:** `compositions/scene-02-diagnosis.html` (11.0s, in Studio). See "Animation" section above.
  Status: morph chain working; 2C annotation matched to storyboard + nudged; pills removed; hero = "Interfaces, not videos".
- This is the most dynamic section; it's the causal payoff to the hook.
- **Micro-arc:** source artifact → its hidden page-bias → bias made literal → the bad
  (interface-y) output it produces → the verdict.

| Frame | Beat | What it shows |
|-------|------|---------------|
| 2A | document enters too large for the frame | white field, black markdown card cropped hard right — source language enters before the frame has rules |
| 2B | source artifact resolves | `DESIGN.md / ## Style Prompt`, oversized, bleeding off-frame — reads as a *file*, not a composition |
| 2C | "Written for pages" | handwritten margin annotation wrapping the doc edge (annotation, not a gag) |
| 2D | markdown terms become visible | credible doc (colors/type/components); web nouns pulled as pills: cards · buttons · nav · grids · spacing |
| 2E | parallax zoom morph (KEY beat) | 3D-tilted DESIGN.md page (monospace) pushes toward camera; term chips lift off at z-depths and snap onto emerging dark UI fragments (nav bar, card panel). Real perspective, NOT flat rotate |
| 2F | web UI emerges | clean real landing page: chrome+URL, nav, hero "Interfaces, not <u>videos</u>", CTA, 3-card row. Polished but "medium-wrong" — interface in a video frame |
| 2G | diagnostic payoff | ONE full-bleed slide that IS a presentation slide: kicker "TRANSLATED FOR VIDEO" + title "Web language becomes a presentation." + sub + brand/01 footer. The frame demonstrates the point by being a slide (not a slideshow) |

- **KEY MECHANIC (2A–2C → 2D):** 2A–2C is a **zoomed-in design-note modal** that spills
  off the **right + bottom** edges. The composition will dynamically **zoom OUT** from this
  crop to reveal the full document in 2D. So 2A–2C MUST use the **same monospace markdown
  font + same content as 2D**, only larger — otherwise the zoom-out won't be seamless.
- **Session log:**
  - 2026-06-02: First tried centering/containing the doc (wrong — killed the spill).
    Corrected: `.figma-card` is now a zoomed-in modal — `left:26% top:22% width:92%
    height:110%` so it spills off right + bottom, shifted left of the original (`left:52%`)
    so the title reads. Switched font Inter → `ui-monospace` to match 2D. 2B/2C content
    is now a `.md-zoom` block (h3 `4.3cqw`, body `3.4cqw`) holding the SAME markdown as
    2D's `.md-page` (DESIGN.md → ## Style Prompt → launch-video paragraph → ## Colors).
    Verified 2C/2D side by side: clean zoom-out continuity. 2C `Written for pages`
    annotation x-coords set to wrap the new left edge (~26%).
  - NOTE: 2D still uses fixed `px` sizes while 2A–2C use `cqw`. Fine at contact-sheet
    scale; reconcile to one unit system when we build the actual zoom animation.
  - 2026-06-02 (cont.): 2A–2C now show ONLY `DESIGN.md` + `## Style Prompt` (dropped the
    paragraph/colors), much larger. 2C `Written for pages`: lifted the `f` of "for".
  - 2026-06-02 (cont.2): Scaled headings 1.15× → `.doc-h1` `12.65cqw`, `.doc-h2` `7.48cqw`.
    Pushed headings down via `.figma-card` padding-top `11.7cqw` (≈225px in a 1920-wide
    frame) so `## Style Prompt` barely clips the bottom edge of the 16:9 frame. `f` of
    "for" set to y259.5 (down 15 from prior). NOTE: 11.7cqw assumes a 1920px-wide render;
    re-derive if final composition width differs.
  - 2026-06-02 (cont.5): **Reconceived 2G** (then corrected). NOT a deck/filmstrip and NOT
    an app canvas — it's ONE full-bleed slide that IS a presentation slide. `.deck` = the
    slide itself (full-frame `#0b0b0c`, padded). Content = the diagnostic message rendered
    as a generic slide: `.slide-kicker` "TRANSLATED FOR VIDEO" + `.slide-title` "Web
    language becomes a presentation." + `.slide-sub` + `.slide-footer` (brand + "01"). The
    frame demonstrates the point by being a slide. Removed `.final` CSS + filmstrip/thumb/
    slide-main. Copy is placeholder — easy to tune.
    KEY UNDERSTANDING: 2G shows ONE frame that looks like a slide, not a slideshow.
  - 2026-06-02 (cont.4): **Rebuilt 2E (parallax morph).** Killed the flat `rotate(-45deg)`
    (violated its own "no flat rotate" note). New: `.morph-stage` w/ real 3D `perspective`,
    `.morph-doc` tilted `rotateX(29deg) rotateZ(-13deg)` so the page plane pushes toward
    camera; monospace `.morph-md` (consistent w/ 2C/2D). Sticker pills → clean `.term-chip`
    (`.near` foreground / `.far` background = z-depth). Added `.morph-frag` dark UI pieces
    (forming nav bar + card panel, 2F-style) that `nav`/`grid`/`cards` chips snap onto =
    "terms reassemble into interface." Dropped diamond `.zoom-rings`. Restyled motion-label.
    (Left 2D's `.word-pill` untouched.)
  - 2026-06-02 (cont.3): **Rebuilt 2F from scratch.** Old version had overlapping
    `.web-ghost` elements = muddy pile (misrepresents what HF outputs). New 2F is a clean
    real landing page, all in `cqw`: browser chrome (dots + `brand.com`), nav
    (brand / Product·Docs·Pricing / Get started), hero (`PLATFORM` eyebrow + real
    `interfaces, not frames` HTML headline + subhead + Get started/Read docs buttons),
    3-card feature row. Browser window inset `5.2cqw 10cqw` (~100px top/bottom, ~190px
    sides @1920) — much larger. Removed old classes `.ui-nav/.ui-pill/.ui-grid/.ui-card/
    .hero-type/.web-ghost`; new classes `.bw-chrome/.bw-url/.bw-page/.site-nav/.site-brand/
    .site-menu/.site-cta/.site-hero/.hero-*/.btn-*/.site-cards/.site-card`. Point of the
    beat: polished but "medium-wrong" — an interface arranged inside a video frame.
- **Next:** continue visual refinements on the contact sheet (direction TBD with Jake).

### Scene 03 — The Missing Layer
- Static keyframes: `scene-03-contact-sheet.html` (7 frames, no animation yet).
- Animated composition: `compositions/scene-03-missing-layer.html`, wired into `index.html`
  after Scene 2 at root start `11.2s`; root duration is now `22.2s`.
- Source visual language: Clay `DESIGN (3).md`, treated as a proto-`frame.md`.
- Core shift: Scene 2's black/white slide diagnosis gives way to a warm Clay-derived
  frame language: cream canvas, saturated cards, rounded display type, visible timing,
  motion paths, scale hierarchy, and negative-space silence.
- 2026-06-03 revision after Jake feedback:
  - 3A now references the exact Scene 2 2G end state: full-bleed black slide,
    `TRANSLATED FOR VIDEO`, `Interfaces, not videos`, subcopy, `DESIGN.md`, and `01`.
    Clay color begins as a diagonal right-edge wipe without covering the inherited slide copy.
  - 3C is no longer a frame-mapping diagram. It uses the real A-roll frame as the base plate,
    then local background removal puts Clay/frame-language elements in the gap between the
    original background and the foreground speaker cutout. The main visual is one oversized
    pink/lavender pill centered behind the speaker with only `16x9` inside it. Current
    implementation uses individual character spans at `37.8cqw`, `line-height: .72`, and
    `gap: .78cqw`, with `.c1 { margin-right: -.48cqw }` to optically correct the extra
    side-bearing between `1` and `6`. The type sits with roughly 50-65px top/bottom breathing
    room inside the pill at 1920x1080. The speaker should split
    the wordmark without turning it into scattered letters. Supporting shapes are the cleaner
    earlier set: peach circle, mint card, teal/ochre ribbons, and a couple small blobs, shifted
    down ~100px from the earlier placement. Caption remains on top in Clay style.
  - 3D is now a single centered lavender duration pill containing only
    `how long a message can live`; the duration rail handles the secondary "dwell" idea.
  - Added A-roll reference: `/Users/jakemoran/Movies/CapCut/16x9.mp4` is a 2.63s 16:9-ish
    clip (1916x1080, 30fps, AAC audio). Plan is to use its audio/VO timing and overlay
    captions/graphics on top in the animated implementation.
  - Animated 3C asset stack now lives in `assets/`: original HEVC copied as
    `scene-03-aroll.mp4`, H.264 render-safe plate as `scene-03-aroll-h264.mp4`, and local
    background removal output as `scene-03-aroll-cutout.webm`. Important: nested media clips
    needed stable `id`s and root-timeline `data-start="14.0"` to appear in HyperFrames
    snapshot/render while Scene 3 itself starts at `11.2s`.
- Beat map:
  - 3A: black presentation slide drains into Clay cream/color.
  - 3B: "But your agent needs different instructions." enters via zoom-through.
  - 3C: "use a 16:9 frame" becomes an A-roll matte moment: original background → Clay
    frame objects → foreground speaker cutout → Clay caption.
  - 3D: "how long a message can live" holds inside one centered duration pill with a rail.
  - 3E: "what should move" uses waterfall slide-in text lanes.
  - 3F: "what needs scale" recomposes around an oversized `scale` word.
  - 3G: "what deserves silence" removes visual furniture and lets negative space carry.
- Motion references to use later:
  - Zoom-through: exit scale/blur, entry from scale .75 with blur to crisp.
  - Waterfall: alternating left/right lanes, staggered, landing centered.
  - Scale: morph/recompose, not a simple pop.
  - Silence: opacity down, elements removed, slower pacing.

### Scenes 04–10
- Status: **not started.**

## Preview

Static server roots at `projects/active` on port 5186 (config: `.claude/launch.json` → `scene02`).
URL: `http://localhost:5186/frame-md-launch-storyboard/scene-02-contact-sheet.html`
