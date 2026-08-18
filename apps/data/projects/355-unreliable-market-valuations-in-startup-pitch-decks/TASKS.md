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

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/startups/45pkeu8rb1-unreliable-market-valuations-in-startup` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/355-unreliable-market-valuations-in-startup-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, OpenAI API (citation extraction), Public-data sources (RU/EU SEC feeds, and confirm versions resolve in CI.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
## Phase 1: Core

- [ ] TAM/SAM/SOM query: geography + vertical + unit inputs
- [ ] Primary-source ranking: census, central-bank stats, registry filings, paid industry reports
- [ ] Citation panel: per-number source link + 'last-checked' date
- [ ] Old-figure flag (>18 months) and single-source 'needs confirmation' flag
- [ ] Exportable citation pack (PDF + JSON) for deck appendix
- [ ] Per-vertical starter template for Russian market typical questions
- [ ] Pilot with 30 Russian founders across 60 days; investor-pushback count tracked

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, OpenAI API (citation extraction), Public-data sources (RU/EU SEC feeds) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 355-unreliable-market-valuations-in-sta MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, OpenAI API (citation extraction), Public-data sources (RU/EU SEC feeds errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
