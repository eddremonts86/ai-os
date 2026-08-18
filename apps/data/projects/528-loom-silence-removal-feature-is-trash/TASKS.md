---
id: "528"
slug: loom-silence-removal-feature-is-trash
title: Loom Silence Removal Feature is trash
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo23cg/loom_silence_removal_feature_is_trash/"
category: saas
date: "2026-08-14"
---
# Loom Silence Removal Feature is trash

## Phase 0: Scaffold

- [x] Capture problem from Reddit + write SPEC.md skeleton
- [ ] Define DESIGN.md (preview palette, threshold slider styling)
- [ ] Provision Next.js + S3 + BullMQ + Redis
- [ ] FFmpeg.wasm Web Worker skeleton

## Phase 1: Core

- [ ] Drag-and-drop upload + FFmpeg.wasm silence-removal pipeline
- [ ] Tunable threshold (dB) + minimum silence length (ms) sliders
- [ ] Side-by-side before/after preview with playback rate
- [ ] MP4 export, original frame rate preserved by default
- [ ] Server-side fallback for files >30 min (S3 upload + BullMQ)
- [ ] Stripe Checkout for Pro $9 and Studio $29
- [ ] End-to-end test: drop 5-min file → dial in threshold → export clean MP4

## Phase 2: Deploy

- [ ] Landing page with explicit comparison vs Loom
- [ ] Coolify-side deployment of Next.js + worker
- [ ] Server-side ffmpeg cost monitoring

---

_Lúa generó este análisis automáticamente el 2026-08-14_
