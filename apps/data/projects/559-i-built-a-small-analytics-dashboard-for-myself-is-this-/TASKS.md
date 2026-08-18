---
id: "559"
slug: i-built-a-small-analytics-dashboard-for-myself-is-this-
title: I built a small analytics dashboard for myself. Is this actually useful to anyone else?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo5vt6/i_built_a_small_analytics_dashboard_for_myself_is/"
category: saas
date: "2026-08-14"
tags: [saas, analytics, indie, dashboard]
tech: [Next.js, TypeScript, Supabase, PostHog API, Stripe API, RevenueCat API, Resend]
---
# I built a small analytics dashboard for myself, is this actually useful to anyone else?

## Phase 0: Scaffold

- [ ] Create `apps/559-i-built-a-small-analytics-dashboard-for-myself-is-this-/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding connector credentials
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens (single-dashboard visual identity)
- [ ] Provision Supabase: auth, per-product workspace, daily KPI snapshots
- [ ] Wire the four connectors (PostHog, Supabase, RevenueCat, Stripe)
- [ ] Set up the daily cron at 09:00 per workspace timezone
- [ ] Wire Resend for email notifications and a Slack webhook for Slack delivery
- [ ] Wire Stripe for the Pro tier ($19/month)

## Phase 1: Core

- [ ] PostHog + Stripe connectors
- [ ] Supabase + RevenueCat connectors
- [ ] KPI cards: active users, new users, returning users, top events, revenue, signups
- [ ] Daily / weekly / monthly views
- [ ] Daily notification with the most important deltas
- [ ] Slack webhook integration
- [ ] Free tier: 1 product, 2 connectors

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 100 paying founders via IndieHackers and r/SaaS
- [ ] 90-day noisy-notification tuning
- [ ] Post-mortem at week 9
