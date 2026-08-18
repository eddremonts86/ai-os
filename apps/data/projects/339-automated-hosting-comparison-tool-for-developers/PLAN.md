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

## Tech Stack

- Python (FastAPI)
- Puppeteer (headless Chrome) for live probes
- Postgres + TimescaleDB
- Telegram Bot API
- React + Vite

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for dev runs as a single backend service on the stack (Python (FastAPI), Puppeteer (headless Chrome) for live probes, Postgres + TimescaleDB) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/dev/djk3np9401-automated-hosting-comparison-tool-for-` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Russia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Python (FastAPI), Puppeteer (headless Chrome) for live probes, Postgres + TimescaleDB) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Russia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/dev/djk3np9401-automated-hosting-comparison-tool-for-`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`339-automated-hosting-comparison-tool-f`), pin dependencies for Python (FastAPI), Puppeteer (headless Chrome) for live probes, Postgres + TimescaleDB, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/dev/djk3np9401-automated-hosting-comparison-tool-for-` with no feature creep. A single user from Russia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Russia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Russia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Pricing page parsing fragility.** A vendor redesign breaks parsing; alerts to a maintainer with a fallback to a hosted JSON feed per vendor where available.
- **Probe fairness.** Cold-start latency varies wildly; the tool runs warm-up probes and shows the median, not the first.
- **Affiliate temptation.** If rankings silently favour a paying vendor, trust dies; the ranking rule is open and the commercial relationship is disclosed in a footer.
