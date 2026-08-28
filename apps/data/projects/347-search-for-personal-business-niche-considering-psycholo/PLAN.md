---
id: "347"
slug: search-for-personal-business-niche-considering-psycholo
title: Search for personal business niche considering psychological barriers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/psychology/u4o11i24f1-search-for-personal-business-niche-consi"
category: psychology
date: "2025-10-29"
tags: [Psychology]
country: Russia
tech: [Next.js, OpenAI API, Postgres, Stripe / YuKassa, PDF export (react-pdf)]
---
# Search for personal business niche considering psychological barriers

## Tech Stack

- Next.js
- OpenAI API
- Postgres
- Stripe / YuKassa
- PDF export (react-pdf)

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for psychology runs as a single backend service on the stack (Next.js, OpenAI API, Postgres) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/psychology/u4o11i24f1-search-for-personal-business-ni` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Russia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Next.js, OpenAI API, Postgres) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Russia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/psychology/u4o11i24f1-search-for-personal-business-ni`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`347-search-for-personal-business-niche-`), pin dependencies for Next.js, OpenAI API, Postgres, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/psychology/u4o11i24f1-search-for-personal-business-ni` with no feature creep. A single user from Russia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Russia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Russia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Clinical-advice liability.** Impostor syndrome is a clinical sign in some contexts; the disclaimer must be visible without burying the decision-aid value.
- **Profile-instrument validity.** A self-report instrument is a risk; the 12-question set is based on established short scales (Clance IPES + Frost MPS-short) but the user data never trains the model.
- **Personalisation overreach.** Mapping a niche to a single barrier is reductionist; the output is a 'most likely' label, not a diagnosis.
