# Grok HyperFrames Launch — design.md

Source direction: adapt the Claude Paper launch video to Grok, using the supplied Grok connector screenshot as the visual anchor.

## Palette

- `bg`: `#030404` — Grok black canvas, never pure black in authored CSS.
- `sidebar`: `#070807` — left rail / app chrome.
- `panel`: `#171717` — composer, menus, connector cards.
- `panelElevated`: `#202020` — hover rows and raised menu surfaces.
- `panelPressed`: `#303030` — selected rows and button press state.
- `fg`: `#F4F4F0` — primary text and Grok logo.
- `muted`: `#A7A7A2` — secondary text.
- `quiet`: `#74746F` — tertiary labels and disabled controls.
- `border`: `#2B2B2B` — visible dark-mode hairlines.
- `borderSoft`: `#252525` — low-emphasis dark-mode dividers.
- `accent`: `#F4F4F0` — active Grok controls and high-contrast focus states.
- `accentDeep`: `#A7A7A2` — pressed/secondary active states.
- `accentText`: `#F4F4F0` — monochrome emphasis on dark.
- `success`: `#F4F4F0` — active toggle knob / success lockup.
- `greenEdge`: `#184C3C` — subtle screen/recording edge from the screenshot.
- `onAccent`: `#030404` — text/icon color on active white controls.
- `brandCyan`: `#06E3FA` — HyperFrames connector mark only.
- `brandGreen`: `#4FDB5E` — HyperFrames connector mark only.
- `white`: `#FFFFFF` — toggle knobs and isolated high-contrast icons only.
- `black`: `#000000` — imported logo/path data only.

## Typography

- `display`: `"Hanken Grotesk", system-ui, sans-serif`
- `body`: `"Hanken Grotesk", system-ui, sans-serif`
- `serif`: `"Newsreader", Georgia, serif` for long answer prose and generated-video editorial beats.
- `mono`: `"Spline Sans Mono", monospace` for tool pills, metadata, and code-like UI.

Weights: display 700-800, body 400-600, mono 500-600.

## Motion

- Rhythm: connector-hook, chat-build, answer-scroll, follow-up-build, tool-peak, generated-video-breathe, Grok-resolve.
- Primary transition: inherited velocity-matched zoom-through and leftward cut-the-curve.
- UI motion should feel fast and private: short cursor taps, compressed menu morphs, sharp blur on zoom transitions.
- Ambient motion is minimal: dark frame glows, subtle edge breathing, connector card lift.

## Components

- Composer: large rounded pill/card, `#171717` fill, `#2B2B2B` border, `#A7A7A2` placeholder, white circular voice/send button with dark icon.
- Menus: compact dark panels with `#202020` hover rows and `#303030` selected rows.
- Tool pills: dark rounded pills with mono text, matching the Grok connector details card.
- Brand lockup: white Grok mark + wordmark on `#030404`.

## Avoid

- Warm paper/cream backgrounds from the Claude source.
- Claude clay as the primary accent.
- Orange SuperGrok offer badges or sale UI.
- Generic blue-on-dark AI palettes.
- Center-only empty frames without connector details or Grok identity.
