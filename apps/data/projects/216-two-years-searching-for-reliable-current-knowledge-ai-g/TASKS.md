---
id: "216"
slug: two-years-searching-for-reliable-current-knowledge-ai-g
title: "Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of low-quality links. Need a trustworthy digest in the user's domain."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: ai
date: "2026-03-12"
tags: [AI, Research, Knowledge]
country: Russia
tech: [Python, FastAPI, PostgreSQL, pgvector, Claude API, Next.js]
---
# Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of low-quality links. Need a trustworthy digest in the user's domain.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/216-two-years-searching-for-reliable-current/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, FastAPI, PostgreSQL, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Source ingest per domain (RSS, APIs, curated lists)
- [ ] Credibility scoring engine with editorial signals
- [ ] Per-source embedding for retrieval
- [ ] Daily digest generation with paragraph-level citations
- [ ] User feedback on each digest item
- [ ] Drill-down from digest line to source paragraph
- [ ] Reproducibility from source state
- [ ] First 100 subscribers in pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, FastAPI, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 216-two-years-searching-for-reliable-cu MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, FastAPI, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
