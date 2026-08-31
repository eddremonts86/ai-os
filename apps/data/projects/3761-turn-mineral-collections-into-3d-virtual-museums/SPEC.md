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

## Problem

The author wants to convert their mineral and rock collection into a virtual 3D archive they can carry around and share. The concept: take one or more photos of stones and crystals, and the app generates an HD 3D model while classifying the rock using a local model (HF-CLIP WASM) directly in the browser. The author can then view the collection and share it at exhibitions. The plan is to subsequently add an NFT system for traceability and uniqueness. A demo is live at geo.insightest.app behind a Supabase login. The author wants feedback on the WebGL rendering pipeline, lighting setups for crystalline textures, and mobile performance.

## Objective

Build a browser-based pipeline that turns one or more photos of a mineral into an HD 3D model, classifies the specimen using an on-device WASM model, and stores it on a persistent virtual shelf that can be shared at exhibitions.

## Target Users

1. **Amateur mineral collector** — the primary user; owns a personal collection and wants to carry it virtually.
2. **Museum curator (small / regional)** — needs an exhibit-ready 3D archive without commissioning a specialist.
3. **Geology educator** — wants specimens to show in class without bringing physical samples.

## MVP Scope

- One or more photos of a mineral as input.
- HD 3D model generation on-device (or via a small cloud step in the MVP).
- On-device classification using HF-CLIP WASM.
- Persistent virtual shelf backed by Supabase for cross-device sync.
- Share view for exhibitions (read-only URL).
- Stop short of: NFT minting (planned but out of MVP scope), payment, social graph.

## Design Direction

See DESIGN.md for design tokens.

## Constraints

- Browser-first: the WASM classifier must run client-side; no upload of photos to a server for classification.
- 3D rendering must be performant on mid-range mobile; the author's explicit concern.
- No reliance on a paid third-party model API at runtime.
