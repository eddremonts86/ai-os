---
id: "520"
slug: how-we-decide-what-to-build-next-after-rice-completely-
title: How we decide what to build next after RICE completely fell apart for us
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo3np0/how_we_decide_what_to_build_next_after_rice/"
category: saas
date: "2026-08-14"
---
# How we decide what to build next after RICE completely fell apart for us

## Phase 0: Scaffold

- [x] Capture problem from Reddit + write SPEC.md skeleton
- [ ] Define DESIGN.md (board density, palette)
- [ ] Provision Rails + Postgres on a single VPS
- [ ] Devise + OmniAuth (Google, GitHub)
- [ ] Sidekiq + Redis for weekly diff cron

## Phase 1: Core

- [ ] Workspace + initiative CRUD
- [ ] Three-dimension scoring (evidence, build cost, strategic fit)
- [ ] Configurable weights with sensible defaults
- [ ] Ordered backlog view with per-item reasoning
- [ ] Audit log on every score, weight, and item change
- [ ] Public read-only board (no auth)
- [ ] Weekly email diff ("what changed")
- [ ] Pricing page with Stripe Checkout
- [ ] End-to-end test: team enters 8 initiatives → reorders → public board reflects it

## Phase 2: Deploy

- [ ] Recruit 3 product teams as design partners
- [ ] Coolify-side deployment
- [ ] Audit log CSV export for compliance

---

_Lúa generó este análisis automáticamente el 2026-08-14_
