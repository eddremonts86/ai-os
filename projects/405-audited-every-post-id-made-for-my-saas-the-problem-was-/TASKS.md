---
id: "405"
slug: audited-every-post-id-made-for-my-saas-the-problem-was-
title: "Audited every post I'd made for my SaaS. The problem was never the writing."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnm0nd/audited_every_post_id_made_for_my_saas_the/"
category: saas
date: "2026-08-13"
---
# Audited every post I'd made for my SaaS. The problem was never the writing.

## Phase 0: Scaffold

- [ ] Create project folder at `apps/audited-every-post-id-made-for-my-saas-the-problem-was-/`
- [ ] Initialize repo and pin dependencies to the stack listed in PLAN.md
- [ ] Copy DESIGN tokens into the chosen framework's styling entry
- [ ] Set up environment file with the integration keys this plan needs
- [ ] Add the project to the monorepo workspaces if applicable
- [ ] Commit a README that quotes the source problem verbatim

## Phase 1: Core

Build the single flow described in SPEC.md MVP Scope, end to end:

- [ ] Implement the data model: `categories`, `entries`, `exports`, `recommendations`
- [ ] Build the scoring UI: category picker, entry form, score output
- [ ] Wire the Anthropic Claude API for the scoring export draft
- [ ] Add structured logging on every scoring entry so failures are reproducible
- [ ] Write one end-to-end test for the scoring happy path
- [ ] Run the test against staging, not localhost

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 405-audited-every-post-i-d-made-for-my- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
