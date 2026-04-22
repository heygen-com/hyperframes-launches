# hyperframes-launches

Source for HeyGen's HyperFrames launch videos. Each subdirectory is a standalone HyperFrames composition — open `index.html` in a browser (or via the HyperFrames CLI) to preview, render, or remix.

## Videos

| Launch | Directory | Notes |
| --- | --- | --- |
| HyperFrames launch | [`hyperframes-launch/`](./hyperframes-launch) | The original announcement video. |
| Website → HyperFrames demo | [`website-to-hyperframes/`](./website-to-hyperframes) | Capture any site, generate a video from it. |
| Timeline editor launch | [`timeline-launch/`](./timeline-launch) | HyperFrames timeline editor reveal. |

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
