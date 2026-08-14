---
id: "336"
slug: search-for-an-affordable-way-to-get-pr-in-forbes-and-ot
title: Search for an affordable way to get PR in Forbes and other top media outlets
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/xi1ox0v161-search-for-an-affordable-way-to-get-pr-i"
category: marketing
date: "2025-10-29"
tags: [Marketing, Media, Other]
country: Russia
tech: [Python (Aiohttp), Hunter.io + Apollo APIs, OpenAI API, Postgres, React (operator dashboard)]
---
# Search for an affordable way to get PR in Forbes and other top media outlets

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/marketing/xi1ox0v161-search-for-an-affordable-way-to-get-pr-i` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/336-search-for-an-affordable-way-to-get-pr-i/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python (Aiohttp), Hunter.io + Apollo APIs, OpenAI API, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Story brief intake + outlet selection
- [ ] Journalist lookup via Hunter.io + Apollo, ranked by beat-match score
- [ ] Beat-matched pitch draft (EN/RU) with traction numbers from brief
- [ ] Send queue with per-outlet rate limits and explicit user send-click
- [ ] 3-touch follow-up sequence with stop-on-reply
- [ ] Coverage reporting: opens, replies, requested-more, ran-story
- [ ] End-to-end pilot: 5 Russian founders, 25 pitches each over 90 days

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python (Aiohttp), Hunter.io + Apollo APIs, OpenAI API) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 336-search-for-an-affordable-way-to-get MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python (Aiohttp), Hunter.io + Apollo APIs, OpenAI API errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
