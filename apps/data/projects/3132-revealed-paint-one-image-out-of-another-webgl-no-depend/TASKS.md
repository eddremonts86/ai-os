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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3132-revealed-paint-one-image-out-of-another-webgl-no-depend/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Confirm the production build has no npm dependencies in the runtime bundle
- [ ] Add a WebGL2 feature-detection step that hides the canvas on unsupported browsers

## Phase 1: Core

- [ ] Static page with two file inputs and one full-window canvas
- [ ] WebGL2 setup: vertex buffer for a full-screen quad, fragment shader for composite
- [ ] Texture upload for the hidden and cover images
- [ ] Brush mask texture updated on pointer events, soft-circle write
- [ ] Brush-size slider wired to the radius uniform
- [ ] Reset button that clears the mask
- [ ] Download button that exports the canvas as PNG
- [ ] Touch input handling with `touch-action: none` on the canvas
- [ ] Friendly error path for WebGL2-unsupported browsers

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
