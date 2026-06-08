## Overview

Composio's marketing site reads like a serious developer-infrastructure brand — closer to Vercel or Stripe Docs in atmosphere than to a typical AI-tools startup. The base canvas is a near-black `{colors.canvas}` (#0f0f0f) holding white type and a single voltage of **deep electric blue** (`{colors.primary}` — #0007cd) carrying every primary CTA, brand wordmark, and atmospheric spotlight glow that backs the homepage hero.

Type runs **abcDiatype** as the single sans family across display, body, navigation, and captions. Display sits at weight 500 — confident but not bombastic. Code blocks and terminal mockups switch to JetBrains Mono.

The page rhythm is monolithic: dark canvas top to bottom with subtle elevation steps via card surfaces. The brand's strongest visual signature is a **four-pane terminal-style mockup** — a 2×2 grid of dark code/output panels with a central blue spotlight glow behind them.

**Key Characteristics:**
- Single accent: `{colors.primary}` (#0007cd) for primary CTAs, wordmark, spotlight glows.
- Single sans family: abcDiatype carries everything except code (JetBrains Mono).
- Dark monolithic canvas: `{colors.canvas}` runs top to bottom; depth from `{colors.surface-card}` and `{colors.surface-card-elevated}` brightness steps.
- Terminal-mockup hero: 2×2 grid of code/output panes is the brand signature.
- Compact pill geometry: CTAs sit at `{rounded.md}` (8px), not full pills — developer-tool dialect.
- Spotlight-glow atmospheric backdrop: a radial blue glow centered behind hero content.
- 96px section rhythm.

## Colors

### Brand & Accent
- **Composio Blue** (`{colors.primary}` — #0007cd): Primary CTAs, wordmark, spotlight glow center.
- **Composio Blue Active** (`{colors.primary-active}` — #0005a3): Press state.
- **Spotlight Glow Tone** (`{colors.primary-glow}` — #1a26ff): Brighter blue used inside radial atmospheric glows.
- **Accent Cyan** (`{colors.accent-cyan}` — #00d4ff): Sparingly on data-flow visualizations.
- **Accent Violet** (`{colors.accent-violet}` — #7b3aed): Inside specific product illustrations only.

### Surface
- **Canvas** (`{colors.canvas}` — #0f0f0f): Page floor — near-black.
- **Canvas Deep** (`{colors.canvas-deep}` — #000000): Pure black for terminal mockup grids and code blocks.
- **Surface Card** (`{colors.surface-card}` — #181818): Default content card.
- **Surface Card Elevated** (`{colors.surface-card-elevated}` — #222222): Terminal panes, secondary buttons.
- **Surface Strong** (`{colors.surface-strong}` — #2a2a2a): Dropdown menus.

### Hairlines
- **Hairline** (`{colors.hairline}` — #222222): Default 1px divider.
- **Hairline Soft** (`{colors.hairline-soft}` — #1a1a1a): Lighter divider.
- **Hairline Strong** (`{colors.hairline-strong}` — #333333): Stronger panel outline.

### Text
- **Ink** (`{colors.ink}` — #ffffff): Display headlines.
- **Body** (`{colors.body}` — #a8a8a8): Default running-text — soft gray.
- **Body Strong** (`{colors.body-strong}` — #ffffff): Same as ink.
- **Muted** (`{colors.muted}` — #888888): Sub-titles, breadcrumbs.
- **Muted Soft** (`{colors.muted-soft}` — #666666): Disabled text.
- **On Primary** (`{colors.on-primary}` — #ffffff): White text on blue CTAs.

### Semantic
- **Success** (`{colors.semantic-success}` — #33d17a): "Online", "active" indicators.
- **Error** (`{colors.semantic-error}` — #ff4d4d): Validation errors.

## Typography

### Font Family
The system runs **abcDiatype** (Lineto) across every text role. Code blocks switch to **JetBrains Mono**. Fallback: `ui-sans-serif, system-ui, sans-serif`.

### Hierarchy

| Token | Size | Weight | Line Height | Letter Spacing | Use |
|---|---|---|---|---|---|
| `{typography.display-mega}` | 72px | 500 | 1.05 | -2.16px | Homepage hero h1 |
| `{typography.display-xl}` | 56px | 500 | 1.05 | -1.68px | Subsidiary heroes |
| `{typography.display-lg}` | 44px | 500 | 1.1 | -1.32px | Section heads |
| `{typography.display-md}` | 32px | 500 | 1.15 | -0.96px | Sub-section heads |
| `{typography.display-sm}` | 24px | 500 | 1.25 | -0.5px | Card group titles |
| `{typography.title-md}` | 18px | 600 | 1.4 | 0 | Component titles |
| `{typography.title-sm}` | 16px | 600 | 1.4 | 0 | Toolkit card titles |
| `{typography.body-md}` | 16px | 400 | 1.5 | 0 | Default body |
| `{typography.body-sm}` | 14px | 400 | 1.5 | 0 | Footer body |
| `{typography.caption}` | 13px | 400 | 1.4 | 0 | Photo captions |
| `{typography.caption-uppercase}` | 11px | 600 | 1.4 | 0.88px | Section labels, badge pills |
| `{typography.code}` | 13px | 400 | 1.5 | 0 | Code blocks — JetBrains Mono |
| `{typography.button}` | 14px | 500 | 1.0 | 0 | CTA pill labels |
| `{typography.nav-link}` | 14px | 500 | 1.4 | 0 | Top-nav menu |

### Principles
- **Display weight stays at 500.** Confident but not display-bold.
- **abcDiatype across every role.** No display/body family split.
- **JetBrains Mono on every code surface.**

### Note on Font Substitutes
abcDiatype is a Lineto licensed typeface. Open-source substitute: **Inter** at weight 500 with letter-spacing -1.5%.

## Layout

### Spacing System
- **Base unit:** 4px.
- **Tokens:** `{spacing.xxs}` 4px · `{spacing.xs}` 8px · `{spacing.sm}` 12px · `{spacing.base}` 16px · `{spacing.md}` 20px · `{spacing.lg}` 24px · `{spacing.xl}` 32px · `{spacing.xxl}` 48px · `{spacing.section}` 96px.
- **Section padding:** `{spacing.section}` (96px) for major bands.

### Grid & Container
- Max content width: ~1200px.
- Editorial body: 12-column grid.
- Terminal mockup grid: 2×2 equal-size panes.
- Toolkit grid: 4-up at desktop, 2-up tablet, 1-up mobile.
- Footer: 5-column at desktop.

### Whitespace Philosophy
The dark canvas creates its own depth — whitespace can stay tight without feeling crowded. 96px between bands; 24px between cards inside a band.

## Elevation & Depth

The system uses **brightness-step elevation**: surfaces step up in brightness instead of casting drop shadows. Combined with subtle radial blue glows, this creates a focused dark-mode atmosphere.

| Level | Treatment | Use |
|---|---|---|
| Flat (canvas) | `{colors.canvas}` (#0f0f0f) | Body bands, footer |
| Recessed | `{colors.canvas-deep}` (#000000) | Terminal mockup grid background, code blocks |
| Card | `{colors.surface-card}` (#181818) | Default content cards |
| Card elevated | `{colors.surface-card-elevated}` (#222222) | Terminal panes, secondary buttons |
| Atmospheric glow | Radial gradient using `{colors.primary-glow}` | Hero spotlight backdrop |

### Decorative Depth
- **Spotlight glow backdrops** — radial blue gradient centered behind hero content.
- **Terminal-pane brightness ladder** — 2×2 mockup uses canvas-deep outer + surface-card-elevated panes.

## Shapes

### Border Radius Scale

| Token | Value | Use |
|---|---|---|
| `{rounded.none}` | 0px | Reserved |
| `{rounded.xs}` | 4px | Inline tags |
| `{rounded.sm}` | 6px | Compact rows |
| `{rounded.md}` | 8px | CTA buttons, form inputs |
| `{rounded.lg}` | 12px | Toolkit cards, code blocks, terminal panes |
| `{rounded.xl}` | 16px | Feature cards, terminal mockup grids |
| `{rounded.pill}` | 9999px | Section-label badges |
| `{rounded.full}` | 9999px | Avatar plates (rare) |

Compact developer-ergonomic radii — 8px CTAs, 12-16px cards. Signals "developer tool" rather than "consumer brand."

## Components

### Top Navigation

**`top-nav-dark`** — Default top nav. Background `{colors.canvas}`, text `{colors.body-strong}`, height 64px. Layout: Composio wordmark left, primary horizontal menu (Product / Toolkits / Docs / Pricing / Customers / Blog), GitHub stars + Sign In + "Get started" right.

### Buttons

**`button-primary`** — The signature Composio Blue CTA. Background `{colors.primary}`, text `{colors.on-primary}`, type `{typography.button}` (14px / 500), padding 10px × 18px, height 40px, rounded `{rounded.md}` (8px).

**`button-primary-active`** — Press state. Background `{colors.primary-active}`.

**`button-secondary-dark`** — Surface-elevated secondary. Background `{colors.surface-card-elevated}`, text `{colors.body-strong}`.

**`button-outline`** — Transparent with 1px hairline-strong border.

**`button-tertiary-text`** — Inline text link.

### Hero & Atmospheric

**`hero-band`** — Homepage hero. Background `{colors.canvas}`, full-width display headline in `{typography.display-mega}` (72px / 500), subhead, two CTAs, and a spotlight-glow backdrop emanating from behind the centered terminal-mockup grid.

**`terminal-mockup-grid`** — The brand's strongest visual signature. 2×2 grid of dark code/output panels inside a `{rounded.xl}` (16px) container. Background `{colors.canvas-deep}`, padding 32px, gap 16px.

**`terminal-pane`** — Individual code/output panel inside the mockup grid. Background `{colors.surface-card}`, text `{colors.body}` in `{typography.code}`, rounded `{rounded.lg}` (12px), padding 20px.

**`spotlight-glow-card`** — Large feature card with centered display headline and a radial blue glow behind it. Background `{colors.surface-card}`, text `{colors.body-strong}` in `{typography.display-md}`, rounded `{rounded.xl}`, padding 48px.

### Cards

**`feature-card`** — 3-up benefit grid. Background `{colors.surface-card}`, text `{colors.body}`, type `{typography.title-md}`, rounded `{rounded.xl}`, padding 28px.

**`toolkit-card`** — 4-up toolkit grid (Slack, GitHub, Stripe, Notion, Linear, etc.). Background `{colors.surface-card}`, text `{colors.body-strong}`, type `{typography.title-sm}`, rounded `{rounded.lg}`, padding 20px. 40px square `{component.toolkit-icon}` top, toolkit name, one-line description.

**`toolkit-icon`** — Square icon plate. Background `{colors.surface-card-elevated}`, rounded `{rounded.md}`, 40px size.

**`testimonial-card`** — Quote card. Background `{colors.surface-card}`, text `{colors.body}`, rounded `{rounded.lg}`, padding 24px.

### Code

**`code-block`** — Inline code/terminal block. Background `{colors.canvas-deep}`, text `{colors.body}` in `{typography.code}`, rounded `{rounded.lg}`, padding 20px.

### Forms

**`text-input`** — Background `{colors.surface-card}`, text `{colors.body-strong}`, rounded `{rounded.md}` (8px), padding 12px × 16px, height 44px.

**`search-input`** — Compact search field. Same surface and radius, smaller padding, 40px height.

### Tags & Badges

**`badge-pill`** — Small uppercase pill. Background `{colors.surface-card-elevated}`, text `{colors.body-strong}`, type `{typography.caption-uppercase}`, rounded `{rounded.pill}`, padding 4px × 10px.

### CTA / Footer

**`cta-band-spotlight`** — Pre-footer band. Background `{colors.canvas}` with centered radial spotlight glow. Display headline + single primary CTA pill. 96px padding.

**`footer-dark`** — Closing footer. Background `{colors.canvas}`, text `{colors.body}`. 5-column link list. 64×48px padding.

**`footer-link`** — Background transparent, text `{colors.body}`, type `{typography.body-sm}`.

## Do's and Don'ts

### Do
- Reserve `{colors.primary}` for primary CTAs, wordmark, and spotlight glows.
- Use `{rounded.md}` (8px) for every CTA — not full pills.
- Use brightness-step ladder for elevation; avoid drop shadows.
- Pair every hero with a centered radial blue spotlight glow.
- Render code, CLI commands in JetBrains Mono via `{typography.code}`.
- Use the 2×2 terminal-mockup grid as the homepage hero anchor.

### Don't
- Don't introduce a secondary brand color. Cyan and violet are illustrative-only.
- Don't use full pills on CTAs.
- Don't drop display weight to 400.
- Don't add drop shadow tiers.
- Don't use canvas-deep (#000000) outside terminal/code surfaces.
- Don't extract a CTA color from a third-party widget (cookie consent, OneTrust). The brand's CTA color is what appears on actual page CTAs.

## Responsive Behavior

### Breakpoints

| Name | Width | Key Changes |
|---|---|---|
| Mobile | < 640px | Hero h1 72→36px; terminal mockup grid collapses to single pane; toolkit grid 1-up; nav hamburger. |
| Tablet | 640–1024px | Hero h1 56px; terminal mockup grid stays 2×2; toolkit grid 2-up. |
| Desktop | 1024–1280px | Full hero h1 72px; full 2×2 terminal mockup; toolkit grid 4-up. |
| Wide | > 1280px | Content caps at 1200px. |

### Touch Targets
- Primary CTA at 40px height — at WCAG AA, padded for AAA.
- Search input at 40px.

### Collapsing Strategy
- Top nav switches to hamburger below 768px.
- Terminal mockup 2×2 grid collapses to a single pane on mobile.
- Toolkit grid: 4-up → 2-up → 1-up.
- Hero spotlight glow stays at every breakpoint.

## Iteration Guide

1. Focus on a single component at a time.
2. CTAs default to `{rounded.md}` (8px). Cards use `{rounded.lg}` or `{rounded.xl}`.
3. Variants live as separate entries inside `components:`.
4. Use `{token.refs}` everywhere — never inline hex.
5. Hover state never documented.
6. abcDiatype 500 for display, 400/600 for body. JetBrains Mono on every code surface.
7. Composio Blue stays scarce.

## Known Gaps

- abcDiatype is licensed; Inter is the substitute.
- Animation timings out of scope.
- In-product surfaces (toolkit dashboards, agent playground) are behind login walls.
- Form validation states beyond focus not visible on captured surfaces.

## Video Composition Vocabulary

*Composition notes derived from the design system. Documents how each surface,
component, and typographic principle behaves at frame scale — useful for video,
presentation, and motion contexts including HyperFrames.*

### Frame-Scale Treatments

**Cover — wordmark + terminal split** (origin: `components.hero-band` + `components.terminal-mockup-grid`)
Identity plate. Two-column 16:9 — oversized lowercase wordmark with `{colors.primary}` punctuation accent on the left over the spotlight glow, 2×2 terminal mockup on the right. Single primary CTA carries the only saturated blue in the CTA stack. Frame-pace: moderate.

**Hero band with spotlight + terminal** (origin: `components.hero-band` + `components.terminal-mockup-grid`)
Anchor scene. Centered `{typography.display-mega}` headline with a `{colors.primary}` final clause, badge pair above, two CTAs, and the 2×2 terminal grid centered beneath inside a radial `{colors.primary-glow}` field. Frame-pace: low — needs dwelling for the code panes to read.

**Toolkit band — 4×2 grid** (origin: `components.toolkit-card`)
Inventory plate. Editorial head/sub on the left, 8 toolkit cards laid out 4-up over two rows, each with a square `{component.toolkit-icon}` initial, name, and one-line description. Frame-pace: high — scannable at a glance.

**CTA spotlight band** (origin: `components.cta-band-spotlight`)
Closer. Centered headline at `{typography.display-xl}` over a wide radial `{colors.primary-glow}` field, support line, two CTAs (primary + outline). The only band where the spotlight is the entire stage. Frame-pace: high — one beat, one read.

**Docs editorial** (origin: implied long-form surface; uses `components.code-block`)
Long-form plate. 14vw left rail with grouped `{typography.caption-uppercase}` labels and `{typography.nav-link}` rows (active item in `{colors.primary-glow}`), main column with breadcrumb, `{typography.display-xl}` page title, lede, sub-head, and a `{components.code-block}` on `{colors.canvas-deep}`. Frame-pace: requires dwelling.

**Top-nav plate** (origin: `components.top-nav-dark`)
Header bar. 64px tall `{colors.canvas}` strip with wordmark + horizontal menu left, GitHub star chip + Sign In + primary CTA right. Frame-pace: high.

**Spotlight glow card** (origin: `components.spotlight-glow-card`)
Quote/manifesto plate. Single centered `{typography.display-md}` line on `{colors.surface-card}` lifted by an internal `{colors.primary-glow}` radial. Frame-pace: moderate.

**Principle pair plate** (origin: Do/Don't section)
Two-up split. `{colors.semantic-success}` "Do" demo beside `{colors.semantic-error}` "Don't" demo, each in a `{colors.surface-card}` panel with a small dotted label and a live mini-component. Frame-pace: high.

### Frame-Pace Classification

**One beat — high utility:** Top-nav plate, CTA spotlight band, Toolkit band, Principle pair plate.
**Moderate:** Cover plate, Spotlight glow card.
**Requires dwelling:** Hero band with terminal (code panes need read time), Docs editorial (long-form copy + code).

### Composition Constraints Observed

- **Single accent.** Every `{colors.primary}` instance in the showcase maps to a permitted role from `do.reserve-primary-for-cta-wordmark-glow`: primary CTAs, the `composio.` wordmark accent dot, and spotlight glow centers. Cyan and violet appear only inside code-token syntax-highlighting, satisfying `dont.secondary-brand-color`.
- **Compact pill geometry.** Every CTA uses `{rounded.md}` (8px). `{rounded.pill}` is reserved for `{components.badge-pill}` and avatar plates, enforcing `dont.full-pill-cta`.
- **Brightness-step elevation, no drop shadow.** Surfaces step `{colors.canvas}` → `{colors.surface-card}` → `{colors.surface-card-elevated}` → `{colors.surface-strong}`. No `box-shadow` is used anywhere — `dont.drop-shadow-tiers` enforced.
- **Canvas-deep containment.** `{colors.canvas-deep}` (#000000) appears only inside `{components.terminal-mockup-grid}`, `{components.terminal-pane}` heads, and `{components.code-block}` — never as a generic card background. Enforces `dont.canvas-deep-outside-terminal`.
- **Display weight discipline.** Every display role renders at weight 500 — `{typography.display-mega}` through `{typography.display-sm}` — never dropped to 400. Enforces `dont.drop-display-to-400`.
- **Single sans family.** abcDiatype (Inter substitute) carries every role from nav to caption; `{components.code-block}` and `{components.terminal-pane}` are the only surfaces switching to JetBrains Mono.
- **Spotlight glow pairing.** Every hero-class plate (cover, hero band, CTA band, spotlight card) carries a radial `{colors.primary-glow}` backdrop, satisfying `do.pair-hero-with-spotlight-glow`.
- **96px section rhythm.** Section padding uses `6vw` (≈115px at 1920), preserving the documented 96px monolithic band cadence as the page widens.
