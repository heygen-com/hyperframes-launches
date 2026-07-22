# hyperframes-launches

Source for HeyGen's HyperFrames launch videos. Each subdirectory is a standalone HyperFrames composition — open `index.html` in a browser (or via the HyperFrames CLI) to preview, render, or remix.

## Videos

| Launch | Directory | Public video |
| --- | --- | --- |
| HF HeyGen × Stripe | [`HF-heygen-stripe/`](./HF-heygen-stripe) | [Watch](https://hyperframes.dev/viewer/d6f7d40f-1e32-4b73-a551-af47cc19e8a2) |
| Claude paper launch | [`claude-paper-launch/`](./claude-paper-launch) | [Watch](https://hyperframes.dev/viewer/659498ab-d77e-48a8-a719-dd97adbbd3e5) |
| Cloud Render launch | [`cloud-render-launch/`](./cloud-render-launch) | [Watch](https://hyperframes.dev/viewer/4259dc01-157a-4966-9c58-4e97faa2548e) |
| Figma integration launch | [`figma-launch/`](./figma-launch) | [Watch](https://hyperframes.dev/viewer/58fdce81-6ef0-4860-899d-d6b3da692a54) |
| Frame.md storyboard launch | [`frame-md-launch-storyboard/`](./frame-md-launch-storyboard) | [Watch](https://hyperframes.dev/viewer/c5198458-4eaa-4933-a4e8-029c8010a845) |
| HyperFrames launch | [`hyperframes-launch/`](./hyperframes-launch) | [Watch](https://hyperframes.dev/viewer/9ab8d480-7507-4905-9222-ae6ea4b2fb5a) |
| Inspector launch | [`inspector-launch/`](./inspector-launch) | [Watch](https://hyperframes.dev/viewer/87889a4c-cc67-4e4a-b576-b57dd892fee3) |
| Kimi K3 promo | [`k3-promo/`](./k3-promo) | [Watch](./k3-promo/k3-promo.mp4) |
| PR-to-video launch | [`pr-to-video-launch/`](./pr-to-video-launch) | [Watch](https://hyperframes.dev/viewer/72c9b502-0c96-4bde-9a78-9a178267c475) |
| SFX music launch | [`sfx-music-launch/`](./sfx-music-launch) | [Watch](https://hyperframes.dev/viewer/1adcf040-9df5-46b9-ab56-8e33795b5f84) |
| SpaceX launch | [`spacex-launch/`](./spacex-launch) | [Watch](https://hyperframes.dev/viewer/58d80c88-37fe-4527-a803-1b29c35373b7) |
| Texture launch video | [`texture-launch-video/`](./texture-launch-video) | [Watch](https://hyperframes.dev/viewer/b92c24b4-5143-4bce-85ce-408be4c3c4ec) |
| Timeline editor launch | [`timeline-launch/`](./timeline-launch) | [Watch](https://hyperframes.dev/viewer/105200be-ebda-4209-a225-a2edf01cf1b7) |
| Variables launch | [`variables-launch/`](./variables-launch) | [Watch](https://hyperframes.dev/viewer/6387d7c2-3819-4e60-916c-e346a3598b67) |
| VFX HeyGen combined | [`vfx-heygen-combined/`](./vfx-heygen-combined) | [Watch](https://hyperframes.dev/viewer/3c3669b8-65d0-4f1f-8cdb-e608c1a58ff9) |
| Website → HyperFrames demo | [`website-to-hyperframes/`](./website-to-hyperframes) | [Watch](https://hyperframes.dev/viewer/85d2d8d5-bf5b-4d04-901d-7c3ae157a30a) |

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
