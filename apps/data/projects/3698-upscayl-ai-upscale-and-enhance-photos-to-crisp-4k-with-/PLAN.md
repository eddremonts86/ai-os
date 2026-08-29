---
id: "3698"
slug: upscayl-ai-upscale-and-enhance-photos-to-crisp-4k-with-
title: "Upscayl AI – Upscale and enhance photos to crisp 4K with fast, natural AI"
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/upscayl-ai?utm_campaign=startup-181443&utm_medium=atom&utm_source=newsfeed"
  captured: "2026-08-29"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [Web (TypeScript/React), Real-ESRGAN models, GFPGAN for face enhancement, cloud GPU inference, REST API for batch jobs]
---
# Upscayl AI – Upscale and enhance photos to crisp 4K with fast, natural AI

## Tech Stack

- **Frontend:** TypeScript + React SPA, drag-and-drop upload, batch queue UI, before/after preview slider.
- **Inference:** cloud GPU workers running Real-ESRGAN (the same model family the open-source desktop Upscayl uses) with optional GFPGAN for face enhancement.
- **Pipeline:** upscale → optional GFPGAN face pass → optional unblur → optional background removal → encode (PNG / JPG / WEBP) → signed download URL.
- **API:** REST endpoints exposing the same pipeline, with explicit batch limits and rate-limit headers so a developer can size their spend.
- **Storage:** short-lived object storage with auto-delete after download; explicit no-training policy in the privacy footer.
- **Billing:** credit packs (web) and monthly API plans (developer), Stripe-backed.

## Architecture

```
Browser / API client
        │  multipart upload (single image or batch)
        ▼
┌────────────────────────────────────────────────────────────┐
│  Web / API edge                                            │
│   • Auth (API key or session cookie)                       │
│   • Quota check (free-tier web / monthly API plan)         │
│   • Enqueue job → job queue                                │
└────────────────────────────────────────────────────────────┘
        │
        ▼
┌────────────────────────────────────────────────────────────┐
│  GPU worker pool                                           │
│   1. Decode + validate (JPG / PNG / WEBP only)             │
│   2. Real-ESRGAN upscale (target 4K or up to 8K)           │
│   3. Optional GFPGAN face pass on detected faces           │
│   4. Optional unblur sharpen pass                          │
│   5. Optional background-removal pass (transparent PNG)    │
│   6. Encode + sign URL → callback to edge                  │
└────────────────────────────────────────────────────────────┘
        │
        ▼
   Signed download URL (auto-delete)
```

## Milestones

1. **M0 — Spec freeze.** Model matrix (which Real-ESRGAN variant per preset), GFPGAN toggle policy, batch limits, API rate-limit posture. End of week 2.
2. **M1 — Single-image upscale.** Upload JPG/PNG/WEBP, get 4K back in seconds; "natural" vs "creative" texture presets. End of week 4.
3. **M2 — 8K + batch.** Up to 8K output; multi-image upload with a single zipped download. End of week 6.
4. **M3 — Face + unblur + background.** GFPGAN face enhancement opt-in; unblur tool; background-removal tool that returns transparent PNG. End of week 8.
5. **M4 — API + paid plans.** REST endpoints with documented rate limits; Stripe-backed credit packs and monthly API plan. End of week 10.
6. **M5 — Beta → launch.** Open beta on BetaList; quality-perception survey on the "natural" preset; pricing published. End of week 12.

## Risks

- **"Natural" is subjective.** A user uploading a heavily compressed JPEG will get a different result than one uploading a clean PNG; if "natural" is the default and the user does not see the texture-preset dropdown, quality-perception scores will drop. Surface the preset on the first upload and add a "why does my result look different?" help link.
- **GFPGAN face changes identity.** GFPGAN produces a plausible face, not the user's face. If the toggle is on by default, e-commerce sellers will silently lose brand-canonical product shots. Ship with the toggle off and require an explicit opt-in.
- **GPU cost vs free tier.** A free tier that lets users upload 100 images at 8K is unviable. The free tier must cap resolution (4K only) and total images per month; the cap must be visible before upload so users do not burn time on a job that will be rejected.
- **Privacy posture vs the AGPLv3 desktop.** The desktop Upscayl is fully offline. Cloud users will reasonably ask what happens to their uploads. Ship an explicit "uploaded images are auto-deleted on download, never used for training" footer before the first paying customer signs up.
