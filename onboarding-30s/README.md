# Onboarding sample video (30 s)

HyperFrames project for the 30.5 s sample video in the Desktop onboarding. 1276x1078, 24 fps.

- `index.html` - the composition
- `assets/` - clips, fonts, matte, GSAP
- `assets/audio/ep01-30s-mix-v1.wav` - final mix (VO + music bed)


```bash
npx hyperframes@latest preview
npx hyperframes@latest render . --fps 24 --quality delivery --crf 12 -o renders/out.mp4
```
