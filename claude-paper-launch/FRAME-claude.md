---
# Claude Paper — frame.md
# Atoms are sacred · composition is free · numbers come from the script.
# Authoring unit: 1920×1080 frame. Frame-relative sizes expressed in vw
# (= cqw against a frame container) so plates render at any review size.

colors:
  # Canonical four — the brand atoms
  primary:   "#F0EEE6"  # paper / canvas — warm cream, never #fff
  secondary: "#262624"  # ink — warm charcoal, never pure black
  tertiary:  "#6F6E66"  # muted — warm grey, hairlines, quiet bands
  accent:    "#D97757"  # clay — the signature, one element per frame

  # Semantic aliases
  paper:         "#F0EEE6"
  canvas:        "#F0EEE6"
  ink:           "#262624"
  muted:         "#6F6E66"
  clay:          "#D97757"
  surface:       "#FAF9F5"   # warm off-white card
  surface-2:     "#F4F1E6"   # sunken / tint band
  accent-2:      "#CC785C"   # book-cloth — deeper clay
  clay-text:     "#A8472A"   # deep clay AS TEXT on light (~AA)
  hairline:      "#DCD8CC"   # warm hairline — replaces hard borders
  hairline-soft: "#E7E3D6"
  on-accent:     "#FBF7F0"   # text on clay
  on-ink:        "#EFEADD"   # warm cream text on ink

  # Warm decoratives — palette showcase only, never compete with clay
  kraft:  "#D4A27F"
  manila: "#EBDBBC"
  sky:    "#6E94A8"
  sage:   "#879A6B"

typography:
  fontFamilies:
    display: '"Hanken Grotesk", "Inter", system-ui, sans-serif'
    body:    '"Hanken Grotesk", "Inter", system-ui, sans-serif'
    mono:    '"Spline Sans Mono", "IBM Plex Mono", monospace'

  # READING RAMP — product/UI-scale hierarchy (px), with vw equivalent at 1920
  display:
    fontFamily:    "{typography.fontFamilies.display}"
    fontSize:      "124px"      # vw equiv ~6.45vw
    fontWeight:    800
    letterSpacing: "-0.03em"
    lineHeight:    0.92
  h1:
    fontFamily:    "{typography.fontFamilies.display}"
    fontSize:      "84px"       # ~4.4vw
    fontWeight:    800
    letterSpacing: "-0.025em"
    lineHeight:    0.96
  h2:
    fontFamily:    "{typography.fontFamilies.display}"
    fontSize:      "52px"       # ~2.7vw
    fontWeight:    700
    letterSpacing: "-0.02em"
    lineHeight:    1.05
  lead:
    fontFamily:    "{typography.fontFamilies.body}"
    fontSize:      "26px"       # ~1.35vw
    fontWeight:    500
    letterSpacing: "-0.01em"
    lineHeight:    1.45
  body:
    fontFamily:    "{typography.fontFamilies.body}"
    fontSize:      "27px"       # = 1.4vw@1920 — sits exactly on the load-bearing floor
    fontWeight:    400
    letterSpacing: "-0.01em"
    lineHeight:    1.65
  label:
    fontFamily:    "{typography.fontFamilies.mono}"
    fontSize:      "13px"       # chrome only — UPPERCASE
    fontWeight:    500
    letterSpacing: "0.14em"
    lineHeight:    1.0
    textTransform: "uppercase"

  # HERO / DISPLAY RAMP — frame-native, far larger than web reading
  wordmark-mega:
    fontFamily:    "{typography.fontFamilies.display}"
    fontSize:      "30vw"
    fontWeight:    800
    letterSpacing: "-0.04em"
    lineHeight:    0.84
  display-hero:
    fontFamily:    "{typography.fontFamilies.display}"
    fontSize:      "14vw"
    fontWeight:    800
    letterSpacing: "-0.035em"
    lineHeight:    0.88
  claim-l:
    fontFamily:    "{typography.fontFamilies.display}"
    fontSize:      "9vw"
    fontWeight:    800
    letterSpacing: "-0.03em"
    lineHeight:    0.94
  claim-m:
    fontFamily:    "{typography.fontFamilies.display}"
    fontSize:      "6.2vw"
    fontWeight:    700
    letterSpacing: "-0.025em"
    lineHeight:    1.02
  section-head:
    fontFamily:    "{typography.fontFamilies.display}"
    fontSize:      "4.2vw"
    fontWeight:    700
    letterSpacing: "-0.02em"
    lineHeight:    1.05
  stat-numeral:
    fontFamily:    "{typography.fontFamilies.display}"
    fontSize:      "18vw"
    fontWeight:    800
    letterSpacing: "-0.04em"
    lineHeight:    0.84
  stat-ledger:
    fontFamily:    "{typography.fontFamilies.display}"
    fontSize:      "4.8vw"
    fontWeight:    700
    letterSpacing: "-0.02em"
    lineHeight:    1.0
  lead-frame:
    fontFamily:    "{typography.fontFamilies.body}"
    fontSize:      "1.9vw"      # ~36px@1920 — above the 1.4vw floor
    fontWeight:    500
    letterSpacing: "-0.01em"
    lineHeight:    1.45
  body-frame:
    fontFamily:    "{typography.fontFamilies.body}"
    fontSize:      "1.5vw"      # ~29px@1920 — above the floor
    fontWeight:    400
    letterSpacing: "-0.01em"
    lineHeight:    1.55
  eyebrow:
    fontFamily:    "{typography.fontFamilies.mono}"
    fontSize:      "0.85vw"     # chrome only — below floor by design
    fontWeight:    500
    letterSpacing: "0.18em"
    lineHeight:    1.0
    textTransform: "uppercase"
  caption-pill:
    fontFamily:    "{typography.fontFamilies.display}"
    fontSize:      "3.6vw"
    fontWeight:    700
    letterSpacing: "-0.02em"
    lineHeight:    1.0
  quote-mark:
    fontFamily:    "{typography.fontFamilies.display}"
    fontSize:      "22vw"
    fontWeight:    800
    letterSpacing: "-0.04em"
    lineHeight:    0.7

