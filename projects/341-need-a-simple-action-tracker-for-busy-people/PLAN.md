---
id: "341"
slug: need-a-simple-action-tracker-for-busy-people
title: Need a simple action tracker for busy people
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/productivity/bngxaaugn1-need-a-simple-action-tracker-for-busy-pe"
category: productivity
date: "2025-10-29"
tags: [Productivity]
country: UAE
tech: [SwiftUI (iOS-first), CloudKit (private DB), Shortcuts integration, Apple Watch (Complications), RevenueCat]
---
# Need a simple action tracker for busy people

## Tech Stack

- SwiftUI (iOS-first)
- CloudKit (private DB)
- Shortcuts integration
- Apple Watch (Complications)
- RevenueCat

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for productivity runs as a single backend service on the stack (SwiftUI (iOS-first), CloudKit (private DB), Shortcuts integration) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/productivity/bngxaaugn1-need-a-simple-action-tracker-` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in UAE, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (SwiftUI (iOS-first), CloudKit (private DB), Shortcuts integration) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For UAE, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/productivity/bngxaaugn1-need-a-simple-action-tracker-`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`341-need-a-simple-action-tracker-for-bu`), pin dependencies for SwiftUI (iOS-first), CloudKit (private DB), Shortcuts integration, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/productivity/bngxaaugn1-need-a-simple-action-tracker-` with no feature creep. A single user from UAE can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for UAE, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from UAE test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Watch connectivity assumptions.** The simple path must work without the iPhone present, which constrains sync.
- **Feature creep.** The single-screen simplicity is the value; every new project hierarchy breaks the 5-second brief.
- **Pricing model friction.** A UAE user may expect freemium; the one-time-purchase model must be on the paywall screen, not in T&Cs.
