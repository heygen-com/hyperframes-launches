# STORYBOARD — website-to-hyperframes Launch Video

**Format:** 1920 × 1080 · ~61 seconds · 30fps · MP4 (Act 3 expanded in v2 for breathing room + logo-reveal trio)
**Music:** `audio/music-candidates/lightstockmusic-strong-character-powerful-fuzz-action-sport-rock-513742.mp3` (plays from 0:00 untouched through 0:50)
**Voice:** Rachel — 16 lines from [SCRIPT.md](SCRIPT.md)
**Build philosophy:** Every second earns a music event. Every beat self-ducks for voice. The visuals do the explaining — narration punctuates.

---

## Fonts (all local @font-face, no CDN at render)

| Role | File | Weights |
|---|---|---|
| Display | `fonts/BungeeShade-Regular.woff2` | 400 only |
| Sans | `fonts/Inter-Variable.woff2` | 100-900 variable |
| Mono | `fonts/JetBrainsMono-Variable.woff2` | 100-800 variable |

---

## Color palette

```
Void           #0A0A0A   — primary background
Void Soft      #15161A   — panel/card backgrounds
Paper          #F5F3EE   — Act 2 canvas
Ink            #0B0B0F   — primary text on Paper
Text Primary   #F7F8F8   — primary text on Void
Text Muted     #8A8F98   — captions, mono labels

Brand Cyan     #00C3FF   — HeyGen accent, primary brand moments
Stripe Violet  #533AFD   — Act 1 panel 1 accent
Framer Pink    #F44BCC   — Act 1 panel 2 / holo moments
Vibecode Green #3ECF8E   — Act 1 panel 3 accent

YEAHH Yellow   #FFD60A   — Bungee Shade fill
YEAHH Red      #FF006E   — Bungee Shade drop shadow
```

---

## Act 1 — COLD OPEN (0:00 – 0:15.00)

### Beat 1.0 — Silent Intro (0:00 – 0:01.66)

**Screen:** Near-black (`#0A0A0A`). Single mono caret blinking center-screen (2 Hz). Absolute silence except ambient room tone (-40 dB).

**Camera:** Locked.

---

### Beat 1.1 — Panel 1 Types "stripe.com" (0:01.66 – 0:04.16)

**Screen:**
- On first musical hit at 0:01.66, Panel 1 materializes with a subtle fade + soft scale (0.98 → 1.0 over 0.15s).
- Panel 1 UI: **Claude Code terminal** aesthetic. Black background `#0A0A0A`, thin border `#2A2C30`, top chrome shows `claude-code · ~/workspace` in 14px JetBrains Mono, muted. The center is a chat area with a single system message fading in: `> build something.` (faint, not the focus).
- Bottom of the panel: a text input bar. 1200px wide × 80px tall. Centered horizontally. Top of input at y=720px (within the 1080 frame).
- Inside input, the cursor types (JetBrains Mono 22px, `#F0F0F0`):
  ```
  make me a 30s promo for stripe.com. goes on X tomorrow
  ```
- Typing speed: ~20 chars/s. Each keystroke triggers a faint keyboard-typing SFX sample.
- Subtle Stripe-Violet (`#533AFD`) glow around the input as it fills.

**VO:** Rachel line 01 — *"Promo for your app?"* — ducked music at -20 dB.

**SFX:** `keyboard-typing.mp3` looping under the whole beat.

---

### Beat 1.2 — Whoosh cut → Panel 2 (framer.com) (0:04.16 – 0:06.66)

**At 0:04.16:** `whoosh-simple.mp3` fires. Panel 1 slides back and down 40px behind the stack (rotate -2°, scale 0.96). Panel 2 slides up from below the stack to occupy center, also scales 0.98 → 1.0.

**Panel 2 UI:** **Cursor IDE** aesthetic. Dark `#1E1F22`. Left sidebar showing file tree (dimmed, faint). Right 60% of the panel is an AI Chat column. Same input position + same font spec as Panel 1.

```
create a brand reel from framer.com. cinematic, dark, 25 seconds
```

**Accent:** Framer pink (`#F44BCC`) glow around input.

**VO:** Rachel line 02 — *"Brand video?"* — timed to land mid-typing.

---

### Beat 1.3 — Whoosh cut → Panel 3 (vibecode.app) (0:06.66 – 0:09.16)

Same whoosh. Panel 2 slides down+back. Panel 3 rises up.