rounded:
  sm:   "8px"        # chips, small elements
  md:   "14px"       # buttons, inputs, cards
  lg:   "22px"       # large cards, panels
  pill: "9999px"     # pills, rail, tags

spacing:
  pad-x:       "clamp(28px, 5vw, 88px)"   # web context
  pad-y:       "clamp(64px, 9vh, 116px)"  # web context
  content-max: "1280px"
  frame-pad:   "5vw"                       # safe-area on long edge
  frame-pad-y: "5.5vw"                     # safe-area on short edge of 16:9
  gutter:      "2vw"
  gap-tight:   "1.2vw"
  gap-loose:   "3.4vw"

motion:
  ease-out:    "cubic-bezier(.16, 1, .3, 1)"
  ease-in:     "cubic-bezier(.5, 0, .75, 0)"
  ease-in-out: "cubic-bezier(.65, 0, .35, 1)"
  dur-slide:   "0.8s"
  dur-enter:   "0.5s"

shadows:
  shadow-soft: "0 1px 2px rgba(38,38,36,.04), 0 12px 32px -18px rgba(38,38,36,.16)"
  shadow-card: "0 1px 3px rgba(38,38,36,.05), 0 22px 50px -26px rgba(38,38,36,.20)"

components:

  # ── Paper grounds (full-bleed surfaces) ─────────────────────────────
  ground-paper:
    backgroundColor: "{colors.paper}"
    textColor:       "{colors.ink}"
    padding:         "{spacing.frame-pad}"
  ground-ink:
    backgroundColor: "{colors.ink}"
    textColor:       "{colors.on-ink}"
    padding:         "{spacing.frame-pad}"
  ground-surface:
    backgroundColor: "{colors.surface}"
    textColor:       "{colors.ink}"
    padding:         "{spacing.frame-pad}"
  ground-sunken:
    backgroundColor: "{colors.surface-2}"
    textColor:       "{colors.ink}"
    padding:         "{spacing.frame-pad}"

  # ── Buttons ─────────────────────────────────────────────────────────
  button-primary:
    backgroundColor: "{colors.clay}"
    textColor:       "{colors.on-accent}"
    typography:      "{typography.label}"
    rounded:         "{rounded.md}"
    padding:         "14px 22px"
  button-primary-giant:
    backgroundColor: "{colors.clay}"
    textColor:       "{colors.on-accent}"
    typography:      "{typography.section-head}"
    rounded:         "{rounded.lg}"
    padding:         "1.6vw 3.2vw"
  button-secondary:
    backgroundColor: "{colors.paper}"
    textColor:       "{colors.ink}"
    typography:      "{typography.label}"
    rounded:         "{rounded.md}"
    padding:         "14px 22px"
    border:          "1px solid {colors.hairline}"

  # ── Pills, chips, eyebrows ──────────────────────────────────────────
  chip-mono:
    backgroundColor: "{colors.surface}"
    textColor:       "{colors.muted}"
    typography:      "{typography.eyebrow}"
    rounded:         "{rounded.pill}"
    padding:         "0.55vw 1.1vw"
    border:          "1px solid {colors.hairline-soft}"
  chip-mono-ink:
    backgroundColor: "transparent"
    textColor:       "{colors.on-ink}"
    typography:      "{typography.eyebrow}"
    rounded:         "{rounded.pill}"
    padding:         "0.55vw 1.1vw"
    border:          "1px solid rgba(239,234,221,0.32)"
  eyebrow-rail:
    backgroundColor: "transparent"
    textColor:       "{colors.muted}"
    typography:      "{typography.eyebrow}"
    padding:         "0"
  caption-pill:
    backgroundColor: "{colors.surface}"
    textColor:       "{colors.ink}"
    typography:      "{typography.caption-pill}"
    rounded:         "{rounded.pill}"
    padding:         "1.1vw 2.2vw"
    shadow:          "{shadows.shadow-soft}"
  caption-pill-active:
    backgroundColor: "{colors.clay}"
    textColor:       "{colors.on-accent}"
    typography:      "{typography.caption-pill}"
    rounded:         "{rounded.pill}"
    padding:         "1.1vw 2.2vw"
    shadow:          "{shadows.shadow-soft}"

  # ── Cards & surfaces ────────────────────────────────────────────────
  card-paper:
    backgroundColor: "{colors.surface}"
    textColor:       "{colors.ink}"
    rounded:         "{rounded.lg}"
    padding:         "2.4vw"
    shadow:          "{shadows.shadow-card}"
    border:          "1px solid {colors.hairline-soft}"
  card-sunken:
    backgroundColor: "{colors.surface-2}"
    textColor:       "{colors.ink}"
    rounded:         "{rounded.lg}"
    padding:         "2.4vw"
    border:          "1px solid {colors.hairline-soft}"

  # ── Ledger / data ──────────────────────────────────────────────────
  ledger-row:
    backgroundColor: "transparent"
    textColor:       "{colors.ink}"
    typography:      "{typography.body-frame}"
    padding:         "1.1vw 0"
    border-bottom:   "1px solid {colors.hairline}"
  ledger-numeral:
    backgroundColor: "transparent"
    textColor:       "{colors.ink}"
    typography:      "{typography.stat-ledger}"
    padding:         "0"
  hairline-rule:
    backgroundColor: "{colors.hairline}"
    height:          "1px"
    width:           "100%"

  # ── Swatch (palette plate) ─────────────────────────────────────────
  swatch-tile:
    backgroundColor: "{colors.surface}"
    textColor:       "{colors.muted}"
    rounded:         "{rounded.md}"
    padding:         "1.4vw"
    border:          "1px solid {colors.hairline-soft}"

  # ── Quote / editorial ──────────────────────────────────────────────
  quote-mark-clay:
    backgroundColor: "transparent"
    textColor:       "{colors.clay}"
    typography:      "{typography.quote-mark}"
    padding:         "0"

  # ── Footer / colophon ──────────────────────────────────────────────
  colophon:
    backgroundColor: "transparent"
    textColor:       "{colors.muted}"
    typography:      "{typography.eyebrow}"
    padding:         "0"
