---
id: "231"
slug: website-owners-constantly-need-minor-edits-in-the-admin
title: Website owners constantly need minor edits in the admin panel. They are forced to pay specialists for 5-minute changes. Need an AI that resolves those edits in plain English.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: ai
date: "2026-01-28"
tags: [AI, Web, CMS]
country: USA
tech: [Python, FastAPI, Claude API, PostgreSQL, React, WordPress]
---
# Website owners constantly need minor edits in the admin panel. They are forced to pay specialists for 5-minute changes. Need an AI that resolves those edits in plain English.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/231-website-owners-constantly-need-minor-edi/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, FastAPI, Claude API, and confirm versions resolve in CI.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: USA`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for USA.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] WordPress REST API integration
- [ ] Plain-English intent interpretation
- [ ] Before/after preview
- [ ] One-click approval
- [ ] Audit log per edit
- [ ] Role-permission respect
- [ ] Webflow and Shopify in v2
- [ ] First 100 users in pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, FastAPI, Claude API) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 231-website-owners-constantly-need-mino MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, FastAPI, Claude API errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
