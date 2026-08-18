---
id: "361"
slug: systemic-problem-of-unenforceable-contracts-and-slow-di
title: Systemic problem of unenforceable contracts and slow dispute resolution
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/legal/0i3lmdtm71-systemic-problem-of-unenforceable-contra"
category: legal
date: "2025-10-29"
tags: [Legal]
country: Russia
tech: [Next.js, Postgres, CryptoPro CSP e-signature, PDF generation, Russian arbitration court e-filing API]
---
# Systemic problem of unenforceable contracts and slow dispute resolution

## Tech Stack

- Next.js
- Postgres
- CryptoPro CSP e-signature
- PDF generation
- Russian arbitration court e-filing API

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for legal runs as a single backend service on the stack (Next.js, Postgres, CryptoPro CSP e-signature) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/legal/0i3lmdtm71-systemic-problem-of-unenforceable-co` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Russia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Next.js, Postgres, CryptoPro CSP e-signature) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Russia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/legal/0i3lmdtm71-systemic-problem-of-unenforceable-co`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`361-systemic-problem-of-unenforceable-c`), pin dependencies for Next.js, Postgres, CryptoPro CSP e-signature, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/legal/0i3lmdtm71-systemic-problem-of-unenforceable-co` with no feature creep. A single user from Russia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Russia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Russia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Arbitrator quality.** A bad arbitrator poisons the panel; a published per-arbitrator satisfaction metric and a rotation policy are mandatory.
- **Enforcement externalities.** An award that lacks a basis or is poorly reasoned will not be enforced; reasoning templates must be Civil-Code-aware.
- **Counterparty consent.** A contract must opt in to the platform's arbitration; retroactive opt-in for existing contracts is a non-trivial legal path that v1 leaves to the customer.
