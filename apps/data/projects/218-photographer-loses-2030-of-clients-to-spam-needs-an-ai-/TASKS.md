---
id: "218"
slug: photographer-loses-2030-of-clients-to-spam-needs-an-ai-
title: "Photographer loses 20–30% of clients to spam — needs an AI clone with a copy of her voice to answer and book or deflect."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: ai
date: "2026-03-03"
tags: [AI, Voice, Photography]
country: Russia
tech: [Python, FastAPI, Twilio, ElevenLabs, PostgreSQL, Cal.com]
---
# Photographer loses 20–30% of clients to spam — needs an AI clone with a copy of her voice to answer and book or deflect.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/218-photographer-loses-20-30-of-clients-to-s/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, FastAPI, Twilio, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Voice-clone training pipeline for Russian
- [ ] Twilio-based call answering
- [ ] Qualification script (date, venue, package, budget)
- [ ] Spam deflection logic
- [ ] Cal.com booking integration
- [ ] Missed-call SMS follow-up
- [ ] Per-photographer dashboard with call log
- [ ] First 20 photographers in pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, FastAPI, Twilio) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 218-photographer-loses-20-30-of-clients MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, FastAPI, Twilio errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
