# HANDOFF — HeyGen ✚ Stripe · **V7** (the 39s, V12-faithful cut)

> Resume doc for a new chat. This captures the full state built across the prior session and the
> **next revisions** to make. Read this top-to-bottom, then skim the referenced skill + docs in §8.

---

## 0 · TL;DR
- **Active project:** `~/Documents/Codex/heygen-stripe-v7-39/` — a **~38.7s** HyperFrames film that mirrors
  the After-Effects final **"HeyGen x Stripe Version 12.mp4"**, rebuilt with the **new A-roll (JR_Final)**.
- **Latest render:** `renders/v7-39s-take6-4K.mp4` (3840×2160) · 1080p at `renders/v7-39s-take6.mp4`.
- **It is good** — the next chat is doing **final polish** (see §6 NEXT TASKS), not a rebuild.
- Dev loop + env in §7. Hard-won gotchas in §5 — **read those before editing**, they'll save you hours.
- There is a sibling **24s continuous-audio cut** in `~/Documents/Codex/heygen-stripe-vs2/`
  (`renders/vs2-v7-take5-24s-whiteend.mp4`) — see §3.

---

## 1 · The three projects (don't mix them up)
| Path | What | Touch? |
|------|------|--------|
| `~/Documents/Codex/heygen-stripe-v7-39/` | **V7 — the active 39s V12-faithful cut** | ✅ work here |
| `~/Documents/Codex/heygen-stripe-vs2/` | the **24s continuous-audio** cut (James talks throughout, no music gap) | ✅ secondary |
| `~/Documents/Codex/heygen-stripe/` | locked **v1** (old film) | ⛔ do not touch (read-only ok) |

**Reference assets (read-only):**
- **AE final / gold reference:** `~/Documents/Codex/HeyGen x Stripe Version 12.mp4` (38.7s, 30fps, has a **music bed**).
- **New A-roll (source for everything):** `~/Documents/Codex/HeyGen x Stripe Archive/(Footage)/zz_Assets/Footage/JR_Final_.mp4`
  (21.9s, **25fps**, James in beige quarter-zip on a wood-slat/couch set; clean VO, no music).
- **"Tenzin way" terminal reference** (a transition idea raised but NOT yet built): `~/Documents/Codex/hf-ollama-v7/renders/tenzin way/`
  + that project's `compositions/type-send.html` / `terminal.html`. (Text types/pastes onto the terminal while the
  card scales down and the terminal scales up so they "kiss." Still on the table if requested.)

---

## 2 · V7 current timeline (take6) — the master `index.html`
Root `data-duration="38.7"`. Narration = `assets/narration-v7.mp3` (two-block, §4). Captions overlay (V12-style
lower-third white) run on the VO blocks. z-index ordering low→high = open<lockup<commands<terminal<rotary<close<captions<endcard.

| Scene (comp) | data-start | dur | What | VO it covers |
|---|---|---|---|---|
| open-aroll | 0 | 5.4 | **James in the green window** (our treatment), swipe off ~4.95 | S1 "Video generation provisioned from the CLI" + S2 "It's never been easier to build a product" |
| lockup | 5.0 | 3.9 | "Introducing HeyGen + stripe" — slower-in, **slowly grows**, **speed-ramp explode** | S3a/b "With Stripe Projects and the HeyGen CLI, an agent can create its own account" |
| commands | 8.8 | 4.6 | **"Three commands"** + green orb; orb rests on the "s", **clicks on "video" (~12.85)**, swipes | S3c/d "get a capped budget… and create a finished launch video" |
| terminal | 13.3 | 13.7 | **3 step-cards interleaved w/ typed terminal**: card→term ×3, slow bar, big "rendering…done", morph→swipe up | (music-only middle — no VO) |
| rotary | 27.0 | 5.25 | "The agent **discovers / provisions / generates / pays**" — verbs **roll onto each spoken word** | S4 "The agent discovers, provisions, generates, and pays through Stripe projects" |
| close (aroll-rise) | 32.25 | 3.3 | **James window slides up** into final position by 32.7, delivers line, **last frame freezes** | S5 "Now agents can build with video autonomously" |
| endcard | 35.0 | 3.7 | **white screen** (crossfades in over the frozen avatar window = fade-to-white together). *User will add the logo.* | — |

**Seam rules (all verified clean):**
- open→lockup: window swipe reveals lockup (both dev bg).
- lockup→commands: **crossfade @ 8.5** (dev→sunburst colorway change; this one IS a crossfade).
- commands→terminal: continuous sunburst; terminal slides in after the orb click.
- terminal→rotary @ **27.0** and rotary→close @ **32.25**: **HARD CUTS on the media-aligned dev background**
  (no crossfade — see §5 "crossfade-dip"). Terminal fully morphs to dev + swipes by 27.0; rotary's text fades itself in.
- close→endcard @ **35.0**: white **crossfades over the frozen avatar** (the fade-to-white).

