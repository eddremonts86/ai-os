---
id: "353"
slug: difficulty-finding-relevant-respondents-for-b2b-researc
title: Difficulty finding relevant respondents for b2b research
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/other/tphf0sjeg1-difficulty-finding-relevant-respondents"
category: other
date: "2025-10-29"
tags: [Other]
country: Russia
tech: [Next.js, Postgres, B2B intent + role-firmographic data (Apollo + Russian-provider fallback), Stripe / YuKassa, OpenAI API (qualification scoring)]
---
# Difficulty finding relevant respondents for b2b research

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/other/tphf0sjeg1-difficulty-finding-relevant-respondents` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/353-difficulty-finding-relevant-respondents-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, Postgres, B2B intent + role-firmographic data (Apollo + Russian-provider fallback), and confirm versions resolve in CI.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Persona spec: role, industry, company-size, geography (RU)
- [ ] Respondent sourcing: Apollo + RU provider + opt-in recruiter panel
- [ ] Qualification scoring: firmographic + role + tenure + sector composite
- [ ] Outreach: RU template, RUB incentive, opt-in double-confirmation
- [ ] Calendar: 30-min interview booking synced with research team
- [ ] Per-study recruitment cap and 152-FZ consent text
- [ ] Pilot with 10 Russian B2B research teams across 60 days, fit-index quality tracked

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, Postgres, B2B intent + role-firmographic data (Apollo + Russian-provider fallback)) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 353-difficulty-finding-relevant-respond MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, Postgres, B2B intent + role-firmographic data (Apollo + Russian-provider fallback) errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
