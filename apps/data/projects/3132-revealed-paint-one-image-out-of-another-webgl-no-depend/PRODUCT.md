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

## Value Proposition

A one-page browser tool that paints one image out of another with a brush, with the entire renderer in hand-written WebGL2 and GLSL so the page is auditable in a single sitting and runs without installing anything.

## Target Users

- Designers and illustrators who want a fast, install-free way to make a "reveal" image.
- Web graphics hobbyists looking for a self-contained WebGL demo to read.
- Anyone making a one-off visual for social who does not want to open Photoshop.

## Jobs To Be Done

- When I want to make a reveal-style image, I want to pick two images and paint with a brush so I can ship the result without installing software.
- When I am curious how the effect works, I want a single-file or near-single-file demo so I can read the shader and the wiring in one sitting.
- When I am on a locked-down machine, I want a tool that runs offline after first load so I can finish the job without a network.

## Success Metrics

- Page weight of the deployed app, in KB, with a target that reflects "no dependencies".
- Number of distinct sessions that produce a PNG download (proxy for "people finished a reveal").
- Time to first interactive paint on a mid-range laptop, as a usability signal.

## Competitive Landscape

_Source does not name any competing product._ The demo is a single-link page on idlee.xyz and the post names no comparable dependency-free reveal demo.

## Risks & Open Questions

- WebGL2 is not universal on very old mobile devices; the page has to fail gracefully with a clear message rather than a black canvas.
- Brush strokes can leak outside the canvas if pointer events are not captured correctly on touch devices; the input layer needs careful testing on iPad.
- Very large source images can exceed GPU texture limits; a maximum dimension cap with a friendly error is necessary.
- Whether a "reveal animation" export (a paint-stroke video) belongs in MVP or v2.
