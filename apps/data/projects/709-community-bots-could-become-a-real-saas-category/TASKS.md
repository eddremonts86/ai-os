---
id: "709"
slug: community-bots-could-become-a-real-saas-category
title: Community bots could become a real SaaS category
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpyorz/community_bots_could_become_a_real_saas_category/"
category: saas
date: "2026-08-16"
---
# Community bots could become a real SaaS category

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/709-community-bots-could-become-a-real-saas-category/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Pick one workflow to ship first (memberships / payments / access / analytics / automations / transactions)
- [ ] Pick the community platform to anchor on (Discord, Slack, or Circle)
- [ ] Bot scaffold with OAuth install flow for the chosen platform
- [ ] Subscription billing wired (Stripe or Paddle, per-community recurring)
- [ ] Ship the one chosen workflow end-to-end inside the community
- [ ] Minimal in-community admin surface (slash command or ephemeral modal, not a SaaS dashboard)
- [ ] Post validation outcome (paid conversions, workflow completion rate) to the original r/SaaS thread

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-16_
