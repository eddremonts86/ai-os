---
id: "421"
slug: how-are-you-evaluating-agents-that-write-sql-against-li
title: "How are you evaluating agents that write SQL against live databases?[I will not promote]"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vmu0dh/how_are_you_evaluating_agents_that_write_sql/"
category: startups
date: "2026-08-12"
---
# How are you evaluating agents that write SQL against live databases?[I will not promote]

## Phase 0: Scaffold

- [ ] Create project folder at `apps/how-are-you-evaluating-agents-that-write-sql-against-li/`
- [ ] Initialize repo and pin dependencies to the stack listed in PLAN.md
- [ ] Copy DESIGN tokens into the chosen framework's styling entry
- [ ] Set up environment file with the integration keys this plan needs
- [ ] Add the project to the monorepo workspaces if applicable
- [ ] Commit a README that quotes the source problem verbatim

## Phase 1: Core

Build the single flow described in SPEC.md MVP Scope, end to end:

- [ ] Implement the data model: `evals`, `metrics`, `cadences`, `responses`
- [ ] Build the eval UI: one page per metric, with the named threshold
- [ ] Wire the LangSmith SDK for the eval pipeline
- [ ] Wire the Anthropic Claude API for the judge agent
- [ ] Wire at least one live database (Postgres) behind one interface
- [ ] Add structured logging on every eval run so failures are reproducible
- [ ] Write one end-to-end test for the eval happy path
- [ ] Run the test against staging, not localhost

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 421-how-are-you-evaluating-agents-that- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