**Panel 3 UI:** **Codex (ChatGPT)** aesthetic. Near-white background `#F7F7F8`, ink text. Title bar shows `New conversation — gpt-5.2`. Single centered chat column, input at same y=720 position. Text in JetBrains Mono 22px `#0B0B0F` (dark on light — inverse of others).

```
can you turn vibecode.app into a 20s insta ad?
```

**Accent:** Vibecode green (`#3ECF8E`) glow.

**VO:** Rachel line 03 — *"Social ad?"*

---

### Beat 1.4 — Whoosh cut → Panel 4 (heygen.com) (0:09.16 – 0:11.66)

Panel 3 slides down. Panel 4 rises.

**Panel 4 UI:** **Gemini CLI** aesthetic. Terminal on dark `#0F1014` with Google-blue accent `#4285F4`. Top chrome: `gemini-cli v1.3`. Same input position.

```
heygen.com → 35s launch video. show avatar v
```

**Accent:** Cyan (`#00C3FF`) glow.

**VO:** Rachel line 04 — *"Launch clip?"*

---

### Beat 1.5 — Stack Settles (0:11.66 – 0:12.00)

All 4 panels visible: the 4 stacked with slight rotations and depth offsets:
- Panel 4 on top, 0° rotation
- Panel 3 behind, -3° rotation, y+6px, x-4px
- Panel 2 behind, +4° rotation, y+12px, x+6px
- Panel 1 bottom, -2° rotation, y+18px, x-2px

Camera: subtle zoom in (+4%, scale 1.0 → 1.04) over 0.34s.

Each panel's Send/Enter button now visible and pulsing subtly.

**VO:** Rachel line 05 begins — *"Now —"* lands at 11.7s.

---

### Beat 1.6 — Charging (0:12.00 – 0:12.66)

**Visual:**
- Stack starts vibrating — rapid ±3px shake (45 Hz, 3-frame period).
- Bright halo swells around the stack — radial glow `rgba(0, 195, 255, 0.3)` blurs outward.
- Camera: zoom in another +4% (scale 1.04 → 1.08), compression.
- Ambient particles (8-10 small dots) converge toward the stack center.

**VO:** Rachel line 05 continues — *"...any site becomes video."* finishes at 13.5s.

**SFX:** `riser.mp3` last 0.66s begins fading in.

---

### Beat 1.7 — SHARP SPREAD (0:12.66 – 0:12.80)

**The single-frame punch.**

At exactly 0:12.66, all 4 panels fire simultaneously from the center toward their 2×2 grid positions:

- Panel 1 → top-left quadrant (center point 480, 270)
- Panel 2 → top-right (1440, 270)
- Panel 3 → bottom-left (480, 810)
- Panel 4 → bottom-right (1440, 810)

**Motion:** Each panel flies with easing = `power4.out` over 140ms, scaling from 1.0 to 0.48 (to fit the quadrant as 960×540). Trail: 80ms motion blur via box-shadow.

**Camera:** Quick zoom-out (scale 1.08 → 1.0) over same 140ms.

**SFX:** `whoosh-epic.mp3` fires at 0:12.66.

---

### Beat 1.8 — Slow-mo Settle (0:12.80 – 0:14.27)

**Music event at 0:12.80:** Track's bass drop lands exactly as panels are hitting their grid positions. The impact visually syncs.

**Motion:**
- Panels decelerate with spring physics (overshoot their target by 4%, bounce back to lock over 0.9s).
- Subtle desaturation (-15% saturation at 0:13.0, returns to 100% at 0:14.0) — the "slow-mo" feel.
- Subtle DoF: grid starts slightly blurred (blur 4px), blur pulls back to 0 over the settle.
- Each quadrant's accent glow (violet, pink, green, cyan) settles into its corner.

---

### Beat 1.9 — YEAHH (0:14.27 – 0:14.66)

**At 0:14.27** — track's "Yeah" vocal tag lands.

**Visual:**
- Giant "YEAHH" text appears overlaid in the dead-center of the grid.
- Font: Bungee Shade, ~240px.
- Fill: YEAHH Yellow (`#FFD60A`). Stroke: 4px `#0B0B0F`. Drop shadow: 3px offset, YEAHH Red (`#FF006E`).
- Slight rotation: -3° (tilted comic-book feel).
- Entrance: scale 0 → 1.15 → 1.0 bounce over 0.2s.
- Decorations: 4 comic-burst stars (simple SVG pointy stars, `#FF006E` fill) scattered around the text at ~±120px offsets, scale 0 → 1 with 0.05s stagger.
- Subtle jitter on YEAHH text throughout its visible window (±1px, fast).