---

# frame.md — Claude Paper at frame scale

> **Atoms are sacred · composition is free · numbers come from the script.**

A warm editorial system, tuned for video. Cream paper, warm charcoal ink, muted grey, and a
single rationed clay accent — staged so the **frame** is the unit. Hanken Grotesk carries every
word; Spline Sans Mono carries every label. This file is self-contained: the frontmatter is the
normative source for every atom. The work is to keep the brand's calm at a size that fills a
1920×1080 plate.

---

## Overview

Claude Paper reads as a quiet editorial — a printed page given motion. At frame scale the
register is *paper, not poster*: warm cream grounds, generous margins, a single clay element
the eye finds first, and type that lands rather than performs. Hanken Grotesk does both the
oversized claim and the running line; weight does the work of italics.

### Frame Craft Bar

- **Squint test** — one element dominates at **3–6×** the next thing on the frame. The wordmark,
  the claim, the stat numeral, the caption pill — never two of them at once.
- **Silence test** — sparse archetypes (cover, claim, focal-artifact, closer) read **55–75% empty**.
  The cream paper is the brand; do not fill it to look complete. The **data ledger** is the one
  named density exception.
- **Restraint test** — clay fires **once per frame**, at full strength. If clay is in the caption
  pill, it is nowhere else. A second clay element demotes one to `{colors.clay-text}` or removes it.
