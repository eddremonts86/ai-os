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

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/legal/0i3lmdtm71-systemic-problem-of-unenforceable-contra` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/361-systemic-problem-of-unenforceable-contra/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, Postgres, CryptoPro CSP e-signature, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] 12 commercial contract templates (Civil-Code-aware clauses)
- [ ] Performance-deadline + penalty clause blocks, customer-editable, non-mandatory defaults flagged
- [ ] CryptoPro CSP e-signature on the final document
- [ ] Online arbitration flow: file -> response -> arbitrator -> hearing -> award
- [ ] 30-60 day SLA for arbitration on claims < RUB 5m
- [ ] Enforcement paperwork for Russian commercial court
- [ ] Pilot with 30 Russian SMEs across 12 months; dispute-time tracked

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, Postgres, CryptoPro CSP e-signature) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 361-systemic-problem-of-unenforceable-c MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, Postgres, CryptoPro CSP e-signature errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
