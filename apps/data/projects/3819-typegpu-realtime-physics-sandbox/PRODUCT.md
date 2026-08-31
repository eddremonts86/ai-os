---
id: "3819"
slug: typegpu-realtime-physics-sandbox
title: TypeGPU Realtime Physics Sandbox
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495118"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [TypeGPU, WebGPU compute shaders, PBF fluid simulation, Eulerian smoke solver, depth-map light injection, webcam hand tracking]
---
# TypeGPU Realtime Physics Sandbox

## Value Proposition

Physics that believes the photograph. Most fluid demos pour on a flat plane; this sandbox infers gravity from the depth map's surface normals, so water and smoke follow the actual geometry of a photo, video or live webcam — tilted surfaces flow like tilted surfaces. The showcase bundles three simulations — PBF fluids, Eulerian smoke and multi-source light — and layers on the fun stuff that makes it tangible: hand tracking to stir the simulation, and a work-in-progress cup detector so a glass in live video can actually be filled. It is a reference for what TypeGPU and WebGPU compute make possible, inspired by Konrad Reczko's depth-aware light injection work.

**One-liner:** A TypeGPU showcase of realtime fluids, smoke and light that respect the depth geometry of photos, videos and webcams.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Graphics programmers | A working example of PBF, Eulerian smoke and light injection in TypeGPU. |
| Media artists | Depth-aware effects on real footage without a 3D pipeline. |
| Demo enthusiasts | Hand tracking and cup filling make the physics interactive. |
| TypeGPU community | A flagship demo for the library's compute capabilities. |

The post states no commercial market; the sandbox is a technical showcase.

## Jobs To Be Done

1. **Functional job** — Simulate PBF fluids in realtime over photo, video and webcam sources.
2. **Functional job** — Simulate Eulerian smoke alongside the fluids.
3. **Functional job** — Infer gravity from depth-map surface normals so tilted scenes flow correctly.
4. **Emotional job** — Experience the "oh, it respects the photo" moment — water filling a real cup on camera.

## Success Metrics

- **Framerate:** all three simulations hold interactive rates on a mid-range GPU — the demo's core claim.
- **Depth correctness:** fluid visibly follows the geometry of tilted test scenes versus flat-plane baselines.
- **Source coverage:** photos, videos and live webcam all run the same pipeline.
- **Cup filling:** the WIP detector reaches a state where a demo user can fill a cup in live video.
- **Community reach:** the showcase draws attention to TypeGPU (the implied goal of a showcase post).

## Pricing & Monetization

None stated. The capture describes a demo with no repository, license or business model.

## Competitive Landscape

The post does not name competitors. The category is realtime physics and light-simulation showcases — the lineage running from GPU particle demos to depth-aware AR effects; the sandbox's position is the depth-aware intersection, where scene geometry from depth maps drives the physics, with hand tracking and object interaction (cups) on top.

## Risks & Open Questions

- [ ] Realtime is fragile: resolution, device class and webcam depth quality all threaten the framerate bar.
- [ ] Depth maps are approximate; bad normals produce visibly wrong fluid motion and no fallback is described.
- [ ] Cup interior detection is WIP by the poster's own label; it may not reach demo quality soon.
- [ ] No repo or license in the capture means the code's availability and reuse terms are unknown.
- [ ] Browser and WebGPU support vary; the demo's audience is gated by what their browsers enable.
