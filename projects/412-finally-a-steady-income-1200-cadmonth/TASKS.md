---
id: "412"
slug: finally-a-steady-income-1200-cadmonth
title: "Finally a steady income! 1200 CAD/month"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnj7hy/finally_a_steady_income_1200_cadmonth/"
category: saas
date: "2026-08-13"
---
# Finally a steady income! 1200 CAD/month

## Phase 0: Scaffold

- [ ] Read the source at `https://www.reddit.com/r/SaaS/comments/1vnj7hy/finally_a_steady_income_1200_cadmonth/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/412-finally-a-steady-income-1200-cad-month/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: the chosen stack, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: the country stated in the source`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for the country stated in the source.
- [ ] Implement the smallest slice from MVP Scope that proves the the chosen stack integration in production.
## Phase 1: Core

Build the single flow described in SPEC.md MVP Scope, end to end:

- [ ] Implement the data model: `forks`, `sketches`, `failures`, `responses`
- [ ] Build the frame UI: one page per fork, with the named trade-off
- [ ] Wire the OpenAI API for the verdict text per response
- [ ] Add structured logging on every fork query so failures are reproducible
- [ ] Write one end-to-end test for the frame happy path
- [ ] Run the test against staging, not localhost

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 412-finally-a-steady-income-1200-cad-mo MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
