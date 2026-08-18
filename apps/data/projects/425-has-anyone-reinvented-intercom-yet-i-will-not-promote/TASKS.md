---
id: "425"
slug: has-anyone-reinvented-intercom-yet-i-will-not-promote
title: Has anyone reinvented Intercom yet? (I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vmgsyo/has_anyone_reinvented_intercom_yet_i_will_not/"
category: startups
date: "2026-08-12"
---
# Has anyone reinvented Intercom yet? (I will not promote)

## Phase 0: Scaffold

- [ ] Create project folder at `apps/has-anyone-reinvented-intercom-yet-i-will-not-promote/`
- [ ] Initialize repo and pin dependencies to the stack listed in PLAN.md
- [ ] Copy DESIGN tokens into the chosen framework's styling entry
- [ ] Set up environment file with the integration keys this plan needs
- [ ] Add the project to the monorepo workspaces if applicable
- [ ] Commit a README that quotes the source problem verbatim

## Phase 1: Core

Build the single flow described in SPEC.md MVP Scope, end to end:

- [ ] Implement the data model: `tools`, `gaps`, `checklists`, `sketches`, `responses`
- [ ] Build the framework UI: one page per tool, with the named trade-off
- [ ] Wire the Anthropic Claude API for the interactive onboarding draft
- [ ] Wire the Video API for the embedded video
- [ ] Add structured logging on every onboarding draft so failures are reproducible
- [ ] Write one end-to-end test for the framework happy path
- [ ] Run the test against staging, not localhost

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 425-has-anyone-reinvented-intercom-yet- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
