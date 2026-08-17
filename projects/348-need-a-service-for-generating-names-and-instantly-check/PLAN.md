---
id: "348"
slug: need-a-service-for-generating-names-and-instantly-check
title: Need a service for generating names and instantly checking domain availability
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/s4e5ajoj91-need-a-service-for-generating-names-and"
category: marketing
date: "2025-10-29"
tags: [Marketing]
country: Russia
tech: [Next.js, OpenAI API, Domain availability via RDAP + WHOIS, Telegram Bot API, Postgres]
---
# Need a service for generating names and instantly checking domain availability

## Tech Stack

- Next.js
- OpenAI API
- Domain availability via RDAP + WHOIS
- Telegram Bot API
- Postgres

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for marketing runs as a single backend service on the stack (Next.js, OpenAI API, Domain availability via RDAP + WHOIS) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/marketing/s4e5ajoj91-need-a-service-for-generating-na` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Russia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Next.js, OpenAI API, Domain availability via RDAP + WHOIS) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Russia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/marketing/s4e5ajoj91-need-a-service-for-generating-na`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`348-need-a-service-for-generating-names`), pin dependencies for Next.js, OpenAI API, Domain availability via RDAP + WHOIS, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/marketing/s4e5ajoj91-need-a-service-for-generating-na` with no feature creep. A single user from Russia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Russia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Russia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Domain cache freshness.** RDAP/WHOIS lookups cache; a domain can be taken between our check and the registrar click. The 'reserve' CTA opens a registrar tab, it does not claim the domain.
- **Social-handle endpoint churn.** X, GitHub, Telegram, VK change their handle-existence endpoints; probes are versioned and best-effort, with a manual-fallback tag.
- **Trademark risk.** Availability of a handle/domain does not mean trademark availability; a trademark disclaimer is on the brief-results screen.
