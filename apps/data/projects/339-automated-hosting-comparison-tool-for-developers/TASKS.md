---
id: "339"
slug: automated-hosting-comparison-tool-for-developers
title: Automated hosting comparison tool for developers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/djk3np9401-automated-hosting-comparison-tool-for-de"
category: dev
date: "2025-10-29"
tags: [Dev]
country: Russia
tech: [Python (FastAPI), Puppeteer (headless Chrome) for live probes, Postgres + TimescaleDB, Telegram Bot API, React + Vite]
---
# Automated hosting comparison tool for developers

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/dev/djk3np9401-automated-hosting-comparison-tool-for-de` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/339-automated-hosting-comparison-tool-for-de/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python (FastAPI), Puppeteer (headless Chrome) for live probes, Postgres + TimescaleDB, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Vendor catalog: >= 12 Russian-market hosting vendors with RUB pricing
- [ ] Config selector: vCPU, RAM, storage, bandwidth, OS, region, support tier
- [ ] Daily price/capability ingest from public pricing pages with anomaly flag
- [ ] Live HTTP probe from Moscow vantage, 3-run average, rate-limited per user
- [ ] Ranking view: effective price, latency, SLA, support tier; CSV export
- [ ] Telegram bot: short config string in chat returns ranked list
- [ ] End-to-end pilot with 50 Russian developers across 4 weeks, ranked-list feedback weekly

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python (FastAPI), Puppeteer (headless Chrome) for live probes, Postgres + TimescaleDB) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 339-automated-hosting-comparison-tool-f MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python (FastAPI), Puppeteer (headless Chrome) for live probes, Postgres + TimescaleDB errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
