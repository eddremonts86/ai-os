---
id: "347"
slug: search-for-personal-business-niche-considering-psycholo
title: Search for personal business niche considering psychological barriers
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/psychology/u4o11i24f1-search-for-personal-business-niche-consi"
category: psychology
date: "2025-10-29"
tags: [Psychology]
country: Russia
tech: [Next.js, OpenAI API, Postgres, Stripe / YuKassa, PDF export (react-pdf)]
---
# Search for personal business niche considering psychological barriers

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/psychology/u4o11i24f1-search-for-personal-business-niche-consi` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/347-search-for-personal-business-niche-consi/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, OpenAI API, Postgres, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
## Phase 1: Core

- [ ] 12-question psychological profile intake (RU + EN), with non-clinical disclaimer
- [ ] Niche candidate entry (1-3 per session) free-text
- [ ] Niche x profile mapping: top 1 psychological barrier per niche at week 1
- [ ] 7-day micro-action generator: one 15-minute action per day, calibrated to the barrier
- [ ] Weekly check-in pulse (3 questions); email + Telegram nudge
- [ ] Account-data delete request honored within 30 days (152-FZ compliance)
- [ ] Pilot with 200 Russian-speaking would-be founders, 30-day outcome self-report

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, OpenAI API, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 347-search-for-personal-business-niche- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, OpenAI API, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
