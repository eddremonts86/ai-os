---
id: "348"
slug: need-a-service-for-generating-names-and-instantly-check
title: Need a service for generating names and instantly checking domain availability
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/s4e5ajoj91-need-a-service-for-generating-names-and"
category: marketing
date: "2025-10-29"
tags: [Marketing]
country: Russia
tech: [Next.js, OpenAI API, Domain availability via RDAP + WHOIS, Telegram Bot API, Postgres]
---
# Need a service for generating names and instantly checking domain availability

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/marketing/s4e5ajoj91-need-a-service-for-generating-names-and` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/348-need-a-service-for-generating-names-and-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, OpenAI API, Domain availability via RDAP + WHOIS, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Brief intake: 200-word project description, audience, vibe
- [ ] Name generator: 20 candidates ranked by distinctiveness and pronounceability
- [ ] Domain availability via RDAP/WHOIS across .com/.io/.co/.ru/.dev/.app
- [ ] Social handle availability: X, GitHub, Telegram, VK
- [ ] One-screen ranked view with 'reserve' CTA per domain
- [ ] Saved shortlist per user + CSV export
- [ ] Telegram bot: brief in chat returns ranked short list
- [ ] Pilot with 500 Russian indie founders across 60 days, shortlist -> registrar conversion tracked

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, OpenAI API, Domain availability via RDAP + WHOIS) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 348-need-a-service-for-generating-names MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, OpenAI API, Domain availability via RDAP + WHOIS errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