- **Reference bar** — aim at a Penguin Modern Classics colophon page or a Pentagram editorial
  specimen. Failure looks like a SaaS dashboard with a tan background.

---

## Colors

The four atoms are the brand canon. At frame scale they re-allocate:

- **Grounds.** `{colors.paper}` is the default full-bleed ground for nearly every frame.
  `{colors.ink}` is reserved for one or two frames per sequence (caption stage, closer) where
  the brand wants its negative voice. `{colors.surface}` and `{colors.surface-2}` lift cards on
  cream — never the reverse.
- **Ink.** Every word lands in `{colors.ink}` on paper, `{colors.on-ink}` on ink. Pure black is
  banned. Muted body type uses `{colors.muted}` and never carries a beat's meaning alone.
- **Accent rule.** `{colors.clay}` is the **single** rationed element per frame — a caption
  active word, a CTA, a stat underline, a quote mark. If a frame needs a "second clay," use
  `{colors.clay-text}` for in-line word emphasis only, never as a fill.
- **Decoratives.** `{colors.kraft}`, `{colors.manila}`, `{colors.sky}`, `{colors.sage}` appear
  in the palette plate only; they may never share a frame with clay at fill strength.

---

## Typography

Two ramps share one face. The reading ramp (`display` → `label`) is the product/UI-scale px
hierarchy; the hero ramp (`wordmark-mega` → `quote-mark`) is **frame-native** in `vw`. Weight,
not a second family, carries hierarchy: **800** for display, **700** for sub-claims, **500** for
lead, **400** for body. Italics are not used; emphasis is weight or `{colors.clay-text}`.

**Legibility floor.** Any load-bearing line — anything carrying a beat's meaning — is **≥ 1.4vw**
(~27px@1920). The reading-ramp `body` is set to exactly that floor (27px = 1.4vw); nothing in
either ramp carries meaning below it. Sizes under the floor (`eyebrow`, `label`) are chrome:
kicker tags, indices, colophon — never the line the viewer needs to read.

**Fit-to-measure headlines.** A claim's size is a function of its line length. Cap the text block
at **≤ 78vw** wide and step the hero ramp by word count: **≤ 3 words** → `claim-l` (9vw); **4–6
words** → `claim-m` (6.2vw); **7+ words** → `section-head` (4.2vw). Short lines go big, long lines
go small — a fixed hero on a long line blows the edge.

---

## Layout — The Frame

- **Primary aspect:** 1920×1080 (16:9). Secondary: 1080×1920 (9:16) and 1080×1080 (1:1).
- **Safe area:** `{spacing.frame-pad}` on the long edge, `{spacing.frame-pad-y}` on the short.
  Nothing load-bearing crosses the safe margin; full-bleed grounds and edge crops may.
- **The vw law.** Authoring is **frame-relative** — sizes in `vw` against the 1920 long edge
  (`px ÷ 1920 × 100`). Atomic chrome (button radius, hairline, label px, shadow specs) stays in
  px. The frame, never the viewport, is the reference. (Portrait exception: in the aspect-ratio
  table, `vw` is measured against the **short** edge so display sizes step down correctly — called
  out per row there.)
- **cqw note.** In `frame-showcase.html`, each frame uses `container-type: size` and `cqw` is
  swapped 1:1 for `vw` so a small reviewable plate still renders at true frame proportions. The
  spec keeps `vw` because it reads naturally; the renderer maps it.
- **Anchor.** Frames lean **centered** (identity, claim, focal-artifact, closer). Editorial,
  ledger, and catalog plates may run **left**. Right/asymmetric is an occasional tension beat.
  No more than ~2 consecutive frames share an anchor.

---

## Elevation & Depth

The depth ceiling is **paper lift**. Cards sit on cream with `{shadows.shadow-card}` — a soft,
diffuse offset. Hard shadows, drop-shadows with visible offset, neumorphism, and inner shadows
are banned. A frame has at most **one** lifted plane; everything else is flat on the ground or
flat on the lifted surface. Hairlines (`{colors.hairline}`, `{colors.hairline-soft}`) do the
work that heavy borders would do on another brand.

