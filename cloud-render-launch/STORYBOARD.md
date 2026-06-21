# Cloud Render — Launch Video (DRAFT STORYBOARD v4)

**Feature:** HyperFrames Cloud Render on **HeyGen** — managed, hosted rendering. Zero infra,
no local Chrome / ffmpeg, pay-per-credit. CLI: `hyperframes cloud render` (auth via
`hyperframes auth login` → HeyGen).

**Length:** ~30s · **No voiceover** — text-on-screen + visuals. **Aspect:** 16:9.

**Brand / design register:** see `design-system/frame.md`. **Everything lives on the warm
paper ground.** Two brands on screen: **Claude Code** is the *interface* — **one persistent
chat window** ported from `sfx-music-launch/terminal-sfx.html`, **including the pixel-pet
character**, clay accent; **HyperFrames/HeyGen** is the *product* (mint→cyan; the render
pipeline + the playground grid). Clay only ever inside the Claude window.

**Persistence rule:** every chat scene shows the **accumulated conversation history + the
prompt box** — it is the same window growing across the film, never a fresh card.

**Skill under test:** `product-launch-video` (skills-fresh worktree).
**Mockups:** `contact-sheet.html` (13 cells, live preview).

---

## Story shape

- **Archetype:** Before-After-Bridge — local render crawls at 1% on your machine → *don't get
  blocked by your machine* → connect HeyGen, fire all projects → cloud fleet finishes everything.
- **Hook:** pain validation in a real Claude Code chat (the absurd 1% / ~15 min answer).
- **The render is REAL pipeline code**, never fake job pills: local = `1 worker`, slow; cloud =
  `plan → renderChunk ×N → assemble` (240-frame chunks, ≤16 parallel workers; seek→capture→
  ffmpeg per frame, IDR keyframes, lossless assemble → signed `video_url`).

---

## Scene-by-scene

### S1a — Opener · type + send  (0:00–3.0, ~3s)
- **Faithful terminal-sfx opener:** full-bleed Claude Code window, a **focused, centered prompt
  box** (NOT full-width) with the **Claude Code pixel-pet perched on top**. Prompt types in with
  the clay caret; the **macOS cursor rises to ↵ and taps**:
  > *"Hey, can we render my edited podcast video?"*
- **Transition out:** `morph` — message flies up to the bubble while the composer **docks** and
  the window **shrinks from full-bleed to floating** (one continuous move).

### S1b — Reply · text only  (3.0–6.0, ~3s)
- Floating window. History: the user bubble. Claude replies in **plain text**:
  > *"On it — rendering **podcast-final.mp4** locally now. It'll take a little while."*
- **No job pill, no progress bar.** The **prompt box stays.**

### S2 — Ask · five projects  (6.0–8.0, ~2s)
- **History persists** (S1 turn dimmed at top). We type msg 2 in the composer; cursor clicks ↵.
  **No reply yet** — Claude goes to check.
  > user: *"can we also render my five projects from yesterday?"*
- Asking for the **five from yesterday** is what makes the queue (S3) and the "all 6" cloud render
  (S5+) consistent. **Transition out:** `cut` → Claude checks.

### S2.5 — Claude checks  (8.0–9.5, ~1.5s)
- **Hard cut to the big Claude thinking Lottie** — the **real** *Claude Icon Loading* animation
  (`assets/claude-thinking.json`, 500×500, fr 30), laid out exactly like claude-paper's
  **`thinking-big.html`**: the clay starburst at **`width:14cqw; height:14cqw`** in a flex row
  **beside a serif word** (Galaxie Copernicus 9.5cqw) — here *"Checking…"* — with the light-band
  shimmer sweeping the word. (Source `.lottie` also saved at `assets/claude-thinking.lottie`.)
- **Build = render-safe:** autoplay off, neutralize `goToAndStop`, drive the frame via a GSAP
  `onUpdate` (frame 0→~55 over the beat) — the `hf-lottie-pattern`. (In the contact sheet it just
  autoplay-loops for preview.) A short connective beat that hands straight into reading the worker.
- **Transition out:** dive into the log.

### S3 — Reading the worker  (9.5–13.0, ~3.5s)
- **Claude reads the worker.** Same dense local console as before, but now a **mint highlight scans
  line by line downward** through the log and **stops on the elapsed/eta line** — visceral proof of
  the crawl:
  ```
  $ hyperframes render ./podcast --out renders/video.mp4
  ✓ project loaded · 1440 frames · 1920×1080 @30fps
  ✓ headless chrome ↑ 1 instance (local · your GPU)
  ──────────────────────────────────────────
  frame 0014/1440   seek 0.467s → capture → encode
    ↳ png 1920×1080 · h264 · 3.1 MB · 1 frame at a time
  ▶ fps 1.6   elapsed 00:09   eta ~14m 51s        ◂ scan stops here
  ▓░░░░░░░░░░░░░░░░░░░░░  1%
  ──────────────────────────────────────────
  ● GPU 100%   ● 1 worker · serial   fans spinning
  ◌ queued (yesterday): product-demo · teaser · ad-cut-02 · reel-03 · promo-01
  ```