---

### Beat 1.10 — YEAHH Exits + Cursors Migrate to Send (0:14.66 – 0:14.80)

**Visual:**
- YEAHH scales down 1.0 → 0.3 over 0.14s and fades.
- In each of the 4 panels, the cursor animates from its last-typed position to the panel's Send button (100px arc motion, power2.out).
- Send buttons start pulsing with their respective accent colors (scale 1.0 ↔ 1.05 at 4 Hz).

---

### Beat 1.11 — ALL 4 PRESS (0:14.80 – 0:14.99)

**At 0:14.80:**
- All 4 Send buttons depress simultaneously: scale 1.0 → 0.95 over 100ms (press-in), hold until 0:14.90.
- 4 bright pulses emanate from each Send button (radial ripple, accent color, 50px → 400px radius over 200ms, opacity 0.8 → 0).

**At 0:14.85:** `enter-key.mp3` (trimmed single press) peaks. Cursor-click SFX also layered faintly.

**0:14.90 – 0:14.99:** 90ms held-press state — the "world holds its breath."

---

### Beat 1.12 — WHITE FLASH + MUSIC DROP (0:15.00)

At exactly 0:15.00 — track's main drop hits.

- Full-frame white flash (`#FFFFFF`), 80ms duration.
- Music drops to full volume.
- **Cut to Act 2 during the flash.**

---

## Act 2 — EXTRACTION (0:15.00 – 0:30.00)

### Beat 2.0 — Emerge from Flash (0:15.00 – 0:15.40)

