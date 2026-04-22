# Timeline Editor Launch Video — Storyboard

**Length:** 15–20s
**Concept:** Show the pain of nudging sound-effect timing via chat, then reveal the new Timeline Editor as the obvious fix.
**Tone:** Self-aware, playful. The "problem" act is slightly exaggerated; the "solution" act is clean and satisfying.

---

## Act 1 — The Late Sound Effect (0:00 – 0:04)

**On screen:** A Hyperframes composition playing full-bleed. Something visually primed to make a sound — options:
- A big cartoon "HONK" / bell / doorbell button with a subtle idle bob.
- A drum pad or an 8-bit SFX button with a tooltip "Press me".
- A mousetrap-style contraption where the cursor trips a lever.

A simulated cursor glides up from the bottom-right, hovers for a beat, and clicks the button.

**The gag:** The button visually reacts *on click* (depress, flash, shake, particle burst) — but the SFX doesn't fire. A beat of silence. Then ~0.25s late, the sound effect *finally* plays, well after the visual has settled. Maybe a tiny on-screen "💥" appears *also* late to sell the desync.

**Audio:**
- Ambient bed (soft room tone / light synth pad).
- SFX plays ~250ms after the click — long enough to feel wrong, short enough to feel like a timing bug and not a joke about absence.

**Purpose:** Establish that this is a Hyperframes video with audio, and plant "the timing is off" in the viewer's head without narration.

---

## Act 2 — The Chat Nudge Spiral (0:04 – 0:10)

### Beat 2a — First ask (0:04 – 0:06)
Cut / wipe to a Claude chat view (or Hyperframes chat panel) over the composition.
User types (animated, not instant):
> "Can you move the sound effect 0.1s earlier?"

Claude streams a short reply and then:
> "Done."

Cut back to the composition. Cursor clicks again. SFX is *still* late — maybe only marginally better. Maybe a small "🤏 closer" vibe.

### Beat 2b — Timelapse spiral (0:06 – 0:10)
Fast, stacked, almost jump-cut montage of ~5–7 follow-up prompts, each flashing for ~0.4–0.6s:
- "actually 0.05s earlier"
- "try 0.08"
- "too much, +0.02"
- "0.06?"
- "split the difference"
- "one more frame"

Each prompt is punctuated by a micro-clip of the button click + late SFX, tightening but never quite landing. Pace accelerates. Audio layers the prompt "tick" sound faster and faster — tension builds.

Hold on a final frustrated beat: the cursor sits still, the chat is full, the SFX is still *slightly* off.

**Purpose:** Make the pain visceral and funny. Everyone who has ever tuned timing in chat will recognize this.

---

## Act 3 — Timeline Editor Reveal (0:10 – 0:18)

**Transition:** Hard cut on a punchy whoosh. Chat dissolves. A clean title card or lower-third animates in:
> **Timeline Editor** — now in Hyperframes

Immediately resolve into a screen-studio capture of the *same* project, now open in the new Timeline Editor. The SFX clip is visible on an audio track. Cursor grabs the clip, drags it left, snaps into place. Playhead hits play — click and SFX fire **in perfect sync**. Satisfying.

**Final frame (0:17 – 0:20):**
End card with:
> Try it now in Hyperframes.
> hyperframes.heygen.com

Small Hyperframes wordmark. Ambient bed resolves.

**Purpose:** The relief beat. The product is the punchline.

---

## Scene Breakdown (for compositions/)

| # | Composition          | Duration | Notes |
|---|----------------------|----------|-------|
| 1 | `act1-late-sfx`      | ~4s      | Big button + cursor + late SFX |
| 2 | `act2a-first-ask`    | ~2s      | Chat prompt + "Done" + retry |
| 3 | `act2b-spiral`       | ~4s      | Rapid prompt montage, tightening |
| 4 | `act3-timeline`      | ~6s      | Screen-studio drag + playback |
| 5 | `act3-endcard`       | ~2s      | "Try it now" + URL |

Total: ~18s.

---

## Open questions before build

1. **Which button/object for Act 1?** Cartoon honk button is readable in 1s and ships the joke. Drum pad is more "creator tool" on-brand. Pick one before composing.
2. **Chat UI:** Claude chat exactly, or a stylized Hyperframes chat panel? Real Claude chat is more honest to the workflow; stylized is easier to animate cleanly.
3. **Act 3 footage:** Do we have a real Screen Studio capture of the Timeline Editor, or do we mock it in HTML? Real capture is more credible; HTML mock scrubs better with HF.
4. **End card CTA:** "Try it now" vs. "Available now" vs. just the URL. Pick one.
5. **Music bed:** One continuous bed across all three acts, or silence under Act 2 spiral to make the tick-tick of prompts the whole soundtrack?

---

## Next steps

- [ ] Pick the Act 1 object (honk button vs drum pad vs other).
- [ ] Decide real vs mocked Timeline Editor footage.
- [ ] Source / generate the SFX (one clean hit; will be reused across every retry).
- [ ] Scaffold project: `index.html`, `meta.json`, `compositions/{1..5}.html`.
- [ ] Build Act 1 first — if the late-SFX gag lands, the rest of the video is easy.
