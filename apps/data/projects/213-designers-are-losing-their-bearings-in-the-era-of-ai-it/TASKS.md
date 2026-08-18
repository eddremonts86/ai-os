---
id: "213"
slug: designers-are-losing-their-bearings-in-the-era-of-ai-it
title: "Designers are losing their bearings in the era of AI — it's unclear which direction to develop in, who reviews work, and how to keep the craft."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: design
date: "2026-03-16"
tags: [Design, AI, Community]
country: Russia
tech: [Next.js, PostgreSQL, Meilisearch, Python, FastAPI, Stripe]
---
# Designers are losing their bearings in the era of AI — it's unclear which direction to develop in, who reviews work, and how to keep the craft.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/213-designers-are-losing-their-bearings-in-t/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, PostgreSQL, Meilisearch, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
## Phase 1: Core

- [ ] Curriculum library with 3, 6, and 12-month tracks
- [ ] Mentor pool of 10 working designers
- [ ] Mentor matching algorithm
- [ ] Review submission flow with 3 questions
- [ ] Portfolio page per designer
- [ ] Mentor review rating system
- [ ] Quarterly curriculum update process
- [ ] First 100 paying designers in pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, PostgreSQL, Meilisearch) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 213-designers-are-losing-their-bearings MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, PostgreSQL, Meilisearch errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
