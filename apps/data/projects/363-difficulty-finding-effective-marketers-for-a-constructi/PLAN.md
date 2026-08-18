---
id: "363"
slug: difficulty-finding-effective-marketers-for-a-constructi
title: Difficulty finding effective marketers for a construction business
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/hc75uckma1-difficulty-finding-effective-marketers-f"
category: freelance
date: "2025-10-29"
tags: [Freelance, Marketing]
country: Russia
tech: [Next.js, Postgres, Yandex Direct API + VK Ads API, Yandex.Metrica + call-tracking (Calltouch / Callibri) integration, Stripe / YuKassa]
---
# Difficulty finding effective marketers for a construction business

## Tech Stack

- Next.js
- Postgres
- Yandex Direct API + VK Ads API
- Yandex.Metrica + call-tracking (Calltouch / Callibri) integration
- Stripe / YuKassa

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for freelance runs as a single backend service on the stack (Next.js, Postgres, Yandex Direct API + VK Ads API) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/freelance/hc75uckma1-difficulty-finding-effective-mar` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Russia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Next.js, Postgres, Yandex Direct API + VK Ads API) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Russia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/freelance/hc75uckma1-difficulty-finding-effective-mar`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`363-difficulty-finding-effective-market`), pin dependencies for Next.js, Postgres, Yandex Direct API + VK Ads API, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/freelance/hc75uckma1-difficulty-finding-effective-mar` with no feature creep. A single user from Russia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Russia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Russia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Construction-cycle seasonality.** A marketer hired in winter may underperform for season reasons; the cost-per-lead cap is interpreted with a seasonal override flag.
- **Call-tracking attribution drift.** A call that comes in months later is hard to attribute; the attribution window is bounded (90 days) and clearly documented.
- **Marketer quality variability.** A great marketer on a bad fit produces a bad campaign; the platform offers a 'swap' inside the first 30 days with a credit.
