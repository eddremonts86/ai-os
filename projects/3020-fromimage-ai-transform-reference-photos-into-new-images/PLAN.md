---
id: "3020"
slug: fromimage-ai-transform-reference-photos-into-new-images
title: FromImage AI – Transform reference photos into new images with controllable edits
status: enriched
source:
  name: manual
  url: "https://betalist.com/startups/fromimage-ai?utm_campaign=startup-182635&amp;utm_medium=atom&amp;utm_source=newsfeed"
category: beta
date: "2026-08-18"
tags: [BetaList, Beta, Product]
---
# FromImage AI – Transform reference photos into new images with controllable edits

## Tech Stack

- **Web frontend:** React + TypeScript with a custom canvas view (Konva or Pixi) so the user can paint a keep / modify mask on the reference photo and see the source and the latest generation side by side.
- **Backend API:** Node.js with Fastify, exposing endpoints for upload, generate, refund, and credit operations; the model adapter is a thin module so a new model is one file.
- **Model gateway:** A pluggable adapter layer that talks to third-party image-to-image and text-to-image providers; the first release ships with one image-to-image adapter and one text-to-image adapter, matching the MVP scope.
- **Database:** PostgreSQL with Prisma for users, credit balances, generations, refund events, and subscription state — credit arithmetic is the source of truth for billing, so it must be transactional.
- **Storage:** S3-compatible object storage for uploaded reference images and generated outputs, with signed URLs scoped per user so generations stay private.
- **Billing:** Stripe for subscriptions and one-time credit packs, with webhook handlers that add credits to the user's balance on successful payment.

## Architecture

```
+----------------+        +-----------------+        +-----------------+
|  React web app | -----> |  Fastify API    | -----> |  Model gateway  |
|  (canvas mask  |        |  (auth, credits,|        |  (img2img +     |
|   + history)   |        |   generations)  |        |   text2img)     |
+----------------+        +--------+--------+        +--------+--------+
                                   |                          |
                          +--------v---------+       +--------v--------+
                          |  PostgreSQL      |       |  Third-party     |
                          |  (Prisma)        |       |  model providers |
                          +------------------+       +-----------------+
                                   |
                          +--------v---------+
                          |  S3-compatible   |
                          |  storage         |
                          +------------------+
```

The React app uploads a reference image to S3, posts the S3 key plus a structured keep/modify prompt to Fastify, which checks the user's credit balance, calls the model gateway, writes the result back to Postgres, and (on failure) issues a refund transaction before responding. Stripe webhooks adjust credit balances out of band so the user can buy credits without blocking the generation flow.

## Milestones

1. **M0 — Auth, credits, and pricing surface:** A user can sign up, see their credit balance, and view the pricing page with subscription and one-time-pack options before any generation lands.
2. **M1 — Upload and image-to-image pipeline:** A user uploads a reference photo, writes a structured keep/modify prompt, picks the default image-to-image model, and gets back a generated PNG in under 30 seconds on the reference model.
3. **M2 — Iteration view and canvas mask:** A side-by-side view of source and latest generation plus a canvas-based keep/modify mask so the user can tighten instructions across iterations without re-typing prompts.
4. **M3 — Text-to-image tab:** A separate tab that creates images from scratch with the second model adapter, sharing the same credit system and refund policy.
5. **M4 — Refund and watermark policy:** A clear failure-detection path that refunds the credit automatically and writes a refund event to the user's history, plus a watermark only on free-tier generations.
6. **M5 — Stripe integration:** Subscription plans and one-time packs wired to Stripe webhooks with credit-balance updates and a billing portal link.

## Risks

- **Third-party model API downtime** — a generation that times out still costs the user a credit unless the refund path fires. Mitigation: an explicit timeout with a guaranteed refund and a status the user can see in their history.
- **Model output drift across iterations** — the controllable loop depends on each iteration actually responding to the keep/modify instructions. Mitigation: surface a "consistency score" between source and latest generation so the user can tell whether the model is listening.
- **Credit arithmetic bugs** — race conditions on credit balance updates can grant or lose credits incorrectly. Mitigation: do all credit writes inside Postgres transactions and reconcile against the Stripe ledger daily.
- **Abuse via repeated free-tier watermark-free generations** — if the refund path is too generous, users can farm failed generations. Mitigation: a per-user failure-rate cap and a moderation check on outputs before refund.
