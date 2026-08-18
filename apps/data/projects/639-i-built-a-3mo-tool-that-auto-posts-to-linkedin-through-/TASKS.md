---
id: "639"
slug: i-built-a-3mo-tool-that-auto-posts-to-linkedin-through-
title: I built a $3/mo tool that auto-posts to LinkedIn through their official API
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp7kaq/i_built_a_3mo_tool_that_autoposts_to_linkedin/"
category: saas
date: "2026-08-15"
wtp: "$3/mo basic, $6/mo higher tier"
---
# I built a $3/mo tool that auto-posts to LinkedIn through their official API

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/639-i-built-a-3mo-tool-that-auto-posts-to-linkedin-through-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Provision LinkedIn developer app + scopes for w_member_social
- [ ] OAuth callback handler stores encrypted access + refresh tokens
- [ ] Compose form with character count + media URL field
- [ ] Schedule model: user_id, body, scheduled_at, status (pending/posted/failed)
- [ ] Worker pulls due rows, calls Posts endpoint, records result
- [ ] Stripe products for $3 and $6 tiers, webhook maps to seat quotas

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-15_