---

## Shapes

Radius is generous and consistent: `{rounded.sm}` for chips, `{rounded.md}` for buttons and
inputs, `{rounded.lg}` for cards and panels, `{rounded.pill}` for pills, rails, and the
karaoke caption. No square corners on a load-bearing element; even an eyebrow tag is `pill`. CTA
geometry is always a pill or a 14px-radius button — never a sharp-cornered rectangle.

---

## Components

The frontmatter `components:` block is the normative source. This section gives intent and
when-to-use; resolved values live in the tokens above.

- **`{components.ground-paper}`** — the default full-bleed ground for nearly every frame. Sets
  the cream canvas + ink text + safe-area padding. If a frame is not on paper, name why.
- **`{components.ground-ink}`** — the negative voice. Reserved for the karaoke stage, the closer,
  or a deliberate beat of contrast. One or two per sequence at most.
- **`{components.ground-surface}` / `{components.ground-sunken}`** — alternate warm grounds for
  cards and tint bands; the catalog plate's ground lives here. Never used as a full frame ground
  on consecutive frames.
- **`{components.button-primary}`** — the rationed CTA at chrome scale. The clay button as it
  appears in product. **`{components.button-primary-giant}`** is the frame-scale variant for a
  CTA-as-focal frame: same atoms, scaled padding and `section-head` type.
- **`{components.button-secondary}`** — paper-on-paper, hairline border, ink label. Used beside
  the primary giant when a frame needs a second action; never carries clay.
- **`{components.chip-mono}`** — the small uppercase mono tag (section indices, archetype
  labels, kicker). `{components.chip-mono-ink}` is the inverted variant for ink grounds.
- **`{components.eyebrow-rail}`** — a top-edge label strip in `{typography.eyebrow}`. Use on a
  *minority* of frames; the top-left mono eyebrow on every frame is the deck tell.
- **`{components.caption-pill}` / `{components.caption-pill-active}`** — the karaoke pair. Past
  and upcoming words sit in the surface pill at reduced opacity (0.82 / 0.5); the active word
  swaps to the clay pill. The pill rides the reserved caption band along the bottom of the
  frame. This is the brand's signature.
- **`{components.card-paper}`** — the lifted editorial card on cream. Always paired with
  `{shadows.shadow-card}` and a `{colors.hairline-soft}` border (the hairline + shadow is the
  paper-lift recipe; the shadow alone is not enough). **`{components.card-sunken}`** is the
  un-lifted variant on `{colors.surface-2}` for ledger and aside content.
- **`{components.ledger-row}`** — a hairline-separated horizontal row carrying a label and a
  ledger numeral. Composes into the **data ledger** plate, the one density exception.
  `{components.ledger-numeral}` is the typographic atom inside it.
- **`{components.swatch-tile}`** — palette plate atom: a small `surface` tile with a top color
  band and a mono label/hex underneath. Used only in the catalog frame.
- **`{components.quote-mark-clay}`** — the giant clay opening quote on the closer plate. The
  one place clay is allowed at hero size; the quoted line itself stays in ink.
- **`{components.colophon}`** — the bottom-edge metadata strip in `{typography.eyebrow}`:
  index, run-date, frame number. Treat as chrome, never as content.

Construction notes the property tokens can't hold: the **paper-lift** recipe is
`{shadows.shadow-card}` + `1px solid {colors.hairline-soft}` together — never pick one. The
**caption band** is a reserved horizontal strip at the bottom **9–12vw** of the frame; the
pill is vertically centered within it.

---

## Motion & Timing

Motion is calm — settle, never bounce. Entrances ease out (`{motion.ease-out}`) and land; nothing
overshoots, nothing tilts. Warmth comes from timing and air.

- **Cut grammar.** A frame **enters by settling**: fade + 0.4vw rise, ending exactly on the
  composed end-state. No slide-from-edge, no scale-from-zero, no kinetic typography.
- **What may animate.** Caption words (karaoke pill swap), stat numerals (count-up at
  `{motion.ease-out}`), and an optional underline that draws under a single emphasized word in
  `{colors.clay}`. The wordmark may fade up; it never moves.
- **What must not animate.** The paper ground does not slide. The hairline does not draw.
  Cards do not flip. Clay does not pulse. The eyebrow rail does not type out.
- **Dwell.** Each frame holds long enough for the line to land. Pace varies by frame density
  (see treatments); pace is set by element count, not by faster motion.
