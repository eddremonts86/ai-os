---
id: "398"
slug: how-do-you-know-when-a-saas-company-has-outgrown-spread
title: How do you know when a SaaS company has outgrown spreadsheets for partner management?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnnlvw/how_do_you_know_when_a_saas_company_has_outgrown/"
category: saas
date: "2026-08-13"
---
# How do you know when a SaaS company has outgrown spreadsheets for partner management?

## Phase 0: Scaffold

- [ ] Create project folder at `apps/how-do-you-know-when-a-saas-company-has-outgrown-spread/`
- [ ] Initialize repo and pin dependencies to the stack listed in PLAN.md
- [ ] Copy DESIGN tokens into the chosen framework's styling entry
- [ ] Set up environment file with the integration keys this plan needs
- [ ] Add the project to the monorepo workspaces if applicable
- [ ] Commit a README that quotes the source problem verbatim

## Phase 1: Core

Build the single flow described in SPEC.md MVP Scope, end to end:

- [ ] Implement the data model: `signals`, `responses`, `verdicts`
- [ ] Build the scorecard UI: 5 questions, one per named signal
- [ ] Wire the OpenAI API for the verdict text per response
- [ ] Add structured logging on every scorecard submission so failures are reproducible
- [ ] Write one end-to-end test for the scorecard happy path
- [ ] Run the test against staging, not localhost

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 398-how-do-you-know-when-a-saas-company MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
