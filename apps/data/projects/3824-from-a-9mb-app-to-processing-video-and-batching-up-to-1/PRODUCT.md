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

## Value Proposition

A small app that does what the title claims: Pixzool processes video with dedicated x2/x4 AI models and batches up to 100 photos in one queue, from a download the post says is 9MB. The App Store listing is the verifiable layer: photo enhancement (enlarge, sharpen, denoise, artifact cleanup), video upscaling with the named x2 Math, x2/x4 Helex, x4 Oryn, x2/x4 Nitro and x2/x4 Anima models at 30 or 60 fps, layers with 27 blend modes, 60+ effects and an AI Strength control — free with in-app purchases.

**One-liner:** A small iOS/iPadOS photo and video AI enhancer that batches up to 100 photos and upscales video with x2/x4 models.

## Target Users

| Stakeholder | Why they care |
|---|---|
| iPad and iPhone photo editors | Batch up to 100 photos in one queue with per-item progress. |
| Low-resolution video owners | x2/x4 upscaling models toward crisp 4K output. |
| Layer and effects users | 27 blend modes and 60+ effects with gesture controls. |

The post itself names no audience; these follow from the App Store feature list.

## Jobs To Be Done

1. **Functional job** — Enlarge or sharpen a photo with a strength dial the user controls.
2. **Functional job** — Upscale a video with a chosen x2/x4 model at 30 or 60 fps, keeping audio.
3. **Functional job** — Queue a batch of up to 100 photos and follow each item's progress.
4. **Functional job** — Edit with layers and effects directly on an iPad.

## Success Metrics

- **Download footprint:** the app stays near the title's 9MB claim — the only number the post gives.
- **Batch throughput:** a queue of up to 100 photos completes with visible per-item progress.
- **Video paths:** each named x2/x4 model renders at 30/60 fps without losing audio.
- **App Store health:** free-with-IAP installs convert to purchases at a rate the listing does not state.

## Pricing & Monetization

The capture states nothing. The App Store listing says the app is free with in-app purchases; specific IAP prices are not stated anywhere in the capture.

## Competitive Landscape

The post does not name competitors. The product sits in the mobile AI photo/video enhancement category — apps that upscale, sharpen and denoise media on-device — where the post's own claims to differentiation are the small footprint (9MB in the title) and the 100-photo batch queue.

## Risks & Open Questions

- [ ] The 9MB figure rests on the post title; nothing in the capture verifies it.
- [ ] On-device x2/x4 video upscaling is compute-heavy; battery, thermals and app size fight each other.
- [ ] Model names (Math, Helex, Oryn, Nitro, Anima) come from the listing; their quality claims are unverified.
- [ ] The capture has no engagement signal beyond the URL; no user feedback appears in the post.
- [ ] Free-with-IAP pricing leaves the actual revenue model unstated.
