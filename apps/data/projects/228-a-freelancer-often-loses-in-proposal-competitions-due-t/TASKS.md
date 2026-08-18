---
id: "228"
slug: a-freelancer-often-loses-in-proposal-competitions-due-t
title: A freelancer often loses in proposal competitions due to the inability to quickly create personalized proposals — weeks of work wasted.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: freelance
date: "2026-01-29"
tags: [Freelance, Productivity, AI]
country: Australia
tech: [Next.js, Python, FastAPI, Claude API, PostgreSQL, Stripe]
---
# A freelancer often loses in proposal competitions due to the inability to quickly create personalized proposals — weeks of work wasted.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/228-a-freelancer-often-loses-in-proposal-com/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, Python, FastAPI, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Australia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Australia.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Brief intake (paste, upload, or URL)
- [ ] Portfolio item selection
- [ ] Per-freelancer voice pass
- [ ] Per-client memory of past conversations
- [ ] Draft proposal generation
- [ ] 5-minute review UI
- [ ] Per-tenant voice isolation
- [ ] First 100 freelancers in pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, Python, FastAPI) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 228-a-freelancer-often-loses-in-proposa MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Australia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, Python, FastAPI errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
