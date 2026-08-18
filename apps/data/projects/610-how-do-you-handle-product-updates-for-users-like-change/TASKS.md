---
id: "610"
slug: how-do-you-handle-product-updates-for-users-like-change
title: How do you handle product updates for users? Like changelog and stuff?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp1yfn/how_do_you_handle_product_updates_for_users_like/"
category: saas
date: "2026-08-15"
tags: [saas, developer-tools, feedback, changelog]
tech: [Next.js, TypeScript, Vanilla JS, Supabase, Stripe]
---
# How do you handle product updates for users, like changelog?

## Phase 0: Scaffold

- [ ] Create `apps/610-how-do-you-handle-product-updates-for-users-like-change/` (Next.js + TypeScript + the widget as a separate package)
- [ ] Initialize git with `.gitignore` excluding per-product feedback data
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens
- [ ] Provision Supabase: auth, per-product changelog, feedback submissions, "you are affected" rules
- [ ] Build the widget as a vanilla JS bundle (< 20KB)
- [ ] Wire Stripe for the Pro tier ($29/month)

## Phase 1: Core

- [ ] Widget: bell icon in the host app's chrome, per-product feed
- [ ] Founder dashboard: changelog composer on the left, feedback inbox in the centre
- [ ] Feedback widget: "?" icon that opens a feedback form
- [ ] "You are affected" rule engine: JSON-defined rules, matched against per-user environment
- [ ] Free tier: 1 product, 50 changelog entries/month, 100 feedback submissions/month

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 30 indie SaaS founders via IndieHackers and r/SaaS
- [ ] 90-day widget-bundle-size audit
- [ ] Post-mortem at week 10