White flash clears. The heygen.com full-page screenshot appears, wrapped in a MacBook Pro frame centered on a warm Paper (`#F5F3EE`) canvas (echoes Thursday's launch aesthetic).

Full-page image: `launch-video-2/assets/heygen-fullpage.png` (1920 × 20056 px).
Shown scaled so the hero section fills the laptop screen. Laptop chrome visible: aluminum (`#B5B5B5`) bezel, power indicator dot.

---

### Beat 2.1 — Page Scroll-Pan (0:15.40 – 0:17.50)

**Motion:** The website image scrolls inside the laptop frame — camera "reads" down the page.
- y translate from 0 to -8000px over 2.1s, `power2.inOut` ease.
- Page sections fly past: hero (cube + headline) → metrics row → enterprise logos → Photo to Video feature → Product Placement → more features.

**Overlay:** A monospace label in the top-left corner: `heygen.com · scanning` (JetBrains Mono 24px, `#8A8F98`).

---

### Beat 2.2 — Zoom to Hero + First Extraction: Fonts (0:17.50 – 18.80)

**Motion:** Page jumps back to the top with a whoosh (`whoosh-cinematic.mp3`). Camera zooms INTO the "Turn your ideas into **videos in minutes**" headline. Scale up 2.5x over 0.5s.

**Extraction moment:**
- The headline text gets a glowing cyan outline (`#00C3FF`, 2px, animates around the text bounds).
- A mono label appears above: `TT Norms Pro · 700 weight`.
- The text CLONES itself and the clone LIFTS OUT of the page (y -300px, scale 0.4), flying to a "collection tray" at the right edge of the screen (x=1700, y=400).
- In the tray, a label appears: `fonts/` with the font name.

**SFX:** `ping.mp3` on extraction moment.

---

### Beat 2.3 — Second Extraction: Colors (0:18.80 – 20.10)

**Motion:** Camera pans slightly right to reveal the cyan CTA button.

**Extraction:**
- CTA button gets outlined.
- Label appears: `#00C3FF · HeyGen Cyan`.
- Three color swatches pluck out of the page: `#00C3FF` (cyan), `#171717` (near-black ink), `#DFF8FF` (cyan wash).
- They fly to the collection tray below the fonts entry, forming a colors row: `colors/` + 3 swatches.

**SFX:** 3 `ping.mp3` samples at 0:19.0, 0:19.3, 0:19.6.

---

### Beat 2.4 — Third Extraction: Assets (0:20.10 – 22.20)

**Motion:** Camera pans right and down to reveal the 3D rotating cube.

**Extraction:**
- Cube gets outlined.
- Label: `3D asset · hero-cube.glb`.
- Cube image pulls out to collection tray. `assets/` row.

**Then:** camera pans further down to the metrics row. Each number ("122,791,353 / 96,859,261 / 16,896,486") gets individually outlined in sequence.
- Label: `stats · metrics/`
- Extracts as a single grouped element to the tray.

---

### Beat 2.5 — Libraries Detected (0:22.20 – 23.50)

**Visual:** Camera zooms out to see the full laptop frame. A new panel fades in across the bottom:

```
DETECTED LIBRARIES
[ Next.js · Tailwind CSS · WebGL ]
```

(Mono, `#00C3FF`, `#F7F8F8`)

---

### Beat 2.6 — Transition to Build Mode (0:23.50 – 25.00)

**Motion:** Everything on screen — laptop frame + page + tray + detected libraries — slides left off-screen over 1.5s.

**Replaced by:** A code editor UI appearing from the right. Dark `#15161A`. Syntax-highlighted HTML being written, character-by-character.

```html
<div data-composition-id="hero" data-duration="3.2">
  <canvas class="shader-bg"></canvas>
  <h1 class="kinetic">Turn ideas into videos</h1>
  <button class="cta">Get Started</button>
</div>
```

Written at 40 chars/sec — fast, fluent. Syntax colors: tags `#00C3FF`, strings `#3ECF8E`, keywords `#F44BCC`.

**Overlay label (top-right):** `composing · 6 beats`.

---

### Beat 2.7 — Preview Appears (0:25.00 – 27.50)

**Motion:** The code editor slides left to take 45% of the screen. A preview window materializes on the right 55%. Inside the preview: a miniature version of a composition playing — an animated HeyGen-style hero (simplified: cyan glow, headline text appearing word by word, CTA scaling in).

**Overlay:** `preview · playing`.

---

### Beat 2.8 — Render Progress (0:27.50 – 29.20)

**Motion:** Below the preview, a progress bar fills: `rendering · 78 / 90 frames`.

The bar fills rapidly (1.0s), reaching 100%. An MP4 file icon appears with the checkmark: `heygen-launch.mp4 · 3.2MB`.

---

### Beat 2.9 — Transition to Act 3 (0:29.20 – 30.00)

**Motion:** The MP4 icon scales up +20% then BURSTS — breaks into a grid of small thumbnails flying outward toward the viewer. Camera pulls in.

Whoosh cinematic layered. The burst resolves into the first clip of Act 3 at 0:30.00.

---

## Act 3 — CAPABILITY REEL v2 (0:30.00 – 0:53.50 · 23.5s)

11 clips, variable pacing (0.8s–3.5s), body-level siblings pattern (not nested sub-compositions). Branded pill caption bottom-left per clip. VO per clip, trailer cadence. This is a reshoot from v1: full-breath clips, vercel world map swapped in, shader+figma removed, logo-reveal trio added.

**Beat order + timing (relative to Act 3 start):**

| # | Beat | Clip file | Start | Dur | VO line |
|---|---|---|---|---|---|
| 1 | stripe opener (silk ribbon + "The") | `a3-01-stripe.mp4` | 0.00 | 1.5s | 06 Product launches |
| 2 | tailwindcss 6-scene rapid-fire | `a3-02-tailwindcss.mp4` | 1.50 | 3.5s | 07 Feature showcases |
| 3 | framer holo-gradient full | `a3-03-framer.mp4` | 5.00 | 3.0s | 08 Brand reels |
| 4 | spotify MUSIC FOR (12.5-14.5s source) | `a3-04-spotify.mp4` | 8.00 | 2.0s | 17 Music apps |
| 5 | heygen 3D cube (full 2s) | `a3-05-heygen.mp4` | 10.00 | 2.0s | 11 Three D scenes |
| 6 | vercel Edge Network world map (11.1-13.1s source) | `a3-06-vercel.mp4` | 12.00 | 2.0s | 20 Infrastructure |
| 7 | vibecode iPhone + floating cards | `a3-07-vibecode.mp4` | 14.00 | 2.0s | 10 Product demos |
| 8 | linear logo reveal | `a3-08-linear.mp4` | 16.00 | 2.0s | 21 Brand openers |
| 9 | dribbble logo SVG draw | `a3-09-dribbble.mp4` | 18.00 | 3.0s | 22 Logo reveals |
| 10 | tailwindcss logo SVG draw (0.9-2.6s of 04b) | `a3-10-tailwindcss-logo.mp4` | 21.00 | 1.7s | 23 Drawn in S V G |
| 11 | custom-B variable-font ripple | `a3-11-typography.mp4` | 22.70 | 0.8s | 13 Typography |

**Total:** 23.5s (11 clips).

**Structure pattern:** all 11 videos + 11 captions + 11 VO audios placed as body-level siblings in the master `index.html`, with data-start offsets into the master timeline (30.00 + beat_start). Do NOT put video elements inside the composition root div — hyperframes requires `<video data-start>` to be a body-level sibling of the stage div.

**Caption style:** JetBrains Mono 28px, white, on `rgba(0,0,0,0.55)` pill with cyan `#00C3FF` dot prefix, bottom-left 48px margin.

**Dropped from v1:** custom-A shader (too abstract for the montage), figma brand reel (the 3D-card scene picked was weak; figma can feature in a future X post).

### Beat 3.1 — stripe.com (0:30.00 – 0:31.50 · 1.5s)

**Clip:** `source-clips/02-stripe_00.0-02.0.mp4` — the full 1.5s (trim last 0.5s if needed).

**Overlay:**
- Bottom-left caption: `stripe.com` in JetBrains Mono 28px `#F7F8F8` with faint background pill.

**AUDIO-REACTIVE ENHANCEMENT:** The stripe logo/headline text has subtle bass-reactive scale — when the music's kick drum hits, scale pulses 1.0 → 1.04. Implemented via:
```js
// Sample audio frame data from audio-data.json for 30.0-31.5s
// On each frame, read bass band [0], apply to .logo-text
for (var f = 0; f < frameCount; f++) {
  tl.call(function(bass) {
    return function() { gsap.set(".stripe-logo", { scale: 1 + bass * 0.04 }); };
  }(frames[f].bands[0]), [], f / 30);
}
```

**VO:** Rachel line 06 — *"Product launches."* — lands at 0:30.3-0:31.2.

---

### Beat 3.2 — tailwindcss 6-scene rapid-fire (0:31.50 – 0:35.00 · 3.5s)

**Clip:** `source-clips/03b-tailwindcss_00.0-03.5.mp4` (the re-cut showing all 6 feature scenes — responsive / gradient / dark mode / grid / 3D / silky animations).

**Overlay:**
- Bottom-left caption: `tailwindcss.com`
- NO per-scene labels — the clip speaks for itself with its existing `class="..."` overlays.

**VO:** Rachel line 07 — *"Feature showcases."* — lands at 0:31.8-0:32.9 (early in the slot).

---

### Beat 3.3 — framer.com (0:35.00 – 0:36.50 · 1.5s)

**Clip:** `source-clips/05-framer_26.0-29.0.mp4` — trim to 1.5s peak section.

**Overlay:** Caption `framer.com`.

**VO:** Rachel line 08 — *"Brand reels."*

---

### Beat 3.4 — Custom Clip A: Shader Bloom (0:36.50 – 0:37.50 · 1.0s)

**Clip:** `custom-clips/clip-a-shader-bloom.html` — 1.0s slice from its 2.5s timeline (use mid-section, the holo/supabase transition).

**Overlay:** Caption `shader · custom` in italic-ish mono.

**VO:** Rachel line 09 — *"Custom shaders."*

---

### Beat 3.5 — vibecode.app (0:37.50 – 0:39.00 · 1.5s)

**Clip:** `source-clips/10-vibecode_13.0-16.0.mp4` — trim to 1.5s.

**Overlay:** Caption `vibecode.app`.

**VO:** Rachel line 10 — *"Product demos."*

---

### Beat 3.6 — heygen.com 3D cube (0:39.00 – 0:40.50 · 1.5s)

**Clip:** `source-clips/09-heygen_00.5-02.5.mp4` — trim to 1.5s.

**Overlay:** Caption `heygen.com`.

**VO:** Rachel line 11 — *"Three-D scenes."*

---

### Beat 3.7 — dribbble.com (0:40.50 – 0:41.50 · 1.0s)

**Clip:** `source-clips/13-dribbble_07.0-10.0.mp4` — trim to 1.0s of the gallery moment.

**Overlay:** Caption `dribbble.com`.

**VO:** Rachel line 12 — *"Portfolios."*

---

### Beat 3.8 — Custom Clip B: Variable Font (0:41.50 – 0:42.00 · 0.5s)

**Clip:** `custom-clips/clip-b-variable-font.html` — 0.5s slice, the peak of the weight ripple.

**Overlay:** Caption `kinetic type · custom`.

**VO:** Rachel line 13 — *"Kinetic typography."* (fast, overlaps the cut)

---

## Act 4 — CTA + END CARD (0:53.50 – 0:61.50)

(Shifted later due to Act 3 v2 expansion from 11.2s to 23.5s. Same internal structure + VO.)

### Beat 4.1 — Transition + Canvas Reveal (0:42.00 – 0:43.00)

**Motion:** All 8 Act 3 clips slide back into a 4×2 grid, arranged neatly. Camera pulls BACK — the grid shrinks to center-screen size.

**Background:** Transitions from Void to Paper (`#F5F3EE`). Grid cards get warm shadow.

---

### Beat 4.2 — HyperFrames Wordmark (0:43.00 – 0:44.00)

**Visual:** Above the grid of clips, the word **HyperFrames** appears in Inter Variable at 180px, weight 900, ink `#0B0B0F`.

**Motion:** Fade in + subtle scale 0.96 → 1.0 over 0.4s. Subtle letter-spacing animation (-0.04em → -0.02em) giving it presence.

**VO:** Rachel line 14 — *"HyperFrames."* — timed at 0:43.2.

---

### Beat 4.3 — The Promise (0:44.00 – 0:47.00)

**Visual:** Below the wordmark, two-line subtitle appears:

```
Give your agent a URL.
It does the rest.
```

Inter Variable, 64px, weight 500, `#2A2B2F`.

Each line fades in with a ~1.0s stagger.

**VO:** Rachel line 15 — *"Give your agent a URL."* (at 0:44.0) + *"It does the rest."* (at 0:45.8).

---

### Beat 4.4 — Install Command (0:47.00 – 0:48.50)

**Visual:** Small mono command appears centered below the subtitle:

```
npx skills add heygen-com/hyperframes
```

JetBrains Mono 32px, `#2A2B2F`. Each character types in (20 chars/s).

A tiny blinking cursor remains at the end after typing completes — inviting the viewer to use their own terminal.

---

### Beat 4.5 — Sign-off (0:48.50 – 0:50.00)

**Visual:** The command holds. Nothing else moves.

**VO:** Rachel line 16 — *"Go make something."* — lands at 0:48.7.

**At 0:49.7:** Subtle outro — the grid of clips gently breathes (scale 1.0 → 1.02 → 1.0 over 1s), wordmark gets a subtle glow.

**At 0:50.00:** Hard cut to black. Music fades last note.

---

## Audio Timeline Summary

```
TRACK  MUSIC                                                                50.0s
       ╱╲╱╲╱╲╱╲╱╲╱╲═══════════════════════════════════════════════════════════════
TRACK  VO (Rachel)                                                                
       ·L1·L2·L3·L4─L5─── ······································ ─L6·L7······L14──L15──L16
TRACK  SFX                                                                        
       ·kb·kb·kb·kb·kb───·RZ·ek·bd· ·pn·pn··pn···whoosh──── ···whooshes···· ·fade
TRACK  MUSIC DUCKING                                                              
       ───-20dB────-15dB──0dB────────────────────────── -10dB───── -14dB──── fade
```

Legend: `kb` = keyboard-typing · `RZ` = riser · `ek` = enter-key · `bd` = bass-drop · `pn` = ping

---

## Files Index

```
launch-video-2/
├── SCRIPT.md
├── STORYBOARD.md                          ← this file
├── fonts/                                 ← Bungee Shade, Inter, JetBrains Mono
├── assets/
│   └── heygen-fullpage.png                ← 1920 × 20056 fullpage screenshot
├── audio/
│   ├── music-candidates/                  ← 513742 + 3 backups
│   ├── sfx/                               ← 10 .mp3 files (+ trimmed single-press variants TBD)
│   └── vo/                                ← 16 Rachel VO .mp3 files (generated next)
├── source-clips/                          ← 14 brand clips + 2 re-cuts + thumbnails
├── custom-clips/                          ← Clip A shader, Clip B font, Clip C recursive
└── commissioned/                          ← (vercel/spotify/figma if fresh sessions deliver)
```

---

## Build Order

Once VO is generated:

1. **Act 4 (end card)** — simplest, good warmup. Establishes the typographic system in production.
2. **Act 3 (capability reel)** — fast-cut montage built by stitching existing clips into a composition with caption overlays + VO timing + bass-reactive enhancement on stripe.
3. **Act 1 (cold open)** — the most complex beat. 4 IDE panels + stack + spread + YEAHH + clicks + flash.
4. **Act 2 (extraction)** — the heygen.com fullpage animation with extraction overlays.
5. **Master index.html** — stitches all 4 sub-compositions into the 50s timeline, audio tracks layered.
6. **Snapshot + iterate** — review per-beat frames, fix what looks off.
7. **Render** — `hyperframes render --output renders/website-to-hyperframes-launch.mp4`.

Estimated build time: 4-6 hours focused work.
