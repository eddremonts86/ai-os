---
tags: ["saas", "sports", "analytics", "consumer"]
tech: ["Next.js", "TypeScript", "Supabase", "nflfastR", "Stripe"]
id: "554"
slug: feedback-on-my-sports-web-app
title: Feedback on my sports web app
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo6lsh/feedback_on_my_sports_web_app/"
category: saas
date: "2026-08-14"
---
# Feedback on my sports web app

## Phase 0: Scaffold

- [ ] Create `apps/554-feedback-on-my-sports-web-app/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding the weekly NFL data snapshots
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens (model-builder visual identity)
- [ ] Provision Supabase: auth, game database, saved models, per-pick confidence
- [ ] Set up the weekly NFL data ingestion job (nflfastR)
- [ ] Wire Stripe for the Pro tier ($19/month)
- [ ] Add the explicit "analytics, not betting advice" disclaimer

## Phase 1: Core

- [ ] NFL game database with all 9 filter variables
- [ ] Model-builder UI: pick variables, see historical performance, save the model
- [ ] Weekly picks: games matching the user's saved models with per-pick confidence
- [ ] Record tracker: per-model win/loss over time
- [ ] Free tier: 1 saved model, weekly picks read-only
- [ ] Stripe paywall: Pro at $19/month (unlimited models, confidence, export)

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 100 sports bettors via r/sportsbook and r/nfl
- [ ] 90-day honest-backtest vs live comparison
- [ ] Post-mortem at week 10
