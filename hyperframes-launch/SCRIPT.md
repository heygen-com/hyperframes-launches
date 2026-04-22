# HyperFrames Launch Video — Script v3

**Status:** Approved copy. Awaiting VO generation (Phase 2).
**Relationship to v2:** v2 is the recorded script in `assets/voiceover.mp3`. v3 supersedes it — contrast beat cut, cold open rewritten, flex section repositioned, anatomy copy updated (GSAP → JavaScript), engine copy revised, brand restyled to **HyperFrames** (camelCase).

---

## Spoken VO

Spoken lines only. No inline directions, no emphasis markdown, no author notes. This block is what feeds ElevenLabs verbatim.

```
Imagine you could make videos like this.

Your agent already can — just give it HyperFrames.

Open source. HTML in, video out.

CSS animations. G-Sap. Lottie. Shaders. Three.js.

A div is a keyframe. Data attributes are your timeline.
CSS is your look. JavaScript is your animation engine.

Anything a browser can render can be a frame in your video.

Drop in music, sound effects, footage — it all composes together.

Your agent writes code to compose. HyperFrames renders every frame to MP4.
It's deterministic, pixel-perfect, every time.

Give your agent the skill. Tell it what to make. Watch it build.

HyperFrames. Go make something.
```

---

## Silent visual beats (not spoken)

The VO leaves room for two silent gaps where the picture carries the moment. Not part of the ElevenLabs input — handled by Phase 3 timeline sequencing.

1. **After "Imagine you could make videos like this."** — ~3s silent beat. Super-tight motion-graphics montage (existing flex reel content smashed together as a teaser before the product is named).
2. **After "Open source. HTML in, video out."** — A-roll beat with composition overlay (creator on camera + lower third / captions / waveform). This is the Seedance insert from the original storyboard (Beat 6F in v2, Priority 3 in `HANDOFF.md`), now promoted earlier in the structure.

---

## Pronunciation cues for VO generation (Phase 2)

For ElevenLabs. Do not paste these cues into the script block above — they are a separate instruction set.

- **HyperFrames** — pronounced *hyper-frames*, not *hyper* then *frames* spelled out. The camelCase is a typographic choice, not a pronunciation cue. Expect ElevenLabs to handle it as a single compound word.
- **GSAP** — pronounced *G-Sap* (rhymes with *snap*). Already inlined as "G-Sap" in the spoken block above for TTS.
- **Three.js** — pronounced *three dot J-S*.
- **MP4** — pronounced *M-P-four*.

---

## Changes vs. Jake's draft (the copy dialed in this pass)

| From (draft) | To (v3) | Reason |
|---|---|---|
| "Imagine you could make videos like this" | "Imagine you could make videos like this." | Terminal period before the montage cut. |
| "Your Agent already can, just give it HyperFrames" | "Your agent already can — just give it HyperFrames." | Em-dash (per Jake). Lowercase "agent" for consistency. |
| "CSS animations (update). GSAP. Lottie. Shaders. Three.js." | "CSS animations. GSAP. Lottie. Shaders. Three.js." | "(update)" was an author note. Dropped. |
| "***Drop in music, sound effects***, footage — it all composes together." | "Drop in music, sound effects, footage — it all composes together." | Asterisks were markdown emphasis. Stripped. Emphasis goes into delivery. |
| "renders every frame into MP4" | "renders every frame to MP4" | *to* is more idiomatic than *into* for single-format output. |
| "pixel perfect" | "pixel-perfect" | Compound adjective, hyphenated. |

---

## Changes vs. v2 (the recorded VO)

| v2 beat | v2 VO | v3 status |
|---|---|---|
| 1 canvas-open | "Your AI agent already knows how to make videos." | **Replaced** — new cold open: "Imagine you could make videos like this." |
| 2 canvas-zoom | "It just needs the right format. This is Hyperframes." | **Folded** into "Your agent already can — just give it HyperFrames." |
| 3 proposition | "An open source framework. HTML in, video out." | **Simplified** — "Open source. HTML in, video out." |
| *(new)* | — | **A-roll + composition overlay beat** promoted from old Beat 6F. |
| 6A–6E flex | "CSS animations. GSAP. Lottie. Shaders. Three.js." | **Repositioned** — now plays before anatomy. Also feeds the opening montage. |
| 4 anatomy | "…CSS is your look. GSAP is your animation engine." | **Copy change** — GSAP → JavaScript. |
| 5 thesis | "Anything a browser can render can be a frame in your video." | **Preserved.** |
| 6F–6L compose | "Drop in music, sound effects, footage — it all composes together." | **Preserved.** |
| 7 contrast | "No new framework for the agent to learn…" | **CUT ENTIRELY.** ~6.4s freed. |
| 8 engine | "The agent writes it. The renderer captures every frame as MP4. It's deterministic. Identical outputs, every time." | **Revised** — "Your agent writes code to compose. HyperFrames renders every frame to MP4. It's deterministic, pixel-perfect, every time." |
| 9 cta | "Give your agent the CLI. Tell it what to make. Watch it build." | **Reverted** — CLI → skill. |
| 10 canvas-close | "Hyperframes. Go make something." | **Preserved with brand restyle** — "HyperFrames. Go make something." |

---

## Word count

Spoken v3: ~110 words. v2 was ~140 words. Expected spoken duration ~50–55s at Apple-keynote cadence. With the ~3s motion-montage gap and the A-roll gap added back in, total runtime lands roughly in the 58–62s range — same neighborhood as v2, but with a tighter cold open and no contrast beat.
