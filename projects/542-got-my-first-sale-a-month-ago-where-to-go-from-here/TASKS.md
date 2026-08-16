---
tags: ["saas", "b2b", "food", "inventory"]
tech: ["Next.js", "TypeScript", "Supabase", "Stripe"]
id: "542"
slug: got-my-first-sale-a-month-ago-where-to-go-from-here
title: "Got my first sale a month ago, where to go from here..?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9tvt/got_my_first_sale_a_month_ago_where_to_go_from/"
category: saas
date: "2026-08-14"
---
# Got my first sale a month ago, where to go from here

## Phase 0: Scaffold

- [ ] Create `apps/542-got-my-first-sale-a-month-ago-where-to-go-from-here/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding per-cafe data
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens (mobile-first cafe-operations visual identity)
- [ ] Provision Supabase: auth, inventory, recipes, supplier list, weekly margin report
- [ ] Wire Stripe for the Pro tier ($29/month) and the multi-location add-on
- [ ] Build the feedback-loop replacement: weekly NPS + 5-user interview cadence tracker

## Phase 1: Core

- [ ] Stock counts (mobile-first; barcode scan; last-value prefills)
- [ ] Par levels + reorder alerts
- [ ] Supplier list with cost tracking
- [ ] Recipes: ingredient-level with cost-per-portion and margin %
- [ ] Weekly margin report + email digest
- [ ] Free tier: 1 cafe, 50 stock counts / month

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] Landing-page variant test (stockouts vs recipe costs vs inventory counts) with 3 versions
- [ ] First 30 paying cafe owners via r/Coffee and r/smallbusiness
- [ ] Post-mortem at week 12
