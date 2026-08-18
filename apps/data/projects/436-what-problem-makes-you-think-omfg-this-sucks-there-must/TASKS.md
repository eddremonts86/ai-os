---
id: "436"
slug: what-problem-makes-you-think-omfg-this-sucks-there-must
title: What problem makes you think Omfg this sucks there must be a better way? (I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vm5qbw/what_problem_makes_you_think_omfg_this_sucks/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# What problem makes you think Omfg this sucks there must be a better way? (I will not promote)

## Phase 0: Scaffold

- [ ] Read the source at `https://www.reddit.com/r/startups/comments/1vm5qbw/what_problem_makes_you_think_omfg_this_sucks/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/436-what-problem-makes-you-think-omfg-this-s/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, TypeScript, PostgreSQL, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: the country stated in the source`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for the country stated in the source.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Build problem-entry schema and submission form
- [ ] Moderation queue and public index
- [ ] Filters by industry / role / frequency
- [ ] Archive.org fallback for source URLs

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 436-what-problem-makes-you-think-omfg-t MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
