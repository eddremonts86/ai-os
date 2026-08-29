---
id: "3643"
slug: openlayer-local-photoshop-plugin-for-comfyui-inpaintout
title: OpenLayer – local Photoshop plugin for ComfyUI (inpaint/outpaint demo)
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49480266"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Photoshop CEP/UXP Extension (HTML/JS), ComfyUI HTTP API, Python, ComfyUI Server, WebSocket, PNG via Canvas]
---
# OpenLayer – local Photoshop plugin for ComfyUI (inpaint/outpaint demo)

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3643-openlayer-local-photoshop-plugin-for-comfyui-inpaintout/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Scaffold the Photoshop extension with a panel exposing Inpaint, Outpaint, host, port and workflow ID settings
- [ ] Encode the active layer and the active mask as PNGs with the alpha channel carrying the mask
- [ ] POST the encoded inputs to the local ComfyUI server's /prompt endpoint
- [ ] Subscribe to ComfyUI's WebSocket stream and surface progress and queue position in the panel
- [ ] Write the returned image back into the active layer at the document's bit depth and profile
- [ ] Implement Outpaint: grow the canvas, build the mask, send, paste at the correct offset
- [ ] Ship default inpaint and outpaint workflows as JSON in the repo and document how to swap them
- [ ] Verify the plugin against at least one ComfyUI version with both a static-image and a checkpoint-backed workflow
- [ ] Document the GPU requirement and the local-only property explicitly in the readme
- [ ] Test on at least one 16-bit and one wide-gamut document to surface the colour-management seam before users do

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
