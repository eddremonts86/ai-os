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

> Brief derived from the source post. No facts added beyond what the post asserts.

## Value Proposition

Your mineral collection in your pocket. Photos in, HD 3D model + on-device classification + a virtual shelf you can share at exhibitions, all in the browser.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Amateur collector | Physical collections do not travel; a virtual shelf travels in a phone. |
| Museum curator | Commissioning 3D scans is expensive; photo-based 3D opens the door to more specimens. |
| Geology educator | A class-friendly 3D view of a specimen is more memorable than a textbook photo. |

## Jobs To Be Done

1. **Functional job** — keep a portable, searchable, 3D archive of a mineral collection.
2. **Emotional job** — share the pride of a collection with friends or at exhibitions.
3. **Social job** — credit the original collector on shared specimens; traceability matters here.

## Success Metrics

- **Activation:** % of signups who upload at least one specimen within 7 days.
- **Retention:** weekly active collectors; specimens added per week.
- **Revenue:** the post does not state pricing; freemium with a per-specimen storage cap is the obvious shape.

## Competitive Landscape

- Photogrammetry tools (Meshroom, RealityCapture): powerful but desktop-only and have a steep learning curve.
- 3D model viewers (Sketchfab): hosting only; classification and shelf UI are absent.
- Mineral-identification apps (RockHound, Geology Toolkit): 2D photos and reference text; no 3D.

## Risks & Open Questions

- WASM-based classification is fast but the model quality is bounded by the bundled weights; misclassifications will surface.
- Mobile performance is the explicit open question; the MVP must be honest about device limits.
- NFT traceability is a stated next step but adds regulatory and product complexity that the post does not address.
- Supabase login for the demo adds friction; the MVP should keep that as opt-in.
