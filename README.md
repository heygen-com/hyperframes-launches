# hyperframes-launches

Source for HeyGen's HyperFrames launch videos. Each subdirectory is a standalone HyperFrames composition — open `index.html` in a browser (or via the HyperFrames CLI) to preview, render, or remix.

## Videos

| Launch | Directory | Public video |
| --- | --- | --- |
| HF HeyGen × Stripe | [`HF-heygen-stripe/`](./HF-heygen-stripe) | [Watch](https://hyperframes.dev/p/39fd89a4-831a-454c-83ec-eac0c5d0a79f) |
| Claude paper launch | [`claude-paper-launch/`](./claude-paper-launch) | [Watch](https://hyperframes.dev/p/c78e47ad-ca68-40d5-9cea-311e3e41c6ad) |
| Cloud Render launch | [`cloud-render-launch/`](./cloud-render-launch) | [Watch](https://hyperframes.dev/p/c1277090-93ff-4ae7-83dd-ca8edaa8f649) |
| Frame.md storyboard launch | [`frame-md-launch-storyboard/`](./frame-md-launch-storyboard) | [Watch](https://hyperframes.dev/p/50fa17c1-a655-43a5-b432-97348c187f1a) |
| HyperFrames launch | [`hyperframes-launch/`](./hyperframes-launch) | [Watch](https://hyperframes.dev/p/fd42aee4-146f-49a6-93f6-73f8033c64b2) |
| Inspector launch | [`inspector-launch/`](./inspector-launch) | [Watch](https://hyperframes.dev/p/0ebdb1bf-d831-4abd-993d-0132ab181107) |
| SFX music launch | [`sfx-music-launch/`](./sfx-music-launch) | [Watch](https://hyperframes.dev/p/116d9116-46d2-49e6-8b43-4345f4d6e83c) |
| SpaceX launch | [`spacex-launch/`](./spacex-launch) | [Watch](https://hyperframes.dev/p/799113c4-12e7-4331-9843-8e58829af06f) |
| Texture launch video | [`texture-launch-video/`](./texture-launch-video) | [Watch](https://hyperframes.dev/p/dfba472f-abed-4b91-89c1-7381e12c0c92) |
| Timeline editor launch | [`timeline-launch/`](./timeline-launch) | [Watch](https://hyperframes.dev/p/cade7204-61c0-466a-838c-ba173363fb69) |
| Variables launch | [`variables-launch/`](./variables-launch) | [Watch](https://hyperframes.dev/p/f13c2426-8628-4f18-879a-a86f800f13f9) |
| VFX HeyGen combined | [`vfx-heygen-combined/`](./vfx-heygen-combined) | [Watch](https://hyperframes.dev/p/0962451d-4804-4902-9e9e-0659a15b222e) |
| Website → HyperFrames demo | [`website-to-hyperframes/`](./website-to-hyperframes) | [Watch](https://hyperframes.dev/p/29c2aa8b-1366-416a-b694-c0299259d51b) |

## Cloning

This repo uses [Git LFS](https://git-lfs.com/) for video, audio, image, and font assets. HTML, CSS, JS, JSON, and Markdown are stored as regular text.

```bash
# one-time: install Git LFS
brew install git-lfs     # macOS
git lfs install

# clone (LFS assets download automatically)
git clone https://github.com/heygen-com/hyperframes-launches.git
cd hyperframes-launches
```

If you cloned without LFS installed, pull the assets after installing:

```bash
git lfs pull
```

To clone just the text (skip large assets) and fetch them on demand:

```bash
GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/heygen-com/hyperframes-launches.git
cd hyperframes-launches
git lfs pull --include="hyperframes-launch/assets/*"   # or any subset you need
```

## Per-project layout

Each video directory follows the HyperFrames project shape:

```
<project>/
├── index.html          # top-level composition
├── compositions/       # scene-level compositions
├── assets/             # video, audio, image inputs (LFS)
├── renders/            # final rendered videos (LFS)
├── STORYBOARD.md       # shot-by-shot plan
└── meta.json           # project metadata
```

## Working on a video

```bash
cd hyperframes-launch
hyperframes preview     # open the studio
hyperframes render      # render to mp4
```

See the [HyperFrames CLI docs](https://github.com/heygen-com/hyperframes) for the full command set.

## Adding a new launch video

1. Create a new subdirectory: `mkdir my-launch && cd my-launch && hyperframes init`
2. Build the composition.
3. Commit — LFS will pick up binary assets automatically via the root `.gitattributes`.
4. Add a row to the **Videos** table above.
