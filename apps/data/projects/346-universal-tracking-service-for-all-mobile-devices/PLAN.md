---
id: "346"
slug: universal-tracking-service-for-all-mobile-devices
title: Universal tracking service for all mobile devices
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/kiv6i361e1-universal-tracking-service-for-all-mobil"
category: other
date: "2025-10-29"
tags: [Other]
country: Russia
tech: [React Native (background service), Native iOS (Significant Location Change) + Android (Fused Location Provider), Apple Push + FCM, Postgres + TimescaleDB, Telegram Bot API]
---
# Universal tracking service for all mobile devices

## Tech Stack

- React Native (background service)
- Native iOS (Significant Location Change) + Android (Fused Location Provider)
- Apple Push + FCM
- Postgres + TimescaleDB
- Telegram Bot API

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for other runs as a single backend service on the stack (React Native (background service), Native iOS (Significant Location Change) + Android (Fused Location Provider), Apple Push + FCM) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/other/kiv6i361e1-universal-tracking-service-for-all-m` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Russia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (React Native (background service), Native iOS (Significant Location Change) + Android (Fused Location Provider), Apple Push + FCM) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Russia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/other/kiv6i361e1-universal-tracking-service-for-all-m`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`346-universal-tracking-service-for-all-`), pin dependencies for React Native (background service), Native iOS (Significant Location Change) + Android (Fused Location Provider), Apple Push + FCM, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/other/kiv6i361e1-universal-tracking-service-for-all-m` with no feature creep. A single user from Russia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Russia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Russia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **iOS background restrictions.** Apple tightening background location at every OS release; we track Significant Location Change as the power-efficient path.
- **Battery drain accusations.** A user blaming battery on the app will uninstall; the 5%/day ceiling is enforced client-side with a soft warning.
- **Privacy and abuse vectors.** Real-time tracking of a person without consent is a criminal offence; the consent flow must be one-way (account owner cannot silently add a person's device without that person's accept).
