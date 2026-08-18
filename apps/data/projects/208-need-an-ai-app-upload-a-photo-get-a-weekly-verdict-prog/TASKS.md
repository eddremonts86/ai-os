---
id: "208"
slug: need-an-ai-app-upload-a-photo-get-a-weekly-verdict-prog
title: "Need an AI app: upload a photo → get a weekly verdict «progress / no progress» and advice on when to retake the photo."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: ai
date: "2026-03-29"
tags: [AI, Health, Photo]
country: Greece
tech: [React Native, Python, FastAPI, Vision Transformer, PostgreSQL, Stripe]
---
# Need an AI app: upload a photo → get a weekly verdict «progress / no progress» and advice on when to retake the photo.

## Phase 0: Scaffold

- [ ] Read the source at `` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/208-need-an-ai-app-upload-a-photo-get-a-week/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: React Native, Python, FastAPI, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Greece`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Greece.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Vision model for lighting-robust comparison
- [ ] iOS app with camera capture and reference upload
- [ ] Verdict generation with confidence score
- [ ] Adaptive reminder engine
- [ ] Mental-health-safe verdict phrasing (review pass)
- [ ] End-to-end test on 50 photo pairs
- [ ] Privacy policy and photo retention rules
- [ ] First 100 users in private beta

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 208- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
