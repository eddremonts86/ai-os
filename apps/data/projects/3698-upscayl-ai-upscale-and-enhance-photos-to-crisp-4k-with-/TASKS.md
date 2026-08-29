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

## Phase 0: Scaffold

- [x] Capture problem from BetaList + write SPEC.md skeleton
- [ ] Define DESIGN.md (upload chrome, before/after slider, texture-preset selector, batch queue UI tokens)
- [ ] Lock the model matrix: which Real-ESRGAN variant per "natural" / "creative" preset
- [ ] Decide the GFPGAN toggle policy: opt-in only, with explicit disclosure that face details change
- [ ] Provision GPU worker pool + object storage with auto-delete-after-download
- [ ] Publish the privacy footer ("uploaded images auto-delete on download, never used for training")

## Phase 1: Core

- [ ] Single-image upload UI: drag-and-drop, JPG/PNG/WEBP accepted, target 4K by default
- [ ] Texture-preset selector with "natural" (default) and "creative" presets exposed on first upload
- [ ] Real-ESRGAN inference worker: 4K default, up to 8K on paid tier, with seconds-level latency on a single image
- [ ] GFPGAN face-enhancement toggle (off by default, opt-in, with disclosure copy)
- [ ] Unblur tool as a separate single-image pass
- [ ] Background-removal tool that returns a transparent PNG
- [ ] Batch upload of multiple images with a single zipped download
- [ ] Before/after preview slider on the result page so users can see the upgrade
- [ ] REST API endpoints exposing the same upscale / face / unblur / background-removal pipeline
- [ ] API rate-limit headers documented on every endpoint and enforced per plan tier
- [ ] End-to-end test: upload a low-res JPG with a face, opt into GFPGAN, get back a 4K PNG with the face pass applied

## Phase 2: Deploy

- [ ] Stripe-backed credit packs (web) and monthly API plans
- [ ] Pricing page published with batch limits and per-job cost visible before upload
- [ ] Open beta on BetaList with a "natural" preset quality-perception survey after the first 100 upscales
- [ ] Privacy + auto-delete footer live on every upload page
- [ ] Post-launch: monitor quality-perception scores weekly; ship a model-swap playbook when "natural" preset scores drop below 70%
