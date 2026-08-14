---
id: "401"
slug: how-did-you-get-your-first-real-users-when-nobody-knew-
title: How did you get your first real users when nobody knew your product existed?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnml9h/how_did_you_get_your_first_real_users_when_nobody/"
category: saas
date: "2026-08-13"
---
# How did you get your first real users when nobody knew your product existed?

## Phase 0: Scaffold

- [ ] Read the source at `https://www.reddit.com/r/SaaS/comments/1vnml9h/how_did_you_get_your_first_real_users_when_nobody/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/401-how-did-you-get-your-first-real-users-wh/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: the chosen stack, and confirm versions resolve in CI.
- [ ] Implement the smallest slice from MVP Scope that proves the the chosen stack integration in production.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: the country stated in the source`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for the country stated in the source.
## Phase 1: Core

Build the single flow described in SPEC.md MVP Scope, end to end:

- [ ] Implement the data model: `channels`, `responses`, `picks`
- [ ] Build the catalog UI: one page per channel, with the named signal
- [ ] Wire the OpenAI API for the verdict text per response
- [ ] Add structured logging on every catalog query so failures are reproducible
- [ ] Write one end-to-end test for the catalog happy path
- [ ] Run the test against staging, not localhost

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 401-how-did-you-get-your-first-real-use MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
