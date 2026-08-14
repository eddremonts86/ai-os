---
id: "478"
slug: "2-times-top-10-and-featured-on-product-hunt-heres-how-y"
title: "2 times Top 10 and featured on Product Hunt - here's how you too can do it"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vgix9n/2_times_top_10_and_featured_on_product_hunt_heres/"
category: indiehackers
date: "2026-08-05"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# 2 times Top 10 and featured on Product Hunt - here's how you too can do it

## Phase 0: Scaffold

- [ ] Read the source at `https://www.reddit.com/r/indiehackers/comments/1vgix9n/2_times_top_10_and_featured_on_product_hunt_heres/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/478-2-times-top-10-and-featured-on-product-h/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, TypeScript, PostgreSQL, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: the country stated in the source`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for the country stated in the source.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Day-of-launch checklist
- [ ] Hunter outreach templates
- [ ] Comment-response scripts
- [ ] Stripe premium

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 478-2-times-top-10-and-featured-on-prod MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
