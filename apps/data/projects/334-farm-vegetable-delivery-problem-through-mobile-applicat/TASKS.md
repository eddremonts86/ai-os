---
id: "334"
slug: farm-vegetable-delivery-problem-through-mobile-applicat
title: Farm vegetable delivery problem through mobile application
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/retail/mnvzelo5i1-farm-vegetable-delivery-problem-through"
category: retail
date: "2025-10-29"
tags: [Retail, Logistics, Food, Other]
country: Japan
tech: [Flutter (Android+iOS), Firebase Firestore, Stripe Japan, Japan Post Yu-Pack API, Cloud Functions]
---
# Farm vegetable delivery problem through mobile application

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/retail/mnvzelo5i1-farm-vegetable-delivery-problem-through` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/334-farm-vegetable-delivery-problem-through-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Flutter (Android+iOS), Firebase Firestore, Stripe Japan, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Japan`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Japan.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
## Phase 1: Core

- [ ] Farmer dashboard (Flutter): harvest forecast, weekly box, price, pause/resume
- [ ] Subscriber app (Flutter): weekly box preview, subscribe, pause, skip, payment
- [ ] Stripe Japan integration: card + convenience-store payments on subscription
- [ ] Yu-Pack pack-slip generator with tracking sticker
- [ ] One-tap dispatch from farmer's phone, returns tracking number to subscriber app
- [ ] Subscriber notifications: shipped, ETA, contents, partial-box message
- [ ] Pilot with 3 farms and 30 subscribers each over a full 12-week subscription cycle

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Flutter (Android+iOS), Firebase Firestore, Stripe Japan) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 334-farm-vegetable-delivery-problem-thr MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Japan completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Flutter (Android+iOS), Firebase Firestore, Stripe Japan errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
