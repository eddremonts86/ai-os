---
id: "221"
slug: nigerias-transport-trap-uberbolt-too-expensive-okada-to
title: "Nigeria's transport trap: Uber/Bolt too expensive, okada too deadly, Danfo buses a nightmare. Millions stuck without a safe, affordable option."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: mobility
date: "2026-02-13"
tags: [Mobility, Nigeria, Marketplace]
country: Nigeria
tech: [Flutter, Node.js, PostgreSQL, Google Maps, Paystack, Firebase]
---
# Nigeria's transport trap: Uber/Bolt too expensive, okada too deadly, Danfo buses a nightmare. Millions stuck without a safe, affordable option.

## Phase 0: Scaffold

- [ ] Read the source at `` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/221-nigeria-s-transport-trap-uber-bolt-too-e/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Flutter, Node.js, PostgreSQL, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Nigeria`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Nigeria.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Flutter rider app with three vehicle classes
- [ ] Flutter driver app with onboarding and trip flow
- [ ] National-ID-based driver verification
- [ ] Paystack integration for online payments
- [ ] Cash payment flow with a clear audit trail
- [ ] Helmet enforcement for motorcycle class
- [ ] Real-time tracking via Google Maps
- [ ] First 100,000 active riders in Lagos pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 221- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
