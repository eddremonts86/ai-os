---
tags: ["saas", "pricing", "research", "b2b"]
tech: ["Next.js", "TypeScript", "Supabase", "Resend", "Stripe"]
id: "556"
slug: i-built-a-pricing-research-tool-youd-be-surprised-how-m
title: "I built a pricing research tool, you'd be surprised how many people initially set their pricing just based on a competitor"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo6270/i_built_a_pricing_research_tool_youd_be_surprised/"
category: saas
date: "2026-08-14"
---
# I built a pricing research tool, you'd be surprised how many founders don't actually research their first price

## Phase 0: Scaffold

- [ ] Create `apps/556-i-built-a-pricing-research-tool-youd-be-surprised-how-m/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding per-engagement user lists
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens (pricing-research visual identity)
- [ ] Provision Supabase: auth, per-engagement workspace, survey responses, decision log
- [ ] Wire Resend / SES for survey delivery via the founder's own domain
- [ ] Implement Van Westendorp + revenue-impact simulator in TypeScript
- [ ] Wire Stripe for the Pro tier ($99/month)

## Phase 1: Core

- [ ] Van Westendorp survey (4 questions per respondent)
- [ ] Survey delivery via the founder's own domain (Resend / SES)
- [ ] Revenue-impact model: candidate price × retention × conversion → projected MRR
- [ ] Break-even retention calculator
- [ ] Decision log export: signed JSON + PDF per engagement
- [ ] Free tier: 50 respondents, 1 candidate price
- [ ] Stripe paywall: Pro at $99/month (500 respondents, 5 prices, export)

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 30 paying founders via IndieHackers and r/SaaS
- [ ] 90-day per-engagement data-isolation audit
- [ ] Post-mortem at week 9
