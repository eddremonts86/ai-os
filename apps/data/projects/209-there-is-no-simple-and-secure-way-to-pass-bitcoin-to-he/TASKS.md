---
id: "209"
slug: there-is-no-simple-and-secure-way-to-pass-bitcoin-to-he
title: "There is no simple and secure way to pass bitcoin to heirs in the event of sudden death. Without complex multisig, heirs lose access forever."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: fintech
date: "2026-03-29"
tags: [Fintech, Crypto, Inheritance]
country: Colombia
tech: [Rust, Bitcoin Core, Nostr, PostgreSQL, Next.js, Tor]
---
# There is no simple and secure way to pass bitcoin to heirs in the event of sudden death. Without complex multisig, heirs lose access forever.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/209-there-is-no-simple-and-secure-way-to-pas/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Rust, Bitcoin Core, Nostr, and confirm versions resolve in CI.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Colombia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Colombia.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Local Rust tool for sharded, encrypted recovery package
- [ ] Nostr-based heartbeat channel
- [ ] On-chain inactivity oracle
- [ ] Multi-day warning flow before release
- [ ] Heir verification (ID, video, notarised death certificate)
- [ ] Shard release with cryptographic audit trail
- [ ] User and heir dashboards
- [ ] End-to-end test including a real-world pilot
- [ ] First 20 bitcoin-holders in pilot across 3 countries

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Rust, Bitcoin Core, Nostr) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 209-there-is-no-simple-and-secure-way-t MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Colombia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Rust, Bitcoin Core, Nostr errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
