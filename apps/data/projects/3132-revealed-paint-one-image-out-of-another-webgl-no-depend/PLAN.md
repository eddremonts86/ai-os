---
id: "3132"
slug: revealed-paint-one-image-out-of-another-webgl-no-depend
title: "Revealed – paint one image out of another (WebGL, no dependencies)"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449460"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, WebGL, Image, Creative-Tools]
tech: [JavaScript, WebGL2, GLSL, Vite, GitHub Pages]
---
# Revealed – paint one image out of another (WebGL, no dependencies)

## Tech Stack

- Hand-written JavaScript and WebGL2 with GLSL fragment shaders — no npm runtime dependencies, per the post's "no dependencies" pitch.
- A Vite build only for local dev convenience; the deployed artifact is a static bundle the developer can read end-to-end.
- GitHub Pages (or any static host) for deployment, because there is no server to operate.
- A small canvas2D-free input layer that translates pointer and touch events into brush uniforms.

## Architecture

- A single HTML page hosts two file inputs and one full-window canvas.
- The renderer uploads the chosen images as two textures and draws a full-screen quad whose fragment shader composites the cover image on top of the hidden one, modulated by a brush mask texture.
- The brush mask is updated by a small CPU step on each pointer event that writes a soft circle into an offscreen canvas, then re-uploads as a texture.
- The download button calls `canvas.toBlob` and triggers a save.
- A reset button re-clears the brush mask to fully opaque.

## Milestones

1. Static page that loads two images as WebGL textures and composites them with a fragment shader.
2. Pointer-driven brush mask texture with adjustable radius.
3. Reset and download buttons wired to the canvas state.
4. Touch input handling for iPad and Android, with no scroll-jacking.
5. Friendly WebGL-unsupported message for browsers without WebGL2.
6. Deploy as a static bundle with zero npm runtime dependencies.

## Risks

- Brush-mask re-upload on every pointer move can be costly on large canvases; the upload region must be clipped to the affected rectangle.
- iOS Safari's pointer-event behaviour around `touch-action` is the single biggest source of "the brush does not move" bugs.
- WebGL2 is unavailable on a small but real slice of old Android devices; a clear "your browser is too old" path is needed.
- The "no dependencies" rule means no `gl-matrix`, no helper libraries — every utility is hand-written and easy to miscalculate.
