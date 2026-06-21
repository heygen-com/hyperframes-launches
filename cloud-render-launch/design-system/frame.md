# frame.md — brand-faithful: hyperframes.dev (Cloud Render launch)

Derived directly from `capture/` (extracted/tokens.json, design-styles.json,
screenshots/scroll-000.png — the **Community Playground** view). No preset palette, type,
or motion inherited. This frontmatter is the normative source for every composition.

The film has **two brands on screen on purpose**: **Claude Code** is the *interface* (the
chat/terminal device — its own clay UI, quoted faithfully from
`sfx-music-launch/terminal-sfx.html`), and **HyperFrames** is the *product* (the render
jobs, the playground grid, the endcard — mint→cyan). Keep them visually distinct: clay =
the assistant, mint = the product.

---
mode: brand-faithful
source: https://hyperframes.dev   # Community Playground capture
colors:
  # ── WORKING-WORLD GROUND (S1–S8): warm paper. hyperframes.dev light surface
  #    (#f6f5f1 / #f0efe9) ≈ Claude Paper cream (#F0EEE6) — deliberately unified. ──
  paper:        "#F0EFE9"   # primary ground — hyperframes --surface; matches the Claude terminal ground
  paper-panel:  "#F6F5F1"   # --page-bg / panel; one step up
  paper-sunken: "#E8E7E1"   # --surface-hover; sunken wells / inset
  ink:          "#0A0A0A"   # --text-primary; primary text on paper
  ink-2:        "#6B6B6B"   # --text-secondary
  ink-3:        "#999999"   # --text-muted
  hairline:     "#E0DFDB"   # --border-default (1px borders on paper)
  hairline-2:   "#D0CFCB"   # --border-strong

  # ── PAYOFF / "RENDERED" WORLD (S9 grid + every video tile, on any ground) ──
  void:         "#0A0A0A"   # the Community Playground ground (S9)
  void-nav:     "#000000"   # nav / chrome bar
  tile:         "#111113"   # video card / render-job tile fill (the playground card)
  tile-2:       "#18181B"   # tile elevated / hover
  tile-line:    "rgba(255,255,255,0.06)"  # solid hairline on dark tiles
  tile-dash:    "rgba(255,255,255,0.12)"  # DASHED hairline = "empty / generating" card (hyperframes' own move)
  on-void:      "#FAFAFA"   # text on dark
  on-void-2:    "#A1A1AA"   # secondary on dark
  on-void-3:    "#71717A"   # muted / labels on dark

  # ── BRAND ACCENT (the one HyperFrames color; rationed) ──
  mint:         "#3CE6AC"   # PRIMARY brand — progress, the "play" glyph, done-checks, the brand gradient start
  cyan:         "#00E3FF"   # brand gradient END — play button / logo lockup sweeps mint→cyan
  mint-soft:    "rgba(60,230,172,0.15)"  # mint fills / selection / focus ring (--selection-bg / --border-focus)
  on-mint:      "#0A0A0A"   # near-black text on a mint fill (the "New video" button)

  # ── CLAUDE CODE DEVICE (the terminal chrome only — do NOT use as HyperFrames brand) ──
  cc-window:    "#1D1F1F"   # terminal window body (dark, sits on paper)
  cc-text:      "#EFEADD"   # terminal cream text
  cc-muted:     "#8C8B83"   # terminal secondary
  clay:         "#D97757"   # Claude accent — caret, ✳ thinking, ↵ flash. The assistant's color, never the product's.
