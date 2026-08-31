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

## Tech Stack

Chosen for a native Apple-platform media enhancer whose selling point is a small footprint.

- **Swift and SwiftUI:** native iPad/iPhone app matching the App Store listing.
- **Core ML on-device upscaling:** x2/x4 models run locally on Apple hardware.
- **AVFoundation video pipeline:** decode, process and re-encode with frame-rate control (30/60 fps) and audio preserved.
- **Metal shaders for layer blends:** 27 blend modes and 60+ effects computed on the GPU.
- **Batch photo queue:** job queue with per-item progress across up to 100 photos.
- **iOS and iPadOS distribution:** shipped through the App Store as a free app with in-app purchases.

## Architecture

- **Media importer:** photos and videos in, with format detection.
- **Model runner:** x2/x4 upscaling models (Math, Helex, Oryn, Nitro, Anima) behind a common interface.
- **Render pipeline:** AVFoundation decode to Metal-enhanced processing to encode, at source rate or 30/60 fps.
- **Batch engine:** queues up to 100 photos, reports per-item progress, tolerates interruption.
- **Editor layer:** the layer stack with blend modes, effects and the AI Strength control.

## Milestones

1. **M0 — Photo path.** Single-photo enhancement with the AI Strength control.
2. **M1 — Batch.** Queue of up to 100 photos with progress, matching the title.
3. **M2 — Video.** x2/x4 models with 30/60 fps rendering and preserved audio.
4. **M3 — Polish.** Layers, 27 blend modes, 60+ effects, and a build that stays near the 9MB claim.

## Risks

- **Size vs features:** adding video models and effects threatens the 9MB footprint the title advertises.
- **On-device compute:** x4 video upscaling may be slow or hot on older iPads.
- **Unverifiable claims:** the post offers no benchmarks, reviews or downloads beyond the listing.
- **Scope creep:** the listing's feature list (layers, effects, models) is large for one app.
- **Monetization unknown:** free-with-IAP is stated by the listing, not by the poster.
