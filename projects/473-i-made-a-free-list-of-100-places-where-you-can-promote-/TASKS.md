---
id: "473"
slug: i-made-a-free-list-of-100-places-where-you-can-promote-
title: i made a free list of 100 places where you can promote your app
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vi5ui8/i_made_a_free_list_of_100_places_where_you_can/"
category: indiehackers
date: "2026-08-07"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# i made a free list of 100 places where you can promote your app

## Phase 0: Scaffold

- [ ] Read the source at `https://www.reddit.com/r/indiehackers/comments/1vi5ui8/i_made_a_free_list_of_100_places_where_you_can/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/473-i-made-a-free-list-of-100-places-where-y/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, TypeScript, PostgreSQL, and confirm versions resolve in CI.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: the country stated in the source`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for the country stated in the source.
## Phase 1: Core

- [ ] Channel database
- [ ] Filter UI
- [ ] Submission tracker
- [ ] Weekly digest

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 473-i-made-a-free-list-of-100-places-wh MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
