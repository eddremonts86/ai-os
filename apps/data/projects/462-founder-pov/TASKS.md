---
id: "462"
slug: founder-pov
title: Founder POV
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vntqsr/founder_pov/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# Founder POV

## Phase 0: Scaffold

- [ ] Read the source at `https://www.reddit.com/r/SaaS/comments/1vntqsr/founder_pov/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/462-founder-pov/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, TypeScript, PostgreSQL, and confirm versions resolve in CI.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: the country stated in the source`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for the country stated in the source.
## Phase 1: Core

- [ ] 30-question audit
- [ ] Remediation engine
- [ ] Do-today / do-quarter split
- [ ] Reminder flow

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 462-founder-pov MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
