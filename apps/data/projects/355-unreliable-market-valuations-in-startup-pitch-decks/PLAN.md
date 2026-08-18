---
id: "355"
slug: unreliable-market-valuations-in-startup-pitch-decks
title: Unreliable market valuations in startup pitch decks
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/startups/45pkeu8rb1-unreliable-market-valuations-in-startup"
category: startups
date: "2025-10-29"
tags: [Startups]
country: Russia
tech: [Next.js, OpenAI API (citation extraction), Public-data sources (RU/EU SEC feeds, registry data), Postgres, React-PDF (rendered slide)]
---
# Unreliable market valuations in startup pitch decks

## Tech Stack

- Next.js
- OpenAI API (citation extraction)
- Public-data sources (RU/EU SEC feeds, registry data)
- Postgres
- React-PDF (rendered slide)

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for startups runs as a single backend service on the stack (Next.js, OpenAI API (citation extraction), Public-data sources (RU/EU SEC feeds) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/startups/45pkeu8rb1-unreliable-market-valuations-in-s` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Russia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Next.js, OpenAI API (citation extraction), Public-data sources (RU/EU SEC feeds) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Russia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/startups/45pkeu8rb1-unreliable-market-valuations-in-s`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`355-unreliable-market-valuations-in-sta`), pin dependencies for Next.js, OpenAI API (citation extraction), Public-data sources (RU/EU SEC feeds, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/startups/45pkeu8rb1-unreliable-market-valuations-in-s` with no feature creep. A single user from Russia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Russia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Russia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Source availability for Russian verticals.** Census-tied figures (e.g. Russian e-commerce GMV) are easy; some sub-verticals lack recent primary data; 'no primary source' must surface cleanly.
- **Licence attributes for paid reports.** A paid report's number can be cited with attribution; copying the report is the licence violation. The product carries the citation, not the report.
- **Founder overconfidence.** A clean citation pack can anchor the founder to numbers that are precise but wrong; the 'old-figure flag' is meant to interrupt that overconfidence.
