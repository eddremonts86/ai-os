---
id: "411"
slug: your-user-has-already-started-the-decision-before-openi
title: Your User Has Already Started the Decision Before Opening Your Product
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnj84g/your_user_has_already_started_the_decision_before/"
category: saas
date: "2026-08-13"
---
# Your User Has Already Started the Decision Before Opening Your Product

## Phase 0: Scaffold

- [ ] Create project folder at `apps/your-user-has-already-started-the-decision-before-openi/`
- [ ] Initialize repo and pin dependencies to the stack listed in PLAN.md
- [ ] Copy DESIGN tokens into the chosen framework's styling entry
- [ ] Set up environment file with the integration keys this plan needs
- [ ] Add the project to the monorepo workspaces if applicable
- [ ] Commit a README that quotes the source problem verbatim

## Phase 1: Core

Build the single flow described in SPEC.md MVP Scope, end to end:

- [ ] Implement the data model: `categories`, `audits`, `checklists`, `responses`
- [ ] Build the audit UI: one page per category, with the named question
- [ ] Wire the OpenAI API for the audit text per response
- [ ] Add structured logging on every audit query so failures are reproducible
- [ ] Write one end-to-end test for the audit happy path
- [ ] Run the test against staging, not localhost

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 411-your-user-has-already-started-the-d MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