**The 3 step-card labels** (in `terminal.html`): Step 1 "Add agent from Stripe project" · Step 2 "Install the agent"
· Step 3 "Generate videos". Step pill + big bold dark headline on sunburst, slide in/out (V12 style).
Terminal prompt text = V12's `--prompt "HeyGen <> Stripe Product Launch"`.

---

## 3 · The 24s sibling cut (`heygen-stripe-vs2/`)
Same beats but **James's audio is continuous** (no music-only middle) → the film is ~24.7s. Uses
`assets/narration-v7c.mp3` (continuous full JR audio). Latest: `renders/vs2-v7-take5-24s-whiteend.mp4` (white endcard).
The **lockup-growth, close-slide-up, and freeze-frame** polish were applied to the 39s only — **port them here if/when
the user wants the 24s updated too.**

---

## 4 · Audio / narration (how it was built)
- **39s `narration-v7.mp3`** = the new A-roll VO **re-spaced into two blocks** to match V12's pacing:
  Block A (S1+S2+S3) at 0–13.3 · **silent middle 13.3–27** (music carries the terminal) · S4 at **27.0** · S5 at **32.7** ·
  padded to 38.7. Built with `ffmpeg` `atrim`+`adelay`+`amix`, **with `afade` edge-fades on each chunk** (kills the
  click/pop at "The agent discovers" — do NOT drop the fades).
- **24s `narration-v7c.mp3`** = JR's full continuous audio (`apad` to length).
- **VO word timings (block A = raw JR times):** S1 0.06–3.08 · S2 3.15–4.96 · S3a "With Stripe…CLI," 5.04–7.08 ·
  S3b "an agent…account," 7.13–8.74 · S3c "get a capped budget…over," 8.79–11.24 · S3d "and create a finished launch
  video." 11.29–13.30 (**"video" ≈ 12.8**). S4 raw 13.36–18.55 (→ placed at 27.0; discovers 27.55 / provisions 28.47 /
  generates 29.22 / pays 30.14). S5 raw 18.85–21.0 (→ placed at 32.7).
- ⚠ Whisper word-END times over-extend into pauses — use `ffmpeg silencedetect` for true onsets. Transcribe with
  `--model small.en` (English). The JR transcript is at `/tmp/v7/jr-transcript.json` if it survived; otherwise re-transcribe.

**A-roll segments (in `assets/`, cut from JR_Final — same source as the audio so lip-sync is exact):**
- `aroll-v7-open.mp4` = `JR[0:5.5]` (open window, S1+S2; James held through "build a product").
- `aroll-v7-close.mp4` = `JR[18.4:21.0]` **+ 0.7s frozen tail baked in** (`ffmpeg … tpad=stop_mode=clone:stop_duration=0.7`).
  The 0.45s pre-speech lead-in lets the window slide up *before* he says "Now"; placement keeps lip-sync exact.

