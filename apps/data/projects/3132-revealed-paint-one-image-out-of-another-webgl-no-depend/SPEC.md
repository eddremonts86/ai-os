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

## Problem

A class of image trick — paint a hidden image out of a visible one by erasing pixels with a brush — usually needs a heavyweight editor or a server-side renderer. The Revealed demo shows a browser-only WebGL version with no third-party libraries: pick a hidden image, paint over a visible image, and the hidden image emerges where the brush removed pixels. The "no dependencies" part matters because the page is a single static file a reader can audit.

## Objective

Ship a single-page WebGL2 app that lets a user load two images, paint the visible one with a brush, and reveal the hidden one underneath, with the entire runtime written in plain JavaScript and GLSL and served as static files.

## Target Users

- Designers and illustrators who want a quick, install-free way to make a "reveal" image for social or for fun.
- Web graphics hobbyists who want a self-contained WebGL demo to read and learn from.

## MVP Scope

- A static page that loads two images from local file pickers (the hidden image and the cover image).
- A WebGL2 fragment shader that composites the two images, with a brush uniform driven by the user's pointer.
- A brush size slider and an "erase to reveal" mode that is the default.
- A "reset" button that re-covers the hidden image with the visible one.
- A download button that exports the current canvas as a PNG.
- No build step beyond bundling the JS; no npm dependencies in the runtime.
- Out of scope: server-side rendering, layered PSD-like editing, animation export.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The runtime must be free of npm dependencies: hand-written WebGL and GLSL only, served from a static host.
- The page must work offline once loaded, so the reveal can be done without a network connection.
- All GPU work happens in a single fragment shader pass; no per-frame JS-side pixel reads in the hot path.
- The file picker accepts PNG and JPEG and reports a clear error for unsupported formats rather than failing silently.
