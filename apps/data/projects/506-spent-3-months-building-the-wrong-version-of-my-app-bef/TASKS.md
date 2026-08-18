---
id: "506"
slug: spent-3-months-building-the-wrong-version-of-my-app-bef
title: Spent 3 months building the wrong version of my app before realizing the actual insight
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnybs6/spent_3_months_building_the_wrong_version_of_my/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# Spent 3 months building the wrong version of my app before realizing the actual insight

## Phase 0: Scaffold

- [ ] Read the source at `https://www.reddit.com/r/SideProject/comments/1vnybs6/spent_3_months_building_the_wrong_version_of_my/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/506-spent-3-months-building-the-wrong-versio/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, TypeScript, PostgreSQL, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: the country stated in the source`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for the country stated in the source.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Pre-build questionnaire
- [ ] Comparison view
- [ ] Restart playbook generator
- [ ] Stripe premium

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 506-spent-3-months-building-the-wrong-v MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
