---
id: "227"
slug: a-3-year-search-for-a-simple-tool-to-track-both-persona
title: "A 3-year search for a simple tool to track both personal and business finances in one place. Nothing matches because the reports are split, the UX is heavy, or the price is wrong."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: fintech
date: "2026-01-29"
tags: [Fintech, Personal Finance, Small Business]
country: USA
tech: [Python, FastAPI, PostgreSQL, React, Plaid, Stripe]
---
# A 3-year search for a simple tool to track both personal and business finances in one place. Nothing matches because the reports are split, the UX is heavy, or the price is wrong.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/227-a-3-year-search-for-a-simple-tool-to-tra/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, FastAPI, PostgreSQL, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: USA`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for USA.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Plaid linking for personal and business
- [ ] Two ledgers in one view
- [ ] Unified reconciliation step
- [ ] Schedule C summary
- [ ] Export to accountant format
- [ ] Per-user categories
- [ ] First 1000 users in pilot
- [ ] Public launch with we are not a tax service stance

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, FastAPI, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 227-a-3-year-search-for-a-simple-tool-t MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, FastAPI, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
