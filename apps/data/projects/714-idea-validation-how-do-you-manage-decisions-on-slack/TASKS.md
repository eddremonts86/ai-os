---
id: "714"
slug: idea-validation-how-do-you-manage-decisions-on-slack
title: "[Idea validation] How do you manage decisions on slack ?"
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpxql5/idea_validation_how_do_you_manage_decisions_on/"
category: saas
date: "2026-08-16"
---
# [Idea validation] How do you manage decisions on slack ?

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/714-idea-validation-how-do-you-manage-decisions-on-slack/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Slack app scaffold (Bolt or equivalent) with OAuth scopes
- [ ] Durable decision store (Postgres or SQLite) with permalink + captured_at columns
- [ ] Slash command `/decision-log add` for explicit capture
- [ ] Reaction-based trigger (e.g. `:white_check_mark:`) for implicit capture
- [ ] `/decision-log search` slash command with channel / date / keyword filters
- [ ] Install flow + Slack App Directory listing prep
- [ ] Pricing page (per-workspace subscription is the natural shape; TBD)
- [ ] Post the validation outcome to the original r/SaaS thread

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-16_
