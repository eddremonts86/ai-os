---
id: "229"
slug: a-telegram-channel-owner-is-losing-their-audience-witho
title: A Telegram channel owner is losing their audience without understanding the reasons for unsubscriptions. No analytics service explains what content is turning subscribers away.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: analytics
date: "2026-01-29"
tags: [Analytics, Telegram, Creator]
country: Georgia
tech: [Python, FastAPI, PostgreSQL, Redis, Telegram Bot API, Next.js]
---
# A Telegram channel owner is losing their audience without understanding the reasons for unsubscriptions. No analytics service explains what content is turning subscribers away.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/229-a-telegram-channel-owner-is-losing-their/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, FastAPI, PostgreSQL, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Georgia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Georgia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Telegram bot opt-in
- [ ] Per-post retention tracking
- [ ] Topic extraction from post content
- [ ] Topic-level diagnosis (retain vs lose)
- [ ] Weekly report via bot
- [ ] Web dashboard with deep view
- [ ] Russian-language UI
- [ ] First 100 channels in pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, FastAPI, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 229-a-telegram-channel-owner-is-losing- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Georgia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, FastAPI, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
