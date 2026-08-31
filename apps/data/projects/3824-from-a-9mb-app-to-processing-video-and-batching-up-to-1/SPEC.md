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

## Problem

The capture is a URL-only Show HN: the post body contains nothing but a link to the App Store page for Pixzool. The product claim is carried by the post title — "From a 9MB app to processing video and batching up to 100 photo" — and by what the App Store listing itself verifies: Pixzool is a photo and video AI enhancement editor with x2 and x4 video upscaling models, photo batch queues of up to 100 images, layer editing with 27 blend modes and 60+ effects, shipped free with in-app purchases. The 9MB figure appears only in the post title and cannot be verified from the capture.

## Objective

Ship the lightweight photo and video enhancer the title describes: a small iPad/iPhone app that upscales video with x2/x4 models and batches up to 100 photos in one queue, keeping the download footprint near the title's 9MB claim.

## Target Users

- iPad and iPhone users who want AI photo and video enhancement without desktop software.
- Photographers queueing many photos at once (the 100-photo batch queue).
- Video owners upscaling low-resolution footage toward 4K.

## MVP Scope

- Photo AI enhancer: enlarge, sharpen, denoise and clean artifacts, with an AI Strength control.
- Video AI enhancer with x2/x4 models (the listing names Math, Helex, Oryn, Nitro and Anima), keeping the source frame rate or rendering at 30/60 fps.
- Batch processing: queue up to 100 photos with per-item progress.
- Layers with 27 blend modes and 60+ effects, as the listing states.

## Constraints

- The 9MB claim comes from the post title alone and is not verifiable from the capture.
- Verifiable facts come from the App Store listing at capture time; the listing may change.
- On-device AI on iOS/iPadOS constrains model size, memory and thermal budget.
- The listing says free with in-app purchases; the capture itself states no pricing.

## Design Direction

See `DESIGN.md` for this project's design tokens.
