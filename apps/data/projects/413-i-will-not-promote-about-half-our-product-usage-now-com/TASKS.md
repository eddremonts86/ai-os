---
id: "413"
slug: i-will-not-promote-about-half-our-product-usage-now-com
title: "I will not promote: About half our product usage now comes through the API, and we almost missed what that meant"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vnm3el/i_will_not_promote_about_half_our_product_usage/"
category: startups
date: "2026-08-13"
---
# I will not promote: About half our product usage now comes through the API, and we almost missed what that meant

## Phase 0: Scaffold

- [ ] Create project folder at `apps/i-will-not-promote-about-half-our-product-usage-now-com/`
- [ ] Initialize repo and pin dependencies to the stack listed in PLAN.md
- [ ] Copy DESIGN tokens into the chosen framework's styling entry
- [ ] Set up environment file with the integration keys this plan needs
- [ ] Add the project to the monorepo workspaces if applicable
- [ ] Commit a README that quotes the source problem verbatim

## Phase 1: Core

Build the single flow described in SPEC.md MVP Scope, end to end:

- [ ] Implement the data model: `signals`, `responses`, `audits`, `implications`
- [ ] Build the audit UI: one page per signal, with the named threshold
- [ ] Wire the Anthropic Claude API for the implication-map draft
- [ ] Wire the MCP server for the audit query
- [ ] Add structured logging on every audit query so failures are reproducible
- [ ] Write one end-to-end test for the audit happy path
- [ ] Run the test against staging, not localhost

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 413-i-will-not-promote-about-half-our-p MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
