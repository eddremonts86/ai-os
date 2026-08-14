---
id: "468"
slug: "5-months-in-49-downloads-0-paying-customers-heres-what-"
title: "5 months in, 49 downloads, 0 paying customers. Here's what changed since the last update."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vlig4g/5_months_in_49_downloads_0_paying_customers_heres/"
category: indiehackers
date: "2026-08-11"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# 5 months in, 49 downloads, 0 paying customers. Here's what changed since the last update.

## Phase 0: Scaffold

- [ ] Read the source at `https://www.reddit.com/r/indiehackers/comments/1vlig4g/5_months_in_49_downloads_0_paying_customers_heres/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/468-5-months-in-49-downloads-0-paying-custom/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, TypeScript, PostgreSQL, and confirm versions resolve in CI.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: the country stated in the source`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for the country stated in the source.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Post-mortem template
- [ ] Side-by-side comparison
- [ ] Public log (moderated)
- [ ] Stripe paid tier

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 468-5-months-in-49-downloads-0-paying-c MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
