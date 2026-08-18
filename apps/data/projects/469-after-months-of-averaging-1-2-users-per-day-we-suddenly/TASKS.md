---
id: "469"
slug: after-months-of-averaging-1-2-users-per-day-we-suddenly
title: "After months of averaging 1-2 users per day, we suddenly got 400+ users"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vkfimr/after_months_of_averaging_12_users_per_day_we/"
category: indiehackers
date: "2026-08-10"
tech: [Next.js, TypeScript, PostgreSQL, PostHog, Stripe, Resend, Vercel]
---
# After months of averaging 1-2 users per day, we suddenly got 400+ users

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/469-after-months-of-averaging-1-2-users-per-day-we-suddenly/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Daily traffic log
- [ ] Spike detector
- [ ] What-changed journal
- [ ] Stripe paid tier

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 469-after-months-of-averaging-1-2-users MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
