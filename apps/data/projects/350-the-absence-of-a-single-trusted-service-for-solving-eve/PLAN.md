---
id: "350"
slug: the-absence-of-a-single-trusted-service-for-solving-eve
title: The absence of a single trusted service for solving everyday tasks
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/c371yg3cu1-the-absence-of-a-single-trusted-service"
category: freelance
date: "2025-10-29"
tags: [Freelance]
country: Russia
tech: [Next.js + mobile (React Native), Postgres, Stripe Connect / YuKassa, Telegram Bot API, Identity verification via Gosuslugi integration]
---
# The absence of a single trusted service for solving everyday tasks

## Tech Stack

- Next.js + mobile (React Native)
- Postgres
- Stripe Connect / YuKassa
- Telegram Bot API
- Identity verification via Gosuslugi integration

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for freelance runs as a single backend service on the stack (Next.js + mobile (React Native), Postgres, Stripe Connect / YuKassa) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/freelance/c371yg3cu1-the-absence-of-a-single-trusted-` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Russia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Next.js + mobile (React Native), Postgres, Stripe Connect / YuKassa) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Russia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/freelance/c371yg3cu1-the-absence-of-a-single-trusted-`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`350-the-absence-of-a-single-trusted-ser`), pin dependencies for Next.js + mobile (React Native), Postgres, Stripe Connect / YuKassa, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/freelance/c371yg3cu1-the-absence-of-a-single-trusted-` with no feature creep. A single user from Russia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Russia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Russia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **ID-verification depth.** Gosuslugi integration depth varies by access tier; a manual passport-review fallback is mandatory and adds reviewer load.
- **Insurance claims.** A claim under the per-task policy is a real liability; the moderator team and the insurer have a joint runbook.
- **Two-sided trust churn.** A bad tasker or a bad poster poisons the other side of the market; two-sided rating + suspension policy is enforced.