- **Animate:** the highlight sweeps top→bottom and **lands on `fps 1.6 · elapsed 00:09 · eta ~14m`**
  (the last line it highlights). One local worker is the cap; 5 projects sit queued. (Direct contrast
  with S6's 16-worker fleet.) **Transition out:** back to the chat window.

### S3.5 — Claude responds  (13.0–16.0, ~3s)
- **Back to the same window** (history kept). Claude reports what it just read, then offers the two
  paths — **no emoji**:
  > Claude: *"The podcast render's at **1%** — about **15 minutes** to go. I can add them to the
  > queue, or render them on **HeyGen Cloud Render** so your machine stays free."*
- **Be explicit it's HeyGen**, not the AWS (`hyperframes lambda`) or GCP (`cloudrun`) paths — the
  film sells the **managed HeyGen** `hyperframes cloud render` only.
- **Transition out:** `cut` (leftward cut-the-curve) → text beat.

### S4 — Text beat · the turn  (16.0–18.5, ~2.5s)
- **Single line:**
  > **Don't get blocked by your machine.**
- Words **waterfall in right-to-left** — "machine." leads, the line assembles toward the left —
  then "**machine.**" resolves into the **mint→cyan gradient**. The only color on the frame.
- **Transition out:** back to the chat window.

### S5 — Connect HeyGen + ask  (18.5–21.5, ~3s)
- **Back to the same chat window** (history kept). The setup flow runs inline:
  > `$ hyperframes auth login`  →  **✓ Connected to HeyGen**
  Then the user asks — naming the product specifically:
  > *"Let's do it — render all 6 on **HeyGen Cloud Render**."*
- **Transition out:** `cut` → the fleet.

### S6 — HeyGen fleet · parallel  (21.5–25.0, ~3.5s)
- **The technical visual (quick).** All 6 projects on HeyGen's fleet at once:
  ```
  HeyGen Cloud Render · 6 projects · plan → renderChunk → assemble
  w00 podcast   [0–239]     ▓▓▓▓▓▓▓▓ done
  w03 product   [240–479]   ▓▓▓▓▓▓░░
  …  16 workers · seek→capture→encode · idr · assemble→video_url
  ```
- 240-frame chunks, up to 16 parallel workers, each a frame range. Real ascii log, machine idle.

### S7 — All finished  (25.0–27.0, ~2s)
- **Back to the same window** (history kept): a quick **✳ working** beat, then the plain-text
  payoff line:
  > *"All 6 projects have finished rendering."*
- Closes the loop on the 1% gag. **Transition out:** `zoom` — **zoom-through the window**.

### S8 — Payoff + logo  (27.0–30.5, ~3.5s)
- **On the cream ground** (same world as the chat/code). The camera pushes **through** the window
  onto a grid of finished videos — **dark tiles on paper**, each playing. The push continues; the
  **center tiles fade** to carve space; the **real HyperFrames logo (SVG, `hyperframes-dark.svg`,
  the HeyGen·HyperFrames lockup)** settles into still-playing footage with the CTA command
  `hyperframes cloud render`. Perimeter never freezes.

> **Two camera seams:** leftward **cut-the-curve** into the turn (S2→S3→S4), and the
> **zoom-through** into the payoff (S7→S8). One persistent chat window threads the film; the
> render consoles are dark windows on the same cream.

---

## Changes from v3 (your notes)
- **Faithful opener**: focused centered prompt box (not the wide version) **+ the Claude Code
  pixel-pet character** (pet-typing.mp4 from sfx-music-launch).
- **Restored the local-machine-slow scene (S3)** showing the *first* video crawling on *your*
  computer — the bottleneck — BEFORE the text beat. (v2 had wrongly turned the "machine" beat
  into a cloud all-projects render.)
- **New setup flow (S5)**: connect HeyGen (`auth login` → ✓ Connected) then ask to render **all 6
  projects on HeyGen Cloud Render** — names the product, not a generic "render."
- **Removed the pill "intro" scene entirely** (wordmark + benefit chips). Noted to strip from the
  skill later — see memory `pill-intro-pattern`.
- **Chat history persists** in every chat scene; the prompt box is always present.
- **Real logo SVG** (`assets/hyperframes-dark.svg`) instead of a hand-built wordmark.
- **Payoff moved onto the cream ground** (same as the code/chat world), dark tiles on paper.

## Still open
1. **Logo dominance / HeyGen prominence** on S8 (the lockup already includes HeyGen) — size ok?
2. **The "conjure"/working beat** in S7 — keep it a 1-line ✳ status, or show more?
3. **Length** ~30s (added the Claude-checks + reading-worker beats; trim S5/S6 if you need ≤30).

**Next:** lock the contact sheet → build scene-by-scene through the skill.
