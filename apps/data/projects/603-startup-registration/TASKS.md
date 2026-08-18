---
id: "603"
slug: startup-registration
title: Startup registration
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vow1pl/startup_registration/"
category: saas
date: "2026-08-15"
tags: [saas, legal, compliance, b2b]
tech: [Next.js, TypeScript, Supabase, Stripe]
---
# Startup registration (EU citizen, multiple ideas, subscription-based services)

## Phase 0: Scaffold

- [ ] Create `apps/603-startup-registration/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding per-founder decision-tree state
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens
- [ ] Provision Supabase: auth, templates, partner directory
- [ ] Implement the decision-tree engine in TypeScript
- [ ] Add the "not legal advice" disclaimer on every page

## Phase 1: Core

- [ ] Decision tree: country + legal form + tax + payment-rail
- [ ] Templates: incorporation documents, VAT registration, OSS / MOSS forms
- [ ] Partner directory: incorporation agents, accountants, payment-rail partners
- [ ] Free tier: decision tree + templates
- [ ] Stripe paywall: Pro at $99 (1:1 review + partner recommendation)

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 30 Pro reviews from EU-citizen non-resident founders
- [ ] 90-day regulatory-change audit cycle
- [ ] Post-mortem at week 8
