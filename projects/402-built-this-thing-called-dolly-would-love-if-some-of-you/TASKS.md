---
id: "402"
slug: built-this-thing-called-dolly-would-love-if-some-of-you
title: "built this thing called dolly, would love if some of you tried it"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnml72/built_this_thing_called_dolly_would_love_if_some/"
category: saas
date: "2026-08-13"
---
# built this thing called dolly, would love if some of you tried it

## Phase 0: Scaffold

- [ ] Create project folder at `apps/built-this-thing-called-dolly-would-love-if-some-of-you/`
- [ ] Initialize repo and pin dependencies to the stack listed in PLAN.md
- [ ] Copy DESIGN tokens into the chosen framework's styling entry
- [ ] Set up environment file with the integration keys this plan needs
- [ ] Add the project to the monorepo workspaces if applicable
- [ ] Commit a README that quotes the source problem verbatim

## Phase 1: Core

Build the single flow described in SPEC.md MVP Scope, end to end:

- [ ] Implement the data model: `users`, `generations`, `ledger_entries`, `provider_routes`
- [ ] Build the cost-preview UI: every generation shows the credit cost before run
- [ ] Wire the Stripe Billing for the credit purchase
- [ ] Wire the Anthropic Claude API for the router logic
- [ ] Wire at least one upstream provider per modality (image, video, voice, music)
- [ ] Add structured logging on every generation so failures are reproducible
- [ ] Write one end-to-end test for the cost-preview happy path
- [ ] Run the test against staging, not localhost

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 402-built-this-thing-called-dolly-would MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
