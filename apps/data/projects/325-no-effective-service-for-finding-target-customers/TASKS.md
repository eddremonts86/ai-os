---
id: "325"
slug: no-effective-service-for-finding-target-customers
title: No effective service for finding target customers
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/8bz4qkj921-no-effective-service-for-finding-target-custo"
category: marketing
date: "2025-10-29"
tags: [Marketing, Sales, Business]
country: Russia
tech: [Next.js 14, TypeScript, Postgres + pgvector, Yandex DataLens + VK Ads + Telegram Ads adapters, OpenAI API, YooKassa]
---
# No effective service for finding target customers

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/no-effective-service-for-finding-target-customers/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Customer profile intake: industry, role, region, budget.
- [ ] Channel-mix recommender: Yandex Direct, VK Ads, Telegram Ads, Avito, Dzen with weighted output.
- [ ] Campaign-asset generation: per-platform templates + OpenAI Russian prompts.
- [ ] Budget allocator with expected reach per channel + per-channel spend caps.
- [ ] Yandex Direct API adapter for campaign asset upload + performance.
- [ ] VK Ads API adapter for the same.
- [ ] Telegram Ads API adapter for the same.
- [ ] Avito API adapter for listings + performance.
- [ ] Dzen API adapter for articles + performance.
- [ ] Performance dashboard with per-channel metrics + CPA delta vs baseline.
- [ ] Pilot with 50 Russian SMBs; measure CPA delta and time-to-first-campaign at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres + pgvector) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 325-no-effective-service-for-finding-ta MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres + pgvector errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
