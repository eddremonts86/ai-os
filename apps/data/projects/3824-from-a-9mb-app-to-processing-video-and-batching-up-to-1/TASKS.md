---
id: "3824"
slug: from-a-9mb-app-to-processing-video-and-batching-up-to-1
title: From a 9MB app to processing video and batching up to 100 photo
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494401"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Swift and SwiftUI, Core ML on-device upscaling, AVFoundation video pipeline, Metal shaders for layer blends, batch photo queue, iOS and iPadOS distribution]
---
# From a 9MB app to processing video and batching up to 100 photo

## Phase 0: Scaffold

- [x] Read the Show HN capture to confirm it is URL-only and the claim lives in the title
- [x] Pull the App Store listing for Pixzool to verify features (batch of 100, x2/x4 models, layers, effects)
- [x] Write SPEC.md (this document)
- [x] Scaffold the Swift/SwiftUI app with the photo import path

## Phase 1: Core

- [ ] Implement single-photo enhancement with the AI Strength control
- [ ] Build the batch queue handling up to 100 photos with per-item progress
- [ ] Wire the x2/x4 video models with 30/60 fps rendering and audio preservation
- [ ] Add layers with 27 blend modes and the 60+ effects
- [ ] Keep the binary near 9MB; measure and trim at each milestone

## Phase 2: Deploy

- [ ] Test on real iPads and iPhones; tune thermal and battery behavior
- [ ] Submit to the App Store as free with in-app purchases
- [ ] Collect real user feedback on model quality and batch reliability

---

_Generated automatically by Lúa on 2026-08-30_