typography:
  fontFamilies:
    display: "'ABC Solar Display' 700 — the HyperFrames wordmark / mega lines. Fallback: 'TT Norms Pro' 700, then a tight geometric grotesk (Hanken Grotesk / Inter)."
    sans:    "'TT Norms Pro' 400/500/600/700 — product display, headings, chips, body. Fallback: Hanken Grotesk / Inter."
    mono:    "'TT Norms Pro Mono' 400 — commands, file paths, job ids, counts. Fallback: 'Spline Sans Mono'. THIS is the engineer texture (the `hyperframes cloud render` motif)."
  # Measured ramp (design-styles.json): display 30px/700/-0.75px; body 12px/500; link 12px/600.
  # The site renders small/dense (a real app UI). Frame scale = blow up generously for a 1920×1080 canvas.
  mega:    { fontFamily: display, fontSize: "150px", fontWeight: 700, letterSpacing: "-0.03em", lineHeight: 0.98 }   # text beats: "Don't be blocked by your machine."
  display: { fontFamily: display, fontSize: "104px", fontWeight: 700, letterSpacing: "-0.03em", lineHeight: 1.0 }    # product wordmark
  h2:      { fontFamily: sans,    fontSize: "60px",  fontWeight: 700, letterSpacing: "-0.02em", lineHeight: 1.08 }
  lead:    { fontFamily: sans,    fontSize: "30px",  fontWeight: 500, letterSpacing: "0",       lineHeight: 1.45 }
  body:    { fontFamily: sans,    fontSize: "24px",  fontWeight: 400, letterSpacing: "0",       lineHeight: 1.5 }
  chip:    { fontFamily: sans,    fontSize: "22px",  fontWeight: 500, letterSpacing: "0",       lineHeight: 1.2 }
  code:    { fontFamily: mono,    fontSize: "30px",  fontWeight: 400, letterSpacing: "0",       lineHeight: 1.5 }   # terminal commands
  label:   { fontFamily: mono,    fontSize: "18px",  fontWeight: 400, letterSpacing: "0.04em",  lineHeight: 1.3, transform: "uppercase" }  # job ids / counts
rounded:   # design-styles.json radius set: 8 / 14 / pill. Soft, not sharp.
  sm:   "8px"      # --radius; buttons, chips, small controls
  md:   "14px"     # cards / video tiles / the terminal window corners
  pill: "9999px"   # the "New video" pill button + status pills
spacing:   # design-styles baseUnit 4; observed [2,4,6,8,10,12,14,16,20,24]
  frame-pad: "100px"
  gutter: "28px"   # the playground grid gutter
  gap-tight: "12px"
motion:
  ease-out: "cubic-bezier(.16,1,.3,1)"      # the standard rise+fade
  ease-in-out: "cubic-bezier(.65,0,.35,1)"  # camera push / zoom-through
  dur-type: 0.045   # per-char mono typing cadence (terminal)
  dur-enter: 0.5
  dur-cut: 0.55
components:
  terminal:      { window: "cc-window md", text: "cc-text mono", caret: "clay block blink", traffic: "macOS r/y/g dots", note: "the Claude Code chat shell — port terminal-sfx.html verbatim; chips Local·CC·folder＋, metarow Auto … Opus 4.8·High ◌" }
  render-tile:   { background: "tile md", border: "1px tile-line", play: "mint→cyan play triangle", progress: "mint bar on tile-2 track", note: "the playground video card; reused for WAITING jobs, parallel jobs, and the final grid" }
  generating-tile:{ background: "tile md", border: "1px DASHED tile-dash", note: "a job mid-render = dashed-border card (hyperframes' own 'empty slot' affordance)" }
  new-video-btn: { background: "mint", color: "on-mint", rounded: "pill", font: "chip", note: "the one mint fill in the UI — top-right CTA on the dark playground" }
  status-pill:   { background: "mint-soft", color: "mint", rounded: "pill", font: "label", note: "✓ done / queued / rendering chips" }
  progress-bar:  { track: "tile-2 (or hairline on paper)", fill: "mint→cyan", note: "the 1% bar in the gag, and the filling parallel bars" }
  wordmark:      { font: "display", fill: "ink (on paper) / on-void (on dark)", play-glyph: "mint→cyan", note: "HyperFrames lockup; the play triangle carries the gradient" }
  cta-command:   { font: "code", color: "ink / on-void", note: "`hyperframes cloud render` shown as literal mono — the CTA is the command" }
---

## Overview

The register is **a calm warm-paper workspace that opens into a living dark playground**.
S1–S8 live on the same warm paper (`#F0EFE9`) the Claude Code terminal already sits on, so
the assistant, the text beats, and the product intro feel like one continuous desk. The
**payoff (S9) is the real hyperframes.dev Community Playground**: a near-black `#0A0A0A`
grid of 16:9 video cards, each with a mint→cyan play button — the place your renders end
up. The S8→S9 zoom-through is the door between the two worlds.

One brand color does all the HyperFrames work: **mint `#3CE6AC` resolving to cyan
`#00E3FF`** — the "play" gradient. It is the progress bar, the done-check, the play glyph,
and the logo sweep. The Claude Code terminal keeps its own **clay `#D97757`** for caret /
thinking / send — because it *is* Claude's UI, not HyperFrames'. Holding clay (assistant)
and mint (product) apart is the whole visual thesis: you ask Claude, HyperFrames renders.

