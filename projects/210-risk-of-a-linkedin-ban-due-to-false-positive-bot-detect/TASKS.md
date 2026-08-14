---
id: "210"
slug: risk-of-a-linkedin-ban-due-to-false-positive-bot-detect
title: Risk of a LinkedIn ban due to false positive bot detection. Official support is unhelpful. Need a tool that produces human-readable audit trails and warning signals before the ban.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: productivity
date: "2026-03-26"
tags: [Productivity, Risk, LinkedIn]
country: UK
tech: [Python, Playwright, SQLite, Next.js, Webhook]
---
# Risk of a LinkedIn ban due to false positive bot detection. Official support is unhelpful. Need a tool that produces human-readable audit trails and warning signals before the ban.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/210-risk-of-a-linkedin-ban-due-to-false-posi/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, Playwright, SQLite, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: UK`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for UK.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Browser extension recording LinkedIn actions
- [ ] Rate-of-fire analysis with rolling window
- [ ] Heuristic risk score
- [ ] Daily summary email with trend
- [ ] Signed JSON export of audit log
- [ ] CSV export for human review
- [ ] First 100 paying users in pilot
- [ ] Public launch with 'no automation' stance

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, Playwright, SQLite) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 210-risk-of-a-linkedin-ban-due-to-false MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in UK completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, Playwright, SQLite errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
