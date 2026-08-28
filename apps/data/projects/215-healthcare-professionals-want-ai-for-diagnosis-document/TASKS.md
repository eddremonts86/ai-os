---
id: "215"
slug: healthcare-professionals-want-ai-for-diagnosis-document
title: "Healthcare professionals want AI for diagnosis, documentation, and patient care — but training doesn't prepare them and no existing tool is built for their workflow."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: health
date: "2026-03-12"
tags: [Health, AI, Documentation]
country: Brazil
tech: [Python, FastAPI, PostgreSQL, Whisper, Claude API, Vue.js]
---
# Healthcare professionals want AI for diagnosis, documentation, and patient care — but training doesn't prepare them and no existing tool is built for their workflow.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/215-healthcare-professionals-want-ai-for-dia/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, FastAPI, PostgreSQL, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Brazil`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Brazil.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Portuguese voice-to-text with Whisper fine-tune
- [ ] SOAP draft generator with clinician review
- [ ] ANVISA drug reference lookup
- [ ] Differential diagnosis suggestion engine
- [ ] Patient summary generator
- [ ] LGPD-compliant Brazilian-local storage
- [ ] Audit log per clinician of accepted/ignored
- [ ] First 100 clinicians in pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, FastAPI, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 215-healthcare-professionals-want-ai-fo MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Brazil completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, FastAPI, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