Type is three voices: **ABC Solar Display** for the wordmark and the big text beats,
**TT Norms Pro** for everything legible, and **TT Norms Pro Mono** for the commands and job
metadata — the mono is what makes `hyperframes cloud render` read as a real tool.

## Frame Craft Bar

- **Squint test:** S1–S8 read as a warm paper field with one dark window or one big line;
  S9 reads as a dark grid of glowing video tiles with one mint logo in a cleared center.
- **Two grounds, never muddled:** paper = working world; `#0A0A0A` void = rendered world.
  Don't put a dark full-bleed scene in the middle of the paper run — the only void scene is
  the S9 payoff (the terminal windows are dark *objects on* paper, which is fine).
- **Mint is rationed** like a passing build — progress, done, play, logo. One mint gesture
  per frame. Never tint body text or large fills mint except the single "New video" pill.
- **Clay stays inside the terminal.** If clay appears outside the Claude Code window, it's a
  bug — the product never uses clay.
- **Video tiles are dark, on any ground.** A render is a dark `#111113` card with a mint
  play button. Dashed border = still generating; solid border = done.
- **Soft corners (8/14px), not sharp.** hyperframes.dev rounds everything; honor it.
- **Depth via lightness + hairlines**, not heavy shadows. The site ships only a whisper
  shadow (`0 1px 2px #00000005`). Cards separate by 1px hairline / dashed border.

## Do's and Don'ts

**Do:** warm paper working scenes · the Claude Code terminal verbatim (clay caret, traffic
lights, Opus 4.8·High metarow) · dark video tiles with mint→cyan play buttons · the literal
`hyperframes cloud render` command in mono · mint progress bars · the S9 Community Playground
grid as the payoff · ABC Solar Display wordmark with a mint→cyan play glyph · the cleared-
center logo landing inside still-playing footage.

**Don't (brand-breakers):** mint used as a body/fill color (it's an accent + the one pill) ·
clay anywhere outside the terminal · sharp 0px corners (the brand is soft) · a second
accent competing with mint (no random blue/purple/orange from the token list — those are
docs syntax colors, not brand) · heavy drop shadows / glows · a dark ground for the working
scenes · headlines in mono or commands in the sans.

## Motion Register

**Adjectives:** calm · workspace-real · momentum-on-the-beat · camera-led at the seams.

**Evidence:** hyperframes.dev is a real app — a playground grid of video cards that *play*,
a green "New video" CTA, dashed "generating" slots. The product metaphor is the render job:
it queues, it fills, it finishes. The film animates that literal lifecycle.

**Signature moves:**
1. **Terminal type-on** — user prompts + commands type at a mono cadence (~0.045s/char) with
   a blinking clay caret; the Claude Code grammar from `terminal-sfx.html`. Reserved for the
   chat + setup scenes.
2. **Progress as story** — the 1% bar barely creeps (the gag); later, parallel bars fill
   *simultaneously* in mint→cyan. Bars filling = the persuasion.
3. **Zoom-through the window (S8→S9)** — one continuous camera pushes *into* the terminal;
   it grows past the frame and dissolves to reveal the dark playground grid behind it. No
   cut — the window is the portal. Then a slow continuous push on the grid; the center tiles
   fade to carve negative space, and the logo settles into living footage.
4. **The frame keeps performing** — tiles keep playing, bars keep filling, the perimeter of
   the S9 grid never freezes even as the logo lands. A scene is never "done."
5. **Leftward cut-the-curve** at the harder seams (S2→S3, S7→S8) — directional cuts that
   carry momentum left (see SKILL-directional-continuity), matching the SFX film's grammar.

**Bans:** idle hover-wobble / sine-drift filler · overshoot beyond ~1.04 · neon glow on the
mint (it's a flat brand green→cyan, not a bloom) · crossfading the whole film (cut + the one
big zoom-through carry the seams) · pixel/CRT retro-isms · a static endcard (the logo lands
in moving footage, never on a dead frame).

---

## Font availability note

`TT Norms Pro` / `TT Norms Pro Mono` / `ABC Solar Display` are proprietary and were **not**
downloadable in capture (no webfont files). For the contact sheet and render, fall back to:
display/sans → **Hanken Grotesk** (already in `sfx-music-launch/fonts`), mono → **Spline Sans
Mono**, mega/wordmark → Hanken Grotesk 700 (or source ABC Solar Display if we license it).
The *system* (color, ratios, motion) is what's normative; swap the exact faces if we get them.
