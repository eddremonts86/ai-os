---
id: "625"
slug: traffic-up-62-signups-up-41-revenue-down-19-heres-why
title: "traffic up 62%, signups up 41%, revenue down 19%. heres why"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vozoil/traffic_up_62_signups_up_41_revenue_down_19_heres/"
category: saas
date: "2026-08-15"
tags: [saas, analytics, revenue, indie]
tech: [Next.js, TypeScript, Stripe API, Supabase, Stripe]
---
# Traffic up 62%, signups up 41%, revenue down 19%, here's why

## Phase 0: Scaffold

- [ ] Create `apps/625-traffic-up-62-signups-up-41-revenue-down-19-heres-why/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding per-site revenue data
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens
- [ ] Provision Supabase: auth, per-site revenue-impact data, cohort retention
- [ ] Wire the Stripe API ingest + the lightweight SDK for host-app events
- [ ] Implement the alert engine in TypeScript
- [ ] Wire Stripe for the Pro tier ($29/month)

## Phase 1: Core

- [ ] Funnel with the revenue-impact stage as a first-class metric
- [ ] Per-channel revenue contribution
- [ ] "Revenue down, signups up" alert (named per channel)
- [ ] Cohort retention by acquisition channel
- [ ] Free tier: 1 site, 30-day retention

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 30 paying founders via IndieHackers and r/SaaS
- [ ] 90-day alert-actionability audit
- [ ] Post-mortem at week 7
