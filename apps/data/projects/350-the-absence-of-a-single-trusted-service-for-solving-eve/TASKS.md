---
id: "350"
slug: the-absence-of-a-single-trusted-service-for-solving-eve
title: The absence of a single trusted service for solving everyday tasks
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/c371yg3cu1-the-absence-of-a-single-trusted-service"
category: freelance
date: "2025-10-29"
tags: [Freelance]
country: Russia
tech: [Next.js + mobile (React Native), Postgres, Stripe Connect / YuKassa, Telegram Bot API, Identity verification via Gosuslugi integration]
---
# The absence of a single trusted service for solving everyday tasks

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/freelance/c371yg3cu1-the-absence-of-a-single-trusted-service` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/350-the-absence-of-a-single-trusted-service-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js + mobile (React Native), Postgres, Stripe Connect / YuKassa, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Provision the iOS/Android signing pipeline and confirm TestFlight/Internal Testing build distribution.
## Phase 1: Core

- [ ] Task posting flow with location, time-window, price, home-entry flag
- [ ] Tasker profile with Gosuslugi ID check + manual passport fallback
- [ ] Matching: nearest vetted tasker, first-accept wins
- [ ] Escrow via YuKassa with completion-acknowledgement release
- [ ] Per-task liability insurance (RUB 100k cap) via Russian insurer partner
- [ ] Telegram bot for posting and accepting
- [ ] Pilot in 2 RU cities, 500 tasks in 90 days

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js + mobile (React Native), Postgres, Stripe Connect / YuKassa) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 350-the-absence-of-a-single-trusted-ser MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js + mobile (React Native), Postgres, Stripe Connect / YuKassa errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
