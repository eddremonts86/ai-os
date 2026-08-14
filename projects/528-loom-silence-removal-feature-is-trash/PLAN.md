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

## Tech Stack

- **Frontend:** Next.js (App Router) with Web Workers for the FFmpeg.wasm pipeline.
- **Video processing:** FFmpeg.wasm in the browser for files ≤30 min; a server-side ffmpeg job (Node.js + BullMQ on Redis) for longer files.
- **Storage:** uploads to S3 (or R2) only when the server-side fallback kicks in.
- **Payments:** Stripe Checkout.

## Architecture

Browser-side: a Web Worker runs FFmpeg.wasm on the dropped file, applies the silence filter, and returns a Blob for download. Server-side fallback: an upload to S3 triggers a BullMQ job that runs ffmpeg and writes the result back to S3, then pings the client via WebSocket.

```
Browser ─▶ Next.js (UI)
              │
              ├─▶ Web Worker (FFmpeg.wasm) → Blob → download
              │
              └─▶ S3 upload ─▶ BullMQ ─▶ ffmpeg ─▶ S3 ─▶ WebSocket ─▶ Browser
```

## Milestones

1. **M0 — Browser-side silence removal.** FFmpeg.wasm pipeline + tunable threshold/length. End of week 2.
2. **M1 — Side-by-side preview + export.** End of week 4.
3. **M2 — Server-side fallback for long files.** End of week 6.
4. **M3 — Pricing tiers live.** End of week 7.

## Risks

- **Browser performance.** FFmpeg.wasm is significantly slower than native. Mitigation: a "process on server" upsell for long files; aggressive codec selection.
- **Quality ceiling.** Silence removal alone doesn't make a recording "good" — bad mic, filler words, and pacing remain. Mitigation: set expectations clearly on the landing page.
