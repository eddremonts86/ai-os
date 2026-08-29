---
id: "870"
slug: need-a-simple-alternative-to-meta-ads-after-andromeda-u
title: Need a simple alternative to Meta Ads after Andromeda update
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/8xk7k4gx31-need-a-simple-alternative-to-meta-ads-af"
  captured: "2025-10-29"
category: marketing
date: "2025-10-29"
tags: [Marketing]
country: USA
wtp:
  raw: $29.99/month
  currency: USD
  min: 29.99
  max: 29.99
  period: month
  mrrMid: 29.99
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Need a simple alternative to Meta Ads after Andromeda update

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (dashboard chrome, KPI card, rule builder)
- [ ] Provision Coolify project + Docker image + SQLite volume
- [ ] Wire Resend email-link auth (single workspace per account)
- [ ] Decide DSP-Adapter interface shape and add stub adapters for both DSPs

## Phase 1: Core

- [ ] OAuth2 flow for The Trade Desk; encrypt stored access tokens at rest
- [ ] StackAdapt API-key flow with workspace-level key storage
- [ ] Campaign import: list active campaigns per DSP, store canonical campaign row
- [ ] KPI ingestion: daily rollup per campaign (impressions, clicks, spend, CPA) into SQLite
- [ ] Cross-DSP rollup view: workspace dashboard with daily / weekly / monthly ranges
- [ ] Rule builder UI: trigger (KPI metric + threshold) + action (pause / adjust bid by %)
- [ ] Cron runner every 15 min: evaluate active rules, dry-run before apply, post bid adjustment via matching DSPAdapter
- [ ] Per-rule audit log (what changed, when, why)
- [ ] Workspace status gating: read-only after Stripe trial ends without subscription
- [ ] End-to-end test: connect The Trade Desk, import 3 campaigns, attach 2 rules, observe one apply cycle

## Phase 2: Deploy

- [ ] Move Stripe to live mode
- [ ] Onboard 5 pilot agency workspaces
- [ ] Set up status page + DSP webhook monitoring
- [ ] Post-mortem after week 13 with pilot cohort
