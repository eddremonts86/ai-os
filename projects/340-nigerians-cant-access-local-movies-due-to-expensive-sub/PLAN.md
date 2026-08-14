---
id: "340"
slug: nigerians-cant-access-local-movies-due-to-expensive-sub
title: "Nigerians can't access local movies due to expensive subscriptions and piracy"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/media/pypg9yzgy1-nigerians-cant-access-local-movies-due-t"
category: media
date: "2025-10-29"
tags: [Media, Legal]
country: Nigeria
tech: [Android-first (Kotlin + Jetpack Compose), ExoPlayer + DRM, M-Pesa / Paystack, Cloudflare R2 + Stream, Telegram bot (anti-piracy signal)]
---
# Nigerians can't access local movies due to expensive subscriptions and piracy

## Tech Stack

- Android-first (Kotlin + Jetpack Compose)
- ExoPlayer + DRM
- M-Pesa / Paystack
- Cloudflare R2 + Stream
- Telegram bot (anti-piracy signal)

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for media runs as a single backend service on the stack (Android-first (Kotlin + Jetpack Compose), ExoPlayer + DRM, M-Pesa / Paystack) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/media/pypg9yzgy1-nigerians-cant-access-local-movies-d` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Nigeria, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Android-first (Kotlin + Jetpack Compose), ExoPlayer + DRM, M-Pesa / Paystack) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Nigeria, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/media/pypg9yzgy1-nigerians-cant-access-local-movies-d`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`340-nigerians-can-t-access-local-movies`), pin dependencies for Android-first (Kotlin + Jetpack Compose), ExoPlayer + DRM, M-Pesa / Paystack, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/media/pypg9yzgy1-nigerians-cant-access-local-movies-d` with no feature creep. A single user from Nigeria can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Nigeria, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Nigeria test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Licensing breadth.** A thin catalogue at launch loses trust faster than a high price; securing 10 producer deals before public launch is the gate.
- **Mobile-data cost.** A 1-hour HD stream on 4G is expensive in Nigeria; the data-aware quality ladder is a v1 critical path.
- **Piracy driver.** If the legitimate app is still expensive relative to the pirate experience, piracy wins; the price must be matched against the data-cost on the device, not against the US dollar.