**Backgrounds:**
- `bg-dev-loop.mp4` — moving dev plate (transcoded from the ProRes `greem BG.mov`; ProRes won't decode headless).
- `bg-stripe.png` — sunburst (animated with a slow GSAP scale/drift in commands + terminal).
- **Continuity rule:** every dev-bg video's `data-media-start` = its scene's film `data-start`, so the loop position maps
  to film time → adjacent dev scenes show the identical frame at a cut → **hard cuts are seamless**.

---

## 5 · Hard-won gotchas (READ BEFORE EDITING)
1. **Video = clean clip.** `<video muted playsinline id="…" data-start data-duration data-track-index>`. **No `id` → it
   renders FROZEN/black** (lint `media_missing_id`). Animate the **non-timed wrapper** (e.g. `.aroll`, `.bg-dev-wrap`),
   never the video element (the framework forces clip opacity:1).
2. **Freeze-frame:** HF does **NOT** hold a video's last frame just because `data-duration` > source — it ends/hides it
   (you'll get an empty window). **Bake the frozen tail into the file** with `tpad=stop_mode=clone`. (This is exactly how
   the close-window freeze-to-white works.)
3. **Crossfade-dip law:** crossfading two scenes (bg+text) **muddies/darkens** at the midpoint and reads as a flash. For
   same-ground scenes use a **HARD CUT on a media-aligned (continuous) background**; only the text swaps. Verify with
   per-frame luma: `ffmpeg -ss T -i out.mp4 -frames:v 1 -vf scale=48:27,format=gray -f rawvideo - | od -An -tu1 | awk …`.
4. **Audio pops** at concatenation boundaries → `afade` (~0.05s) in/out on each chunk.
5. **CSS `filter` flattens 3D** — never put `filter:blur()` on the rotary's preserve-3d cylinder (it collapses). Blur the
   flat layers only.
6. **Lip-sync** is exact when the on-camera segment and the narration come from the **same source file** and the segment's
   `data-start` aligns to its source in-point.
7. **4K render:** `--resolution landscape-4k` (3840×2160). Text/graphics render true-crisp; the 1080p A-roll + bg upscale
   (sharp, not native 4K).
8. **onUpdate is frozen on snapshots/seek** → verify motion, audio, lip-sync, video frames **only in a real render +
   ffmpeg frame-pulls**, never snapshots.
9. The HF **studio caches assets by filename** — change the filename to force-swap (CLI render reads fresh).

---

## 6 · NEXT TASKS (the user's revision list for the new chat)
Work in `~/Documents/Codex/heygen-stripe-v7-39/`. Reference V12 throughout.

1. **Add the 1-second intro mask reveal.** V12's **first ~1 second** is a **mask/window reveal** — the avatar window
   animates *into* the scene — and THEN the "Video generation…" VO begins. Our V7 currently opens with James already
   present (quick fade). → Study V12 0.0–1.0s, build a ~1s window mask-reveal entrance on `open-aroll`, and **push the
   narration + everything downstream by ~1s** (or absorb it so "Video generation" lands at ~1.0s). Net film likely → ~39.7s
   (the user said "39-second version," so ~1s pre-roll is expected). Re-verify all downstream sync after the shift.

2. **Tighten all scene timing to V12.** Do a **side-by-side** of `renders/v7-39s-take6.mp4` vs `Version 12.mp4` (build
   matching contact sheets at the same fps) and nudge each beat's start/length to line up with V12 more precisely.

3. **Orb (green triangle) on screen only ~1 second.** Right now the orb flies in early (~9s) and **rests on the "s" for
   ~2.8s** before clicking. The user wants it in the scene for **only ~1 second, at the "finished launch video" moment** —
   i.e., fly in ~11.8s, land, **click on "video" (~12.85)**, gone — total ~1s. Edit `commands.html`: delay the orb
   fly-in to ~local 3.0 (film ~11.8), quick land + click at local ~4.0 (12.85). Keep "Three commands" itself on screen the
   whole 8.8–13.3 window (only the orb is the 1s element).

(Also still open if asked: the **"Tenzin way"** terminal transition — §1. And porting the lockup/close/freeze polish to the
24s cut — §3.)

---

## 7 · Dev loop & env (this machine)
```bash
cd ~/Documents/Codex/heygen-stripe-v7-39
export BUN_INSTALL="$HOME/.bun"; export PATH="$BUN_INSTALL/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"
unset HYPERFRAME_RUNTIME_URL                                   # must be unset for render
npx hyperframes lint .                                         # 0 errors = good (font/overlap warns are benign)
npx hyperframes render . -o "$PWD/renders/v7-39s-takeN.mp4" --fps 30 --quality high          # 1080p verify
npx hyperframes render . -o "$PWD/renders/v7-39s-takeN-4K.mp4" --resolution landscape-4k --quality high --fps 30
ffmpeg -y -ss <t> -i out.mp4 -frames:v 1 frame.png            # pull frames (Read them to eyeball)
ffmpeg -y -i in.mp4 -vf "fps=1/1.6,scale=300:169,tile=6x4" -frames:v 1 sheet.png   # contact sheet (tile n ≈ n*1.6+0.8s)
```
- **TCC:** keep working assets under `~/Documents` (not Desktop / PDF folders). External vol `/Volumes/Saucex/…` is readable.
- Render time ≈ 1min (1080) / ~1m45 (4K) for 38.7s.
- Transcribe: `npx hyperframes transcribe <file> --model small.en`.
- `claude` CLI is installed at `~/.npm-global/bin/claude` but is **NOT logged in headless** (so `skill-creator`'s
  `run_loop.py` can't run; use subagents for trigger tests).

---

## 8 · Read these too
- **Skill:** `~/.claude/skills/hyperframes-launch-tier/SKILL.md` — the launch-tier craft layer + every technique/gotcha
  above, plus the full production pipeline. (Could be updated with the freeze-frame `tpad` trick + orb timing if you like.)
- `~/.claude/hyperframes-blocks/playbook/PRODUCTION-PLAYBOOK.md` + `FRAME-template.md`.
- `~/Documents/Codex/heygen-stripe-vs2/HF-CLAUDE-PAPER.md` (§7 render gotchas) and `HANDOFF-VS2.md` (earlier vs2 state).
- Project design system: `FRAME.md` (in each project root).

---

## 9 · Bootstrap line for the new chat
> Read `~/Documents/Codex/heygen-stripe-v7-39/HANDOFF-V7.md` first, then the `hyperframes-launch-tier` skill it points to.
> The active film is the 38.7s V7 cut in that folder (latest render `renders/v7-39s-take6-4K.mp4`), mirroring
> "HeyGen x Stripe Version 12.mp4" with the new JR_Final A-roll. We're doing final polish — see §6: (1) add V12's ~1s
> intro mask/window-reveal before the VO, (2) tighten all scene timing to V12, (3) make the green orb appear for only ~1s
> at the "finished launch video" click. Work the lint→render→ffmpeg-frame-pull loop; keep the §5 gotchas in mind.
