---
id: "334"
slug: farm-vegetable-delivery-problem-through-mobile-applicat
title: Farm vegetable delivery problem through mobile application
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/mnvzelo5i1-farm-vegetable-delivery-problem-through"
category: retail
date: "2025-10-29"
tags: [Retail, Logistics, Food, Other]
country: Japan
tech: [Flutter (Android+iOS), Firebase Firestore, Stripe Japan, Japan Post Yu-Pack API, Cloud Functions]
---
# Farm vegetable delivery problem through mobile application

## Tech Stack

- Flutter (Android+iOS)
- Firebase Firestore
- Stripe Japan
- Japan Post Yu-Pack API
- Cloud Functions

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for retail runs as a single backend service on the stack (Flutter (Android+iOS), Firebase Firestore, Stripe Japan) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/retail/mnvzelo5i1-farm-vegetable-delivery-problem-thr` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Japan, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Flutter (Android+iOS), Firebase Firestore, Stripe Japan) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Japan, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/retail/mnvzelo5i1-farm-vegetable-delivery-problem-thr`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`334-farm-vegetable-delivery-problem-thr`), pin dependencies for Flutter (Android+iOS), Firebase Firestore, Stripe Japan, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/retail/mnvzelo5i1-farm-vegetable-delivery-problem-thr` with no feature creep. A single user from Japan can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Japan, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Japan test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Harvest volatility.** A late frost cuts the box in half; the system must support partial boxes with a clear subscriber-facing message.
- **Yu-Pack cutoff time.** Next-day delivery fails if pickup is missed; the design must include the same-day alternative (regional courier) as a v1.5 plan.
- **Subscriber concentration risk.** A single large subscriber (e.g. a company cafeteria) can distort delivery load; an order cap per subscriber is included in v1.
