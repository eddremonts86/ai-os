---
id: "214"
slug: "5-partners-5-different-cv-templates-managers-spend-2040"
title: "5 partners — 5 different CV templates. Managers spend 20–40 minutes on each adaptation, up to 15 times a month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: hr
date: "2026-03-13"
tags: [HR, Productivity, Recruiting]
country: Russia
tech: [Python, FastAPI, PostgreSQL, Vue.js, docx, Playwright]
---
# 5 partners — 5 different CV templates. Managers spend 20–40 minutes on each adaptation, up to 15 times a month.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/214-5-partners-5-different-cv-templates-mana/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, FastAPI, PostgreSQL, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Canonical CV intake (PDF, DOCX, or structured form)
- [ ] Template engine with 5 partner templates
- [ ] Per-partner variant generation
- [ ] One-page human review per candidate
- [ ] Output (PDF, DOCX) per partner
- [ ] Template editor for adding a 6th partner
- [ ] Audit log per submission
- [ ] First 30 recruiting teams in pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, FastAPI, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 214-5-partners-5-different-cv-templates MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, FastAPI, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