- **Export.** 1920×1080 @ 30fps primary; 9:16 and 1:1 derived. All motion is GPU-cheap and
  static-friendly — every frame must read as a finished still on its own.

---

## Frame Treatments

Seven plates compose the frontmatter components. Each plate carries a **structural move**, a
**density**, and a Fixed/Free split. Plates never restate component construction; they place.

### 1 · Paper Identity  (identity/cover · move: wordmark centered, breathing)
**Ground** `{components.ground-paper}`, padding `{spacing.frame-pad}`.
**Container** single centered column; flex column, `align:center`, `justify:center`.
**Composes** `{components.ground-paper}`, `{components.chip-mono}`, `{components.colophon}`.
**Focal** wordmark in `{typography.wordmark-mega}` (30vw), centered vertically and horizontally,
ink on cream.
**Chrome** one `{components.chip-mono}` 4vw above the wordmark (kicker); `{components.colophon}`
pinned to the bottom safe-area.
**Accent** none — the cover earns its calm by *withholding* clay. (Brand-signature exception.)
**Silence** ~70% empty.
**Fixed** wordmark size, font, weight; cream ground; ink color; no shadow.
**Free** kicker copy, colophon index, sequence number.
**Pace** low.

### 2 · Oversized Claim  (editorial/oversized-claim · move: fit-to-measure centered claim)
**Ground** `{components.ground-paper}`, padding `{spacing.frame-pad}`.
**Container** centered single column, max width 78vw; flex column, `align:center`.
**Composes** `{components.ground-paper}`, `{components.eyebrow-rail}`.
**Focal** the claim. Size selected by word count: ≤3 → `{typography.claim-l}`; 4–6 →
`{typography.claim-m}`; 7+ → `{typography.section-head}`. One word in the line may take
`color: {colors.clay-text}` — the in-line emphasis allowance.
**Chrome** `{components.eyebrow-rail}` 6vw above the claim, centered; nothing below.
**Accent** the single clay-text word, if present. Otherwise the frame runs clay-free.
**Silence** ~60% empty.
**Fixed** centered anchor; cream ground; weight-as-emphasis rule; no italic.
**Free** the claim copy, eyebrow string, presence/absence of clay-text word.
**Pace** moderate.

### 3 · Karaoke Stage  (brand-signature · move: ink stage with rationed clay caption)
**Ground** `{components.ground-ink}`, padding `{spacing.frame-pad}`.
**Container** flex column, content top-anchored 16vw from top, caption band reserved bottom
12vw.
**Composes** `{components.ground-ink}`, `{components.chip-mono-ink}`,
`{components.caption-pill}`, `{components.caption-pill-active}`.
**Focal** the **active** word in `{components.caption-pill-active}`, centered horizontally in
the caption band. The active pill is the squint winner.
**Chrome** `{components.chip-mono-ink}` near the top-left of the safe area as a beat label;
two `{components.caption-pill}` pills flank the active pill (past at 0.82 opacity, upcoming at
0.5).
**Accent** the clay caption pill — the rationed element.
**Silence** ~70% empty (the ink stage is the silence).
**Fixed** ink ground; bottom caption band reserved; clay only on the active pill.
**Free** caption line, beat label.
**Pace** moderate.

### 4 · Focal Artifact  (focal-artifact · move: lifted paper card on cream)
**Ground** `{components.ground-paper}`, padding `{spacing.frame-pad}`.
**Container** centered, single artifact occupying ~62vw width × 50vw height.
**Composes** `{components.ground-paper}`, `{components.card-paper}`,
`{components.eyebrow-rail}`, `{components.button-primary}`.
**Focal** `{components.card-paper}` centered on the cream ground; inside the card, a label in
`{typography.label}`, a heading in `{typography.section-head}`, and a `{components.button-primary}`
at the bottom-right. The card is the squint winner via lift, not size.
**Chrome** `{components.eyebrow-rail}` top-left safe corner; nothing else.
**Accent** the clay button — the rationed element.
**Silence** ~58% empty (the cream margin around the card is the silence).
**Fixed** one lifted plane; paper-lift recipe (shadow + hairline); centered anchor.
**Free** card contents, label string, button label.
**Pace** moderate.

