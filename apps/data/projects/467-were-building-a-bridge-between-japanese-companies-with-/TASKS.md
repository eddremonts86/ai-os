---
id: "467"
slug: were-building-a-bridge-between-japanese-companies-with-
title: "We're building a bridge between Japanese companies with an engineering shortage and engineers abroad who want short paid projects. Early, and I'd like the holes poked in it."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vmx4o9/were_building_a_bridge_between_japanese_companies/"
category: indiehackers
date: "2026-08-13"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# We're building a bridge between Japanese companies with an engineering shortage and engineers abroad who want short paid projects. Early, and I'd like the holes poked in it.

## Phase 0: Scaffold

- [ ] Read the source at `https://www.reddit.com/r/indiehackers/comments/1vmx4o9/were_building_a_bridge_between_japanese_companies/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/467-we-re-building-a-bridge-between-japanese/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, TypeScript, PostgreSQL, and confirm versions resolve in CI.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: the country stated in the source`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for the country stated in the source.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Company + role listings
- [ ] Candidate intake
- [ ] Match flow
- [ ] Visa info per role

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 467-we-re-building-a-bridge-between-jap MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
