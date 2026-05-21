# Hook Variants — Handoff Document

## Goal

Build multiple hook variants for the variables-launch A-roll video. Each variant is a **standalone 10-second composition** (first 10s of the ugc-ad.mp4 source) using a text-behind-subject effect for the first 3 seconds, with different hook text per variant.

Each variant lives in its own project folder. The end goal: render all of them to see which hook performs best.

---

## Source Video

```
/Users/jakemoran/Desktop/CC/projects/active/variables-launch/assets/ugc-ad.mp4
```

- Full duration: ~73s
- We only use the **first 10 seconds**
- Format: appears to be a UGC-style talking-head clip
- Resolution: likely 1080×1920 (vertical/portrait)

---

## New Project Location

Create a new project per the workspace rules:

```
/Users/jakemoran/Desktop/CC/projects/active/hook-variants/
```

Structure:
```
hook-variants/
├── assets/
│   ├── source-10s.mp4          # Trimmed first 10s of ugc-ad.mp4
│   ├── source-10s-subject.webm # Background-removed subject (transparent)
│   └── source-10s-bg.webm      # Background plate (optional, for tinting/effects)
├── compositions/
│   ├── hook-a.html             # "Stop scrolling..."
│   ├── hook-b.html             # "POV: you found it"
│   ├── hook-c.html             # "I used to think..."
│   └── ...                     # More variants as needed
├── index.html                  # Root composition (or one per hook)
└── renders/
```

---

## Step 1: Asset Prep

### Trim source to 10s

```bash
ffmpeg -i /Users/jakemoran/Desktop/CC/projects/active/variables-launch/assets/ugc-ad.mp4 \
  -t 10 -c copy \
  /Users/jakemoran/Desktop/CC/projects/active/hook-variants/assets/source-10s.mp4
```

### Remove background (HyperFrames CLI)

```bash
cd /Users/jakemoran/Desktop/CC/repos/hyperframes

# Subject layer (transparent VP9 WebM)
npx tsx packages/cli/src/cli.ts remove-background \
  /Users/jakemoran/Desktop/CC/projects/active/hook-variants/assets/source-10s.mp4 \
  -o /Users/jakemoran/Desktop/CC/projects/active/hook-variants/assets/source-10s-subject.webm

# Background plate (inverse alpha — subject region transparent)
npx tsx packages/cli/src/cli.ts remove-background \
  /Users/jakemoran/Desktop/CC/projects/active/hook-variants/assets/source-10s.mp4 \
  -o /Users/jakemoran/Desktop/CC/projects/active/hook-variants/assets/source-10s-subject.webm \
  --background-output /Users/jakemoran/Desktop/CC/projects/active/hook-variants/assets/source-10s-bg.webm
```

**Important:** The HyperFrames repo uses `bun`, not `pnpm`. Read `repos/hyperframes/CLAUDE.md` before doing any repo work.

---

## Step 2: Text-Behind-Subject Pattern

Reference implementation: `/Users/jakemoran/Desktop/CC/projects/active/veed-caption-style-v2/index.html`

The layering order (bottom to top):
1. **Background video** (z-index: 1) — original source or bg plate
2. **Behind-text layer** (z-index: 10) — large hook text positioned at face/torso level
3. **Subject video** (z-index: 20) — transparent WebM from remove-background
4. **Front-text layer** (z-index: 30) — optional smaller captions in front

Key CSS structure from the reference:
```css
#bg-video       { position: absolute; inset: 0; z-index: 1; object-fit: cover; }
.behind-caption { position: absolute; inset: 0; z-index: 10; pointer-events: none; }
#subject-video  { position: absolute; inset: 0; z-index: 20; object-fit: cover; }
.front-caption  { position: absolute; inset: 0; z-index: 30; pointer-events: none; }
```

The behind-text should be large, bold, positioned around the subject's head/torso area. Use GSAP for entry/exit animations. The text should feel impactful — scale pops, blur reveals, etc.

---

## Step 3: Hook Variants

Each variant uses the same 10s source clip but with different hook text displayed behind the subject for the first ~3 seconds. The hook text should be relevant to what the subject is saying/doing in the video.

**Hook options from the variables-launch video's Scene 4 code overlays:**
- "Stop scrolling..."
- "POV: you found it"
- "I used to think..."

**Additional hooks to create (choose text that matches the video's energy):**
- Pick 3-5 more hooks that would work for a UGC ad format
- Each hook should be 2-5 words max
- Bold, attention-grabbing, scroll-stopping language

---

## Step 4: Composition Structure

Each hook composition should be:
- **1080×1920** (vertical, 9:16)
- **10 seconds** duration
- First 3s: hook text appears behind subject with a punchy animation
- Remaining 7s: clean video playback (text exits)
- Use GSAP timelines with `window.__timelines["hook-X"] = tl` pattern
- Videos need `data-volume="0"` and `muted` attributes

### Font choices

The veed-caption-style-v2 project used:
- Inter (400) for body text
- Playfair (800) for editorial emphasis
- Instrument Serif (400) for elegant italic

For hook text behind subject, go big and bold — Inter 800 or a similar impact font at 120-200px.

---

## HyperFrames Composition Conventions

- Top-level timeline: `window.__timelines["composition-id"] = gsap.timeline({ paused: true })`
- Video elements: `<video data-start="0" data-duration="10" data-track-index="1" data-volume="0" src="..." muted playsinline>`
- Root div: `<div data-composition-id="hook-a" data-width="1080" data-height="1920" data-duration="10">`
- GSAP loaded via CDN: `https://cdn.jsdelivr.net/npm/gsap@3.14.2/dist/gsap.min.js`
- No `repeat: -1` in GSAP (HF lint bans infinite loops)
- Do NOT render automatically — only render when explicitly asked

---

## Reference Projects

| Project | Path | What to learn |
|---|---|---|
| veed-caption-style-v2 | `projects/active/veed-caption-style-v2/` | Text-behind-subject layering, caption animation patterns |
| captions-bg-removal-launch-v2 | `projects/active/captions-bg-removal-launch-v2/` | Full storyboard with bg removal, matte workflow, text-behind depth |
| variables-launch | `projects/active/variables-launch/` | Source video, hook text options from Scene 4, motion patterns used |

---

## Do NOT

- Render unless explicitly asked
- Run `pnpm install` anywhere (use `bun`)
- Put project files inside `repos/hyperframes/`
- Use `repeat: -1` in GSAP
- Create the project at the `CC/` root level