### 5 · Quiet Ledger  (data/ledger · move: hairline-ruled rows, one numeral per row)
**Ground** `{components.ground-paper}`, padding `{spacing.frame-pad}`.
**Container** two-column grid (label / numeral), 4 rows, gap `{spacing.gap-tight}`. Section
headline `{typography.section-head}` at top-left with `margin-bottom: 2.4vw` so a wrapped line
cannot collide with row one.
**Composes** `{components.ground-paper}`, `{components.eyebrow-rail}`,
`{components.ledger-row}`, `{components.ledger-numeral}`, `{components.hairline-rule}`.
**Focal** the column of `{components.ledger-numeral}` figures on the right edge — read as a
vertical run.
**Chrome** `{components.eyebrow-rail}` above the headline; `{components.hairline-rule}` between
rows (lives in the `border-bottom` of `{components.ledger-row}`).
**Accent** a single numeral may take `color: {colors.clay-text}` — only the one that matters.
**Silence** tight by design — the density exception.
**Fixed** hairline-ruled rows; left-anchored layout; numeral typography token.
**Free** row labels, numerals (from the script), which numeral wears clay-text.
**Pace** low.

### 6 · Palette Catalog  (chrome/catalog · move: ruled swatch grid)
**Ground** `{components.ground-sunken}`, padding `{spacing.frame-pad}`.
**Container** 4-column grid of `{components.swatch-tile}`, gap `{spacing.gutter}`. Section head
`{typography.section-head}` top-left, eyebrow above.
**Composes** `{components.ground-sunken}`, `{components.swatch-tile}`,
`{components.eyebrow-rail}`, `{components.colophon}`.
**Focal** the grid itself, read as a field — no single tile dominates.
**Chrome** label + hex inside each tile in `{typography.label}`; `{components.colophon}` at the
bottom safe edge with index and count.
**Accent** the `{colors.clay}` tile is the one tile a viewer naturally settles on — that is the
rationed accent for the frame.
**Silence** ~40% empty (denser than sparse plates, looser than ledger).
**Fixed** swatch tile construction; 4-column grid; mono labels.
**Free** which tokens appear, the order, the index.
**Pace** moderate.

### 7 · Pull-Quote Closer  (closer · move: giant clay quote mark, ink line below)
**Ground** `{components.ground-paper}`, padding `{spacing.frame-pad}`.
**Container** centered single column, `align:center`, vertical stack.
**Composes** `{components.ground-paper}`, `{components.quote-mark-clay}`,
`{components.colophon}`.
**Focal** `{components.quote-mark-clay}` at 22vw, centered, sitting above the line. The clay
quote mark is the rationed accent **and** the squint winner.
**Chrome** the quoted line in `{typography.claim-m}` ink, max width 64vw; attribution in
`{typography.eyebrow}` below; `{components.colophon}` at the bottom safe edge.
**Accent** the clay quote mark — used at hero size here, the one frame that allows it.
**Silence** ~65% empty.
**Fixed** quote-mark size and color; centered anchor; ink quoted line.
**Free** the quoted line, attribution, colophon string.
**Pace** low.

---

## Do's and Don'ts

**Do**

- Ration clay to the one element per frame the viewer should remember.
- Default to **centered** for cover, claim, focal-artifact, and closer.
- Let cream paper carry ~60–70% of the frame — silence is the brand.
- Use weight (700/800) and `{colors.clay-text}` for in-line emphasis — never italic.
- Pair the **paper-lift** recipe (`shadow-card` + `hairline-soft`) on every lifted card.
- Vary the anchor across consecutive frames (≤ 2 in a row share one).
- Keep one idea per frame; if it wants two, that is two frames.

**Don't**

- Set clay on two elements in the same frame at full strength.
- Use `#FFFFFF` or `#000000` anywhere — cream and warm charcoal only.
- Add a second accent hue, ever; decoratives may not stand in for clay.
- Use hard-offset shadows, heavy borders, or square corners on load-bearing chrome.
- Tilt, spring, or overshoot any element on entrance.
- Park a top-left mono eyebrow on every frame — that is the deck tell.
- Set load-bearing copy below the 1.4vw (~27px@1920) floor.
- Let a decorative element cross the headline or eyebrow rail (≥ 2vw keep-out).

---

## Aspect-Ratio Behavior

How each treatment reflows. Safe-area on the short edge is held; display sizes step down per
ratio so no load-bearing line drops below the **1.4vw floor** (re-measured against the new
short edge).

