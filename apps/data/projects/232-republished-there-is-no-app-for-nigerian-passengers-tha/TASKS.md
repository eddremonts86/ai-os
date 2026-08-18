---
id: "232"
slug: republished-there-is-no-app-for-nigerian-passengers-tha
title: "Republished: There is no app for Nigerian passengers that shows the real-time flight status and helps with transit, hotel, and the embassy line."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: travel
date: "2026-01-26"
tags: [Travel, Nigeria, Information]
country: Nigeria
tech: [Flutter, Python, FastAPI, PostgreSQL, AviationStack, Paystack]
---
# Republished: There is no app for Nigerian passengers that shows the real-time flight status and helps with transit, hotel, and the embassy line.

## Phase 0: Scaffold

- [ ] Read the source at `` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/232-republished-there-is-no-app-for-nigerian/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Flutter, Python, FastAPI, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Nigeria`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Nigeria.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Real-time flight status via AviationStack
- [ ] Visa/embassy rules curated per route
- [ ] Transit suggestion from destination airport
- [ ] Hotel option via Booking.com affiliate
- [ ] Offline cache for non-flight sections
- [ ] Per-user trip history
- [ ] Paystack integration for in-app purchases
- [ ] First 10,000 active users in pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 232- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
