---
id: "266"
slug: owners-of-niche-telegram-channels-lack-a-service-for-au
title: Owners of niche Telegram channels lack a service for automatically finding and organizing cross-promotion with relevant channels without spending hours on manual selection and negotiations
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/kfsnhgszj1-owners-of-niche-telegram-channels-lack-a"
category: marketing
date: "2025-12-22"
tags: [Social, AI, Other]
country: USA
tech: [Next.js 14, TypeScript, PostgreSQL, Telegram Bot API, OpenAI GPT-4o-mini, Stripe, Resend]
---
# Owners of niche Telegram channels lack a service for automatically finding and organizing cross-promotion with relevant channels without spending hours on manual selection and negotiations

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/266-owners-of-niche-telegram-channels-lack-a-service-for-au/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Telegram bot onboarding flow
- [ ] Channel-profile capture with explicit opt-in
- [ ] Postgres schema: channels, audience_overlaps, matches, swaps, attribution
- [ ] Matching engine with audience-overlap scoring
- [ ] GPT-4o-mini outreach drafting with approval gate
- [ ] Swap scheduling and tracking
- [ ] Stripe paid tier
- [ ] Subscriber-delta attribution pipeline

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 266-owners-of-niche-telegram-channels-l MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