| Treatment            | 16:9 (1920×1080)                                        | 9:16 (1080×1920)                                                | 1:1 (1080×1080)                                                 |
| -------------------- | ------------------------------------------------------- | --------------------------------------------------------------- | --------------------------------------------------------------- |
| 1 Paper Identity     | Wordmark `wordmark-mega` 30vw, centered.                | Wordmark steps to ~22vw of the **short** edge; kicker stays.    | Wordmark ~20vw; colophon moves to a single bottom line.         |
| 2 Oversized Claim    | Fit-to-measure, max 78vw wide.                          | Claim wraps to 2–3 lines; step one ramp down; max 84vw of short edge. | Step one ramp down; max 80vw; eyebrow tightens.                 |
| 3 Karaoke Stage      | Caption band bottom 12vw; one pill row.                 | Caption band bottom 14vw of short edge; pills stack 2 lines if needed. | Caption band bottom 14vw; flanking pills may drop, leaving only active. |
| 4 Focal Artifact     | Card 62×50vw centered.                                  | Card becomes 80vw wide, 56vw tall, centered.                    | Card 78vw square; CTA wraps to its own row.                     |
| 5 Quiet Ledger       | 2-column grid, 4 rows.                                  | Single column; label above numeral per row; 4 rows.             | 2-column, 3 rows (one row trimmed).                             |
| 6 Palette Catalog    | 4-col grid of swatches.                                 | 2-col grid, 8 tiles.                                            | 3-col grid, 9 tiles.                                            |
| 7 Pull-Quote Closer  | Quote mark 22vw, line `claim-m` below.                  | Quote mark ~26vw of short edge; line wraps; step down one ramp. | Quote mark ~22vw; line max 78vw; attribution tightens.          |

---

## Approved Real Entities & Numerals

- **Brand wordmark:** *Claude* (set in `{typography.wordmark-mega}`, ink on cream).
- **Typefaces (named on the type plate only):** *Hanken Grotesk*, *Spline Sans Mono*.
- **Color hexes:** only those declared in `colors:` above. No other hex appears in a frame.
- **Numerals:** every figure on the ledger, every count-up, every stat comes **from the
  script**. The spec never invents a percentage, a count, or a date. Placeholder slots in the
  showcase use `— figure —` or `{price}` and are never read as data.

---

## Pre-Render Self-Audit

Run every check before finalizing a frame.

- **Squint** — one element dominates at 3–6× the next. If two elements tie, demote one.
- **Silence** — sparse plates read 55–75% empty. Ledger is the only exception.
- **Restraint** — `{colors.clay}` appears at full strength **once**. Count it.
- **Voltage** — no second accent hue; decoratives stay in the palette plate.
- **Weight** — emphasis is 700/800 or `{colors.clay-text}`. No italic anywhere.
- **Depth** — at most one lifted plane; lift uses the full paper-lift recipe.
- **Geometry** — every load-bearing corner is `sm/md/lg/pill`. No square corners on CTA.
- **Anchor** — centered by default for cover/claim/focal-artifact/closer. Anchor varies across
  consecutive frames; no more than ~2 share one.
- **Element count** — ≤ 2–3 distinct elements on a sparse frame (focal + ≤1 chrome + ≤1 accent).
  Two ideas → two frames.
- **Floor** — every load-bearing line ≥ 1.4vw (~27px@1920), including reading-ramp body.
- **Keep-out** — no decorative element crosses the headline or eyebrow rail (≥ 2vw clearance).
- **Wordmark/headline overflow** — claims do not clip the right edge; the wordmark fits within
  78vw on the wide edge.
- **Caption fidelity** — only the active word wears the clay pill; past/upcoming pills are
  `{components.caption-pill}` at 0.82 / 0.5 opacity.
- **Numerals from the script** — no invented figures.

---

## Known Gaps

- **vw as string value.** Sizes carrying a `vw` unit (the hero ramp, frame-scale paddings) are
  stored as strings. In the renderer, `vw` is swapped 1:1 for `cqw` against each frame's
  `container-type: size`, so a small reviewable plate still renders at true frame proportions.
- **Motion · Frame Treatments · Aspect-Ratio Behavior · Self-Audit** are the video-extension
  sections; a generic style-token consumer can safely ignore them and read only the frontmatter.
- **Aspect re-scales** are guidance, not strict numerics; a 9:16 plate may need a half-step
  adjustment per script word count.
- **Pace, not motion timing.** Treatments declare pace (low/moderate); per-element durations
  live only on the global `motion:` tokens, never inside a plate.
