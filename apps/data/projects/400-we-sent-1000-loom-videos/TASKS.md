---
id: "400"
slug: we-sent-1000-loom-videos
title: We sent 1000 loom videos
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnn9g5/we_sent_1000_loom_videos/"
category: saas
date: "2026-08-13"
---
# We sent 1000 loom videos

## Phase 0: Scaffold

- [ ] Create project folder at `apps/we-sent-1000-loom-videos/`
- [ ] Initialize repo and pin dependencies to the stack listed in PLAN.md
- [ ] Copy DESIGN tokens into the chosen framework's styling entry
- [ ] Set up environment file with the integration keys this plan needs
- [ ] Add the project to the monorepo workspaces if applicable
- [ ] Commit a README that quotes the source problem verbatim

## Phase 1: Core

Build the single flow described in SPEC.md MVP Scope, end to end:

- [ ] Implement the data model: `scenarios`, `results`, `sequences`, `risks`
- [ ] Build the calculator UI: VA cost, weekly video count, target reply rate
- [ ] Wire the Anthropic Claude API for the follow-up sequence draft
- [ ] Wire the Loom API for the embed metadata on the example video
- [ ] Add structured logging on every calculation so failures are reproducible
- [ ] Write one end-to-end test for the calculator happy path
- [ ] Run the test against staging, not localhost

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 400-we-sent-1000-loom-videos MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
