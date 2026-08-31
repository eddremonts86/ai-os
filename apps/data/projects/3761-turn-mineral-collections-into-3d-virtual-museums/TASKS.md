---
id: "3761"
slug: turn-mineral-collections-into-3d-virtual-museums
title: Turn mineral collections into 3D virtual museums
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

## Phase 0: Scaffold

- Stand up the React + Three.js shell with the photogrammetry worker placeholder.
- Implement the photo upload + 3D generation pipeline.
- Wire the ONNX Runtime Web classifier; export a model that fits the on-device size budget.
- Define the shelf schema in Supabase (specimens, models, classifications, share tokens).
- Build the share view (read-only shelf with the same Three.js renderer).
- Add a simple admin surface to delete or re-classify a specimen.
- Hand-test on mid-range Android; measure first-3D-paint and scroll FPS.

## Phase 1: Core

- All MVP Scope items shipped end-to-end.
- A user can upload three photos, get a usable 3D model, see the classification, and add it to the shelf.
- Share view loads in under 3 seconds on a mid-range phone.
- WASM classifier runs entirely client-side; no upload of photos to a server for classification.
- Test coverage on the classifier wrapper and the shelf schema.

## Phase 2: Deploy

- Deploy on Coolify with Supabase as the backing store.
- Document the WASM model swap path so a future model upgrade does not break the classifier.
- Publish a public demo without the Supabase login gate.
- Capture three real specimen uploads as case studies with the WebGL-perf metrics.
