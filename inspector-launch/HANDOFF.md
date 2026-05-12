# HyperFrames Inspector Launch Contact Sheet - Handoff

Status as of 2026-05-11 late evening. This project is a HyperFrames launch/storyboard pass for the **HyperFrames Inspector**. Jake is actively directing the messaging and motion language, so treat the current implementation as a working draft, not a locked cut.

## Where This Lives

- Project root: `/Users/jakemoran/Desktop/CC/projects/active/hyperframes-inspector-launch-contact-sheet`
- Main HyperFrames composition: `index.html`
- Original static contact sheet / design exploration: `contact-sheet.html`
- Visual identity notes: `DESIGN.md`
- Story / beat notes: `STORYBOARD.md`
- Current preview URL: `http://localhost:5190/#project/hyperframes-inspector-launch-contact-sheet`

The Studio server was started directly from:

```bash
cd /Users/jakemoran/Desktop/CC/repos/hyperframes-inspector-alpha/packages/studio
PATH=/Users/jakemoran/.bun/bin:$PATH VITE_STUDIO_ENABLE_MOTION_PANEL=true VITE_STUDIO_ENABLE_PREVIEW_MANUAL_DRAGGING=true /Users/jakemoran/.bun/bin/bun run dev --host 127.0.0.1 --port 5190
```

The project is symlinked into:

```text
/Users/jakemoran/Desktop/CC/repos/hyperframes-inspector-alpha/packages/studio/data/projects/hyperframes-inspector-launch-contact-sheet
```

## Motion References

Use these before making motion changes:

- Depth motion / cut-the-curve skill: `/Users/jakemoran/Desktop/CC/projects/_skills/low-level/depth-motion/SKILL-depth-motion.md`
- Notion walkthrough motion reference: `/Users/jakemoran/.codex/skills/notion-hyperframes-walkthrough/references/motion-and-transitions.md`
- Timeline Editor Launch V5 reference for prompt-firehose pacing: `/Users/jakemoran/Desktop/CC/projects/active/timeline-editor-launch-v5`

Core rules Jake wants honored:

- Cut-the-curve for scene-to-scene moves: outgoing scene accelerates, blur peaks, incoming scene continues the same direction and decelerates.
- Zoom-through for title/text emphasis beats.
- Every scene needs a motion thesis, not just an entrance.
- First visible motion should happen within `0.2s`.
- The global halftone should lead transitions by about `0.1s`.
- The halftone background should always be alive, not only moving during transitions.

## Current Implementation State

`index.html` currently has:

- A global halftone canvas behind every scene.
- The halftone canvas was changed to an oversized plate (`4320x3300` CSS size, painted from a larger canvas) so large background shifts do not reveal blank frame edges.
- Scene content is wrapped dynamically in `.stage` wrappers for cut-the-curve stage motion.
- 14 current scenes:
  1. Creating video should be easy.
  2. AI gets you moving.
  3. Close isn't final.
  4. Claude-style prompt.
  5. Prompt firehose.
  6. Move this left 20px.
  7. Slow the curve by 20%.
  8. Change caption to "Ship it."
  9. Screen Studio placeholder.
  10. Edit the video directly.
  11. Inspector map.
  12. Change what you SEE.
  13. Prompt less. Shape more.
  14. HyperFrames Inspector placeholder lockup.
- Runtime was verified after the last pass: timeline registers as `inspector-launch-v1`, lint has 0 errors and only structure warnings.

## Current Problems / Jake's Latest Notes

### Global Background

The background must be visible for the full frame at all times and must feel alive throughout the video.

Current fix: it is oversized enough to cover the frame during large moves.

Still needed:

- Make it feel more shader-like: a subtle gradient/color wave should pass across the dot field continuously.
- It should breathe at all times, not only during scene transitions.
- Scene transitions should still include larger background shifts about `0.1s` before foreground motion.
- The background changes are global; solve this once and keep it consistent across every scene.

### New Intro Scene Before Current Scene 1

Add a scene before everything currently in the timeline.

Concept:

- Dark version recreation of the Claude prompt box floating on the halftone background.
- Prompt text types in with a typewriter effect.
- Text should be:

```text
we created HyperFrames because we believe
```

Jake also referred to the shorter framing "we made HyperFrames"; use the longer line above unless he changes it.

Transition:

- After the typed prompt, use a **leftward cut-the-curve** into the current opening thesis.
- Current Scene 1 should become the next beat and should have word-by-word entry:

```text
Creating video should be easy.
```

- "Creating" slides in, "video" follows, "should be easy" follows sequentially.
- Adjust the typography so the whole sentence stays on one line, including `easy`.

### Scene 4 to Scene 5

Jake still does not feel the Scene 4 -> Scene 5 handoff is seamless enough.

Intent:

- Scene 5 should feel like the same Claude modal continuing, not a new modal or a new layout.
- The prompt firehose needs to clearly originate from the prompt box/composer.
- It should borrow the feeling of Timeline Editor Launch V5: a rapid blurred prompt session, "done, done, done, done" energy, around 30 fast prompts.
- The prompt burst should feel like repeated tiny requests firing from the composer, not loose bubbles already sitting in the thread.

Current Scene 5 has the same Claude shell as Scene 4 and six prompt shots, but this is still not enough. It needs a full conceptual retry with many more prompts and stronger source-from-composer staging.

## What The Next Session Should Do First

Do **not** jump straight into `index.html` animation edits.

First create a contact sheet that shows the proposed changes:

1. New intro scene before current Scene 1.
2. Revised one-line current Scene 1 with sequential word entry.
3. Revised Scene 4 -> Scene 5 seam.
4. New Scene 5 prompt-firehose approach with prompts visibly launching from the composer.
5. A brief visual/background panel describing the global shader-like halftone motion approach.

The contact sheet should include short notes per frame explaining:

- Transition direction.
- What moves first.
- How the background behaves.
- What is intentionally still placeholder.

After Jake reacts to the contact sheet, then implement the locked changes in `index.html`.

## Verification Notes

Run lint after HTML edits:

```bash
/Users/jakemoran/.bun/bin/bun run --cwd /Users/jakemoran/Desktop/CC/repos/hyperframes-inspector-alpha packages/cli/src/cli.ts lint /Users/jakemoran/Desktop/CC/projects/active/hyperframes-inspector-launch-contact-sheet
```

The current lint warnings about file size, dense track, and self selector are known and not blockers. Actual errors should be fixed before preview review.

When checking runtime, verify:

- `window.__timelines["inspector-launch-v1"]` exists.
- Duration matches the updated total.
- The halftone canvas covers the full frame at multiple sampled times.
- Scene 4 and Scene 5 do not look like separate modal worlds.

## Do Not Do

- Do not fake a full Inspector UI; Scene 9 is a Screen Studio placeholder until real footage is captured.
- Do not use a side-by-side explainer layout.
- Do not make each scene its own unrelated visual universe.
- Do not make prompt bubbles appear disconnected from the composer.
- Do not let background movement expose blank frame edges.
- Do not skip the contact sheet step for the next set of changes.
