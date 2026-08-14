---
id: "399"
slug: i-built-an-influencer-channel-for-a-productivity-app-an
title: "I built an influencer channel for a productivity app and here's my learning"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnnj0a/i_built_an_influencer_channel_for_a_productivity/"
category: saas
date: "2026-08-13"
---
# I built an influencer channel for a productivity app and here's my learning

## Phase 0: Scaffold

- [ ] Create project folder at `apps/i-built-an-influencer-channel-for-a-productivity-app-an/`
- [ ] Initialize repo and pin dependencies to the stack listed in PLAN.md
- [ ] Copy DESIGN tokens into the chosen framework's styling entry
- [ ] Set up environment file with the integration keys this plan needs
- [ ] Add the project to the monorepo workspaces if applicable
- [ ] Commit a README that quotes the source problem verbatim

## Phase 1: Core

Build the single flow described in SPEC.md MVP Scope, end to end:

- [ ] Implement the data model: `creator_profiles`, `comp_models`, `scenarios`, `shapes`
- [ ] Build the playbook UI: archetype pages, comp-model menu, channel-shape sketch
- [ ] Wire the Anthropic Claude API for the channel-shape draft per scenario
- [ ] Add structured logging on every shape generation so failures are reproducible
- [ ] Write one end-to-end test for the playbook happy path
- [ ] Run the test against staging, not localhost

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 399-i-built-an-influencer-channel-for-a MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
