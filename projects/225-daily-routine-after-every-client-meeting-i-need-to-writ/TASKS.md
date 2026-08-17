---
id: "225"
slug: daily-routine-after-every-client-meeting-i-need-to-writ
title: "Daily routine: after every client meeting, I need to write a structured report for colleagues. Existing tools are slow, opinionated, or forget the context."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: productivity
date: "2026-02-10"
tags: [Productivity, AI, Meetings]
country: UK
tech: [Python, FastAPI, Whisper, Claude API, PostgreSQL, Next.js]
---
# Daily routine: after every client meeting, I need to write a structured report for colleagues. Existing tools are slow, opinionated, or forget the context.

## Phase 0: Scaffold

- [ ] Read the source at `` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/225-daily-routine-after-every-client-meeting/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, FastAPI, Whisper, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: UK`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for UK.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Meeting transcript upload
- [ ] Whisper for live transcription
- [ ] Single template per client
- [ ] Multi-template support
- [ ] Per-colleague style preference
- [ ] 60-second review UI
- [ ] Per-tenant memory isolation
- [ ] First 100 users in pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 225- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
