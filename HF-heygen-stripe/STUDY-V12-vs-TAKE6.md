# STUDY — AE "Version 12" vs HF render `take6` (frame-accurate)

Method: both files are **38.7s / 30fps / 1920×1080 / 1161 frames** → frame-comparable.
Measured with ffmpeg scene-detect, 0.5s & 0.2s contact sheets, per-frame luma (`signalstats`),
and full-res frame pulls. Working images in `/tmp/v12study/`.

---

## 1 · V12 master timeline (the gold reference — measured)

| # | Scene | V12 start | V12 end | dur | On-screen content | Caption (lower-third, white, centered) |
|---|---|---|---|---|---|---|
| 1 | **Open avatar** | 0.00 | **4.73** | 4.73 | James in green-bordered window. **Window scale/mask-reveal over ~0.0–0.35s** (tiny→full), VO starts immediately (~0.06). Swipe-off at 4.73. | "Video generation provisioned from the CLI" → "It's never been easier to build a product" |
| 2 | **Lockup** | 4.73 | **8.90** | 4.17 | "HeyGen ✚ stripe" lockup on dev bg | (VO continues: "With Stripe Projects and the HeyGen CLI, an agent can create its own account") |
| 3 | **"Three commands"** | 8.90 | **~12.0** | **~3.1** | Big black "Three commands" on sunburst. **Green cursor 11.1→12.0.** | "get a capped budget, and create a finished launch video." |
| 4 | **Terminal (3 step-cards + typing)** | ~12.0 | **27.0** | **~15.0** | Sunburst. Step pills + bold headlines interleaved with white terminal cards. No VO (music bed). | — |
| 5 | **Rotary "The agent…"** | 27.00 | **32.70** | 5.70 | Dark bg, green light-streaks. "The agent **[green rolling verb]**" cylinder. | "The agent discovers" → "provisions, generates, and pays" |
| 6 | **Close avatar** | 32.70 | **~35.3** | ~2.6 | James green window (full frame). | "Now agents can build with video autonomously!" |
| 7 | **Endcard / logo** | ~35.4 | 38.70 | ~3.3 | Fade to **white**; **3D iridescent gem/cube logo builds 35.5→37.4**, resolves to **"HeyGen" wordmark 37.5→38.5**, black at 38.7. | — |

**Green cursor (the "green triangle"):** it is a **green teardrop/arrow cursor with a white click-dot** — NOT a round orb.
Appears ~**11.1**, settles on the end of "command**s**", **click ripple ~11.7–11.8**, gone by **~12.0**. **Total ≈ 0.9s**, landing exactly on "…finished launch **video**."

**V12 step-card labels (exact):**
- Step 1 — **"Add HeyGen from Stripe project"** (~12.0)
- Step 2 — **"Install the HeyGen CLI"** (~18.0)
- Step 3 — **"Generate videos"** (~22.5)

**Terminal→rotary is a HARD CUT at 27.0** (luma 191→62→20). No black gap before it — sunburst stays bright to 26.5.

---

## 2 · take6 timeline (current) and the deltas

| Scene | take6 start / dur | V12 equivalent | Delta — what's wrong |
|---|---|---|---|
| Open avatar | 0 / 5.4 (swipe ~4.95) | 0 → 4.73 | **~0.3–0.7s too long**; **no scale/mask reveal** (take6 = quick fade) |
| Lockup | 5.0 / 3.9 | 4.73 → 8.90 | starts ~0.3s late; crossfade@8.5–8.8 ≈ V12 8.90 ✅ close |
| **"Three commands"** | 8.8 / **4.6** (ends 13.3) | 8.90 → **~12.0** (3.1s) | **~1.3s TOO LONG** — biggest error. Pushes terminal late. |
| **Terminal** | **13.3** / 13.7 (ends 27.0) | **~12.0** → 27.0 (15.0s) | starts 1.3s late ⇒ **compressed ~1.3s**; step cards rushed vs V12 |
| **Green element** | orb flies in ~9.0, **rests ~2.8s**, clicks ~12.85 | cursor 11.1→12.0 (~0.9s) | **wrong shape (round orb vs teardrop cursor), ~4s vs ~0.9s, wrong moment** |
| Rotary | 27.0 / 5.25 (close@32.25) | 27.0 → 32.70 | rotary ends ~0.45s early |
| Close avatar | 32.25 / 3.3 | 32.70 → ~35.3 | starts ~0.45s early |
| **Endcard** | 35.0 / 3.7 **plain white** | ~35.4 white **+ logo build + wordmark** | **missing the 3D gem logo + "HeyGen" wordmark** |
| Step labels | "Add agent…" / "Install the agent" / "Generate videos" | "Add HeyGen from Stripe project" / "Install the HeyGen CLI" / "Generate videos" | **Step 1 & 2 wording wrong** |

---

## 3 · Prioritized fix list (what to change in the source)

**P1 — timing (highest impact):**
1. **End "Three commands" at ~12.0**, start **terminal at ~12.0** (give it the full ~15s). `commands.html` dur 8.8→~3.2; `terminal.html` data-start 13.3→~12.0, dur 13.7→~15.0.
2. **Green cursor: ~0.9s only.** fly-in local ~11.1, click ~11.8, gone ~12.0. Change **shape from round orb → green teardrop cursor + white click-dot** to match V12.

**P2 — fidelity:**
3. **Step-card wording:** Step 1 → "Add HeyGen from Stripe project", Step 2 → "Install the HeyGen CLI".
4. **Open avatar:** trim to ~4.73 swipe; add a quick **~0.35s window scale/mask-reveal** at t=0 (VO stays at 0.06 — do NOT shift narration a full second).
5. **Endcard:** set fade-to-white at ~35.3, leave the 35.5–38.5 window for the **3D gem logo + "HeyGen" wordmark** (user adding logo asset — reserve the timing).

**P3 — micro:**
6. Close avatar start 32.25 → **32.70**; rotary fills to 32.70.

---

## 4 · A-roll script + captions (verified on screen)

| Beat | VO line | Caption shown |
|---|---|---|
| S1 | "Video generation provisioned from the CLI" | same |
| S2 | "It's never been easier to build a product" | same |
| S3 | "With Stripe Projects and the HeyGen CLI, an agent can create its own account, get a capped budget, and create a finished launch video." | "get a capped budget, and create a finished launch video." (on commands) |
| (mid) | — (music only over terminal) | — |
| S4 | "The agent discovers, provisions, generates, and pays through Stripe projects" | "The agent discovers" → "provisions, generates, and pays" |
| S5 | "Now agents can build with video autonomously!" | same |
