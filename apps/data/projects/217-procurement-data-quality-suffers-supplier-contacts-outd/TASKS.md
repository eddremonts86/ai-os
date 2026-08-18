---
id: "217"
slug: procurement-data-quality-suffers-supplier-contacts-outd
title: "Procurement data quality suffers — supplier contacts outdated, prices stale, history lost. Existing tools are slow, expensive, or built for the wrong region."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: b2b
date: "2026-03-10"
tags: [B2B, Procurement, Data]
country: Brazil
tech: [Python, FastAPI, PostgreSQL, Redis, Playwright, Next.js]
---
# Procurement data quality suffers — supplier contacts outdated, prices stale, history lost. Existing tools are slow, expensive, or built for the wrong region.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/217-procurement-data-quality-suffers-supplie/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, FastAPI, PostgreSQL, and confirm versions resolve in CI.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Brazil`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Brazil.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Spreadsheet import (CSV, XLSX)
- [ ] Supplier enrichment with audits per row
- [ ] Web dashboard with list view
- [ ] Per-supplier page with contact and price history
- [ ] Weekly refresh job with robots.txt respect
- [ ] Decision history entries per supplier
- [ ] Per-tenant data isolation
- [ ] First 100 procurement teams in pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, FastAPI, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 217-procurement-data-quality-suffers-su MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Brazil completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, FastAPI, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
