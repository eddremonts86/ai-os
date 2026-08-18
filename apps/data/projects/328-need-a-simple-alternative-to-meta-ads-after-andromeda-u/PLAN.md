---
id: "328"
slug: need-a-simple-alternative-to-meta-ads-after-andromeda-u
title: Need a simple alternative to Meta Ads after Andromeda update
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/8xk7k4gx31-need-a-simple-alternative-to-meta-ads-af"
category: marketing
date: "2025-10-29"
tags: [Marketing]
country: USA
tech: [Meta Marketing API, Google Ads API, TikTok Ads API, Postgres on Fly.io, Plausible Analytics]
---
# Need a simple alternative to Meta Ads after Andromeda update

## Tech Stack

- Meta Marketing API
- Google Ads API
- TikTok Ads API
- Postgres on Fly.io
- Plausible Analytics

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for marketing runs as a single backend service on the stack (Meta Marketing API, Google Ads API, TikTok Ads API) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/marketing/8xk7k4gx31-need-a-simple-alternative-to-met` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in USA, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Meta Marketing API, Google Ads API, TikTok Ads API) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For USA, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/marketing/8xk7k4gx31-need-a-simple-alternative-to-met`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`328-need-a-simple-alternative-to-meta-a`), pin dependencies for Meta Marketing API, Google Ads API, TikTok Ads API, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/marketing/8xk7k4gx31-need-a-simple-alternative-to-met` with no feature creep. A single user from USA can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for USA, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from USA test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Platform API churn.** Meta, Google and TikTok all change their Marketing APIs; each change is a forced re-test.
- **Andromeda spillover.** Meta's update is not over; ranking signals may keep shifting, so the orchestrator must surface 'CPA movement' as a first-class event.
- **Attribution drift.** Cross-platform reporting double-counts conversions unless a dedupe key is enforced at ingest.
