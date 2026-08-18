---
id: "203"
slug: real-working-conditions-cant-be-verified-before-taking-
title: "Real working conditions can't be verified before taking a job — reviews lie. Need a service for direct, anonymous, verified reports from current employees."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: hr
date: "2026-04-24"
tags: [HR, Trust, Marketplace]
country: UK
tech: [Python, Django, PostgreSQL, Redis, Vue.js, Stripe]
---
# Real working conditions can't be verified before taking a job — reviews lie. Need a service for direct, anonymous, verified reports from current employees.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/203-real-working-conditions-can-t-be-verifie/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, Django, PostgreSQL, and confirm versions resolve in CI.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: UK`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for UK.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Payslip verification challenge (HMRC-style token, no PII)
- [ ] Structured report form with 30 fields
- [ ] Company page with aggregate report
- [ ] Report counter for transparency (e.g. 47 reports filed, 0 disputed)
- [ ] Public company dispute mechanism
- [ ] Stripe integration for one-time credits
- [ ] GDPR data export and deletion flows
- [ ] First 100 companies onboarded with at least 1 report each

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, Django, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 203-real-working-conditions-can-t-be-ve MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in UK completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, Django, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
