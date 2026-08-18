---
id: "482"
slug: i-built-an-app-to-filter-noise-from-tech-blogs-and-surf
title: I built an app to filter noise from tech blogs and surface 6 quality engineering reads every day. How do I get more users?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vfju24/i_built_an_app_to_filter_noise_from_tech_blogs/"
category: indiehackers
date: "2026-08-04"
tech: [Next.js, TypeScript, RSS aggregation, PostgreSQL, Resend, Stripe, Vercel]
---
# I built an app to filter noise from tech blogs and surface 6 quality engineering reads every day. How do I get more users?

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/482-i-built-an-app-to-filter-noise-from-tech-blogs-and-surf/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] RSS ingestion
- [ ] Daily digest of 6
- [ ] Email + web delivery
- [ ] Stripe premium

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, RSS aggregation) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 482-i-built-an-app-to-filter-noise-from MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, RSS aggregation errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
