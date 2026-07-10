# Figma → HyperFrames Launch — Storyboard v1

Launch film for the **Figma integration** (`/figma` skill + `hyperframes figma asset|tokens|component`,
Figma Motion → GSAP timelines, storyboard frames → live-DOM motion).

**The arc:** the internet complains HyperFrames can't use *their* designs → we dramatize the
old pain (agent recreates screens badly from raw screenshots) → the fix is one line
(`/figma` + a link) → the agent visibly *sees* the real file (hex codes, frames, components)
→ faithful rebuild → rapid-fire payoff montage (motion / components / storyboards) → closing
thesis: what you built for your product is how you show it.

**Format:** 1920×1080 landscape. Built SILENT like `sfx-music-launch` (text-driven; BGM/SFX
pass in post — cue map added at build time). **NO VO (locked).** **Est. runtime ~49s.**

**Brand atoms (LOCKED — the HeyGen-for-Developers slide system,
`projects/_exports/heygen-devs-slides-2026-07-08/style.css`):** black photographic frames
(`bg-141-264/278.png` + gradient shade) · ink **#f5f6f4** (dims .72/.5) · accent green
**#5ef17c** · cyan **#4fd6ff** · pink **#e9a0f0** · dark mono chips **rgba(10,12,11,.78)** ·
glass cards (green-tinted border rgba(190,255,205,.32), blur+saturate, inset top light) ·
**ABC Solar Display** bold headlines (green .hl word) · **TT Norms Pro** body ·
**TT Norms Mono** eyebrows/labels/code (green, .22em tracking, dash prefix). Fonts + bgs +
logos copied into `assets/` and `fonts/`. The agent chat = the sfx-music-launch terminal
STRUCTURE (mask-open, typing, thinking, composer) restyled as a glass window with dark
composer chips. Green is rationed like clay was. Figma's own UI appears ONLY inside Jake's
screen recordings — we don't fake Figma chrome.

**Two production layers (hard rule):**
- **Real Figma actions = screen recordings Jake provides** (shot list at bottom). We never
  mock Figma's UI in DOM — preserves quality/feel.
- **Chat/agent interactions = built in HyperFrames** using the fake Claude Code terminal
  from `sfx-music-launch/compositions/terminal-sfx.html` (window grammar, typing, thinking
  shimmer, pet, composer inset).
- **X posts = registry `x-post` block** (`npx hyperframes add x-post`), restyled to the film.

---

## The arc (7 acts)

The current is **LEFTWARD**. Reserved vectors: **Z-forward zoom-through** for the tweet-flash
escalation (pushing deeper into the complaint pile), **Z-backward (arrival)** for the good
outputs landing, **upward** for the final thesis card. Ledger.json stamped at build time.

| Act | id | type | start | dur | beat | sustained-motion route | seam OUT |
|-----|----|------|-------|-----|------|------------------------|----------|
| **1 · Cold open + tweets** | `act1` | comp | 0.0 | 9.0 | "hyperframes is genuinely great" mask-reveals R→L → nudge left as "but" cascades in → DOCKS into tweet 1 (carrier = the sentence) → 3 glass x-post cards swap leftward (zero overlap) over the looping brand-pattern VIDEO → push-in (Z+) into card 3 | staged reveals → card swaps | zoom-through Z+ @9.0 |
| **2 · Zoom ladder** | `act2` | comp | 9.0 | 2.9 | ONE-WAY zoom ladder, 9 cuts, zoom strictly climbs 1.32→4.4, cadence .8/.5/.4/.3/.2/.15/.12/.1 — real cards zoomed, "Couldn't capture" highlight dead-center every cut | sequenced cuts + Z+ drift | last flash cut-the-curves LEFT @11.9 |
| **3 · Until now** | `act3` | comp | 11.9 | 2.0 | "**Until now**" giant ABC Solar over the pattern video; leftward in, leftward out | text beat | cut-the-curve LEFT @13.9 |
| **4 · Introducing /figma** | `act4` | comp | 13.9 | 3.5 | "Introducing" arrives center → slides UP + scales DOWN (STAYS as kicker) → giant green mono **/figma** rises into center | staged reveal, upward current | hard cut @17.4 |
| **5 · The /figma run** | `act5` | comp | 17.4 | 7.0 | Claude Code terminal (sfx grammar): big prompt box types `Use /figma to rebuild these frames <blue link> and then invoke the /product-launch-video…` → cursor taps ↵ → composer morphs to dock, window shrinks → thinking ✳ → agent streams FINDINGS (hexes / type / frames-as-states). NO FAIL BEAT — good path only. | cursor-led → sequenced UI life | window gives way to the output (TBD) |
| **6 · The outputs** | `act6` | comp | ~24.4 | ~4 | "Done. Every hex, every radius — straight from your file." → faithful seedance rebuild ARRIVES full-frame (inverse zoom, Z−) → the flow PLAYS leftward (states, not slides) → into payoff montage | sequenced UI life | zoom-through into montage |
| **7 · Payoff montage** | — | comp + REC | TBD | ~7 | Figma Motion / components / storyboard REC placeholders → prompt flash → result (unchanged from v1 plan) | sequenced cuts | zoom-through into outro |
| **8 · Thesis + outro** | — | comp | TBD | ~4 | their video's last seconds → "HyperFrames now speaks Figma." → /figma chip + lockup | staged reveals | end |

**Built through Act 5 (master 24.4s). FAIL/FIX ARC CUT (2026-07-09): no bad output, no "oops — forgot /figma", no side-by-side compare — the chat is one clean /figma run with good outputs only.**

---

## On-screen copy (verbatim — DRAFT, confirm before lock)

