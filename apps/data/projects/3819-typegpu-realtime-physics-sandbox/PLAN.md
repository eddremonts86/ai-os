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

## Tech Stack

Named by the capture: TypeGPU with WebGPU compute underneath.

- **TypeGPU:** the type-safe GPU programming layer the sandbox showcases.
- **WebGPU compute shaders:** the execution substrate for the simulations.
- **PBF fluid solver:** position-based fluids for realtime water.
- **Eulerian smoke solver:** grid-based smoke advection.
- **Depth map processing:** depth extraction and surface-normal computation for gravity inference.
- **Media input pipeline:** photos, videos and live webcam frames as simulation surfaces.

## Architecture

- **Depth pipeline:** each frame (photo, video or webcam) produces a depth map; normals from it define per-pixel gravity.
- **Fluid simulation:** PBF particles advected under the inferred gravity, rendered in realtime.
- **Smoke simulation:** a parallel Eulerian grid solver.
- **Light simulation:** multi-source light injection following the depth-aware approach of the Reczko demo that inspired it.
- **Interaction layer:** hand tracking to influence the simulation; WIP cup interior detection for fillable volumes.

## Milestones

1. **M0 — Core sims.** PBF fluids and Eulerian smoke run in realtime on static images.
2. **M1 — Depth-aware gravity.** Surface normals from depth maps steer fluid motion; tilted scenes behave correctly.
3. **M2 — Live sources.** The pipeline runs on videos and live webcam with multi-source light.
4. **M3 — Interaction.** Hand tracking ships; cup interior detection leaves WIP status.

## Risks

- **Performance budget:** three sims plus depth inference per frame leaves little headroom on lower-end GPUs.
- **Depth quality:** monocular depth errors translate directly into wrong gravity and visibly broken flows.
- **WIP feature risk:** the cup detection may not stabilize; the demo must not depend on it.
- **Unshared code:** with no repo linked, the sandbox cannot attract contributors or fixes.
