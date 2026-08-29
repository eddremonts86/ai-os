---
id: "3761"
slug: turn-mineral-collections-into-3d-virtual-museums
title: "Turn mineral collections into 3D virtual museums"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49489788"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [TypeScript, React (or Solid) for the UI, Three.js for WebGL rendering, ONNX Runtime Web / Transformers.js for the WASM classifier, Supabase for shelf + auth, Coolify for self-host]
---

# Turn mineral collections into 3D virtual museums

## Tech Stack

TypeScript, React (or Solid) for the UI, Three.js for WebGL rendering, ONNX Runtime Web / Transformers.js for the WASM classifier, Supabase for shelf + auth, Coolify for self-host.

## Architecture

Browser-only pipeline: client uploads photos, photogrammetry step (cloud worker in MVP), Three.js viewer for the 3D model, WASM classifier for the label, Supabase for the shelf. A read-only share view renders the same shelf for exhibitions.

## Milestones

- **M0:** SPEC + DESIGN approved.
- **M1:** Photo upload + 3D model generation.
- **M2:** WASM classifier integration.
- **M3:** Virtual shelf + share view.

## Risks

- Photogrammetry quality is bounded by photo count and lighting; the MVP must communicate that.
- Mobile WebGL performance on large meshes is the explicit unknown.
- WASM model size and cold-start time shape the first-paint experience.
- Supabase storage cost scales with model size and shelf count.