**Act 1 — hero tweets** (handles/avatars fake, engagement numbers modest-real):
1. `@founder_ish` — "hyperframes is genuinely great but it can't use my actual designs. why would I ship a launch video that doesn't look like my product?"
2. `@designwilla` — "cool tool. still couldn't get it to match what we built in Figma without babysitting every frame."
3. `@shipfast_sam` — "love the motion. hate that it keeps inventing a UI we don't have."

**Act 2 — zoom-ladder cards** (AS BUILT — hinge phrase highlighted, "Couldn't capture" stem in echoes):
- `@tomships` — "what was even the point. it **Couldn't capture the screens I gave it.** like I attached them for a reason"
- `@priyamakes` — "the layout was close-ish but it just **Couldn't capture our actual UI.** the buttons weren't even our buttons lol"
- `@dana_builds` — "third render in a row came back off. it **Couldn't capture my brand.** honestly gave up after that."
- Echoes: same three cards re-cropped tighter on "**Couldn't capture**".

**Act 3 — text card:** `Until now` (alone, big — the "attempts." beat was cut).

**Act 4 — introducing:** `Introducing` → `/figma` (giant green mono; the skill name IS the invocation).

**Act 5 — chat, the /figma run (GOOD PATH ONLY):**
- User (typed in the big box): `Use /figma to rebuild these frames figma.com/xK9… [short blue link] and then invoke the /product-launch-video to make a launch video for our new feature`
- Agent (streaming findings, mono — REAL values from the seedance file):
  - `Reading your Figma file… 4 frames found.`
  - `Brand tokens → #232833 · #FBFAF9 · #DEF0F8`
  - `Type → ABC Solar Display / TT Norms Pro`
  - `Frames read as states → rebuilding as live DOM…`
- Act 6 closer: `Done. Every hex, every radius — straight from your file.` → the outputs.

**Act 6 — montage one-liner prompts** (composer flashes only):
- `add this animation to the intro` (Figma Motion)
- `use our real pricing card here` (component)
- `make this storyboard a video` (storyboard row)

**Act 7 — thesis:**
- `HyperFrames now speaks Figma.`
- `What you built for your product is how you launch it.`
- `/figma` (Spline Sans Mono chip, clay) → lockup.

---

## "Their app" = the seedance-apps-flow design (LOCKED)

The product in the story is the **HeyGen AI Video Generator 4-step flow** already pulled
from Figma in `projects/active/seedance-apps-flow/` — our first figma-pipeline validation
build. Everything we need exists:

- **Screenshot props (Act 4):** the 4 step frames from the Figma file (Jake exports PNGs,
  or we snapshot the existing comp states).
- **Real brand values (Act 5 agent findings):** ink `#232833`, off-white grounds
  `#FBFAF9 / #F1F0EE`, blue tints `#DEF0F8 / #EDF6FB`; type **ABC Solar Display / TT Norms
  Pro**; frozen assets `cursor.svg`, `sidebar.png`, `orb-bg.png`.
- **The GOOD rebuild:** the existing gate-green seedance-apps-flow comp itself (or excerpts
  of its render) — the payoff is literally real.
- **The BAD recreation (Act 4, new comp):** same layout intent, wrong everything — palette
  drifts teal/generic-purple, wrong radius, system font instead of ABC Solar, one invented
  element (e.g. a fake progress bar). Built as a cheap one-off HF comp.
- **The Figma link pill (Act 5):** the real seedance file URL.

## Screen-recording shot list (Jake provides, 1080p+, cursor visible)

1. Figma Motion: timeline panel open on an animated element; scrub/play ~3s.
2. Component frame: select a component frame (e.g. pricing card), brief hover on layers panel.
3. Storyboard: canvas with a row of 4–6 scene frames; slow pan/zoom across the row ~3s.
4. (For Act 5, optional) Copy-link moment in the REAL seedance Figma file: right-click
   frame → Copy link — only if we want a 0.5s real-Figma insert before the paste;
   otherwise the link pill just appears in chat.
5. The 4 seedance-flow step frames exported as PNGs (the screenshot props for Act 4) —
   from the same Figma file seedance-apps-flow was built from.

## Build notes

- `x-post` block from registry; check its animation defaults, restyle to cream film ground.
- Terminal comp: fork `sfx-music-launch/compositions/terminal-sfx.html` grammar — mask-open,
  typing, thinking shimmer, reply stream, pet. Acts 4–5 are ONE window / one continuous
  scene with an internal nudge (cut-the-curve §7), not two comps.
- Oversized cursor per `oversized-cursor`: off-screen entry, tip-targeted drag of the
  screenshot thumbnails, press→compress→release mechanic.
- Zoom-flash act: one comp, pre-rendered crops as absolutely-positioned children, hard cuts
  via autoAlpha at exact frames (zero-overlap rule; watch clip-data-start flash gotcha).
- Screen recordings: keep `<video>` flat 2D (no CSS 3D ancestors — hf-video-render gotcha);
  every media element gets an `id`.
- DO NOT render until asked.

## Locked decisions

- **No VO** — silent build, text-driven; BGM/SFX in post.
- **The app = seedance-apps-flow** (HeyGen AI Video Generator flow, already pulled from
  Figma); Act 5 findings use its real values; the good rebuild reuses the existing comp.

## Open questions for Jake

1. Runtime target OK (~46s), or tighter (~35s → trim Act 4 to ~7s and montage to ~5s)?
2. Hero-tweet copy tone OK? Can push snarkier or softer.
3. Act 6 montage: the Figma Motion + component + storyboard beats need recordings from a
   file that has them — same seedance file, or a different demo file you have handy?
