---
id: "676"
slug: launched-my-saas-keepme
title: Launched my SaaS - KEEPME
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vptxt6/launched_my_saas_keepme/"
category: saas
date: "2026-08-16"
tags: [saas, consumer, ai, content-saver]
tech: [Next.js, TypeScript, SwiftUI, Supabase, Anthropic Claude, AWS, Stripe]
---
## Phase 0: Scaffold

- [ ] Create `apps/676-launched-my-saas-keepme/` (Next.js + TypeScript) and the parallel `apps/676-launched-my-saas-keepme-ios/` (SwiftUI)
- [ ] Initialize git with the monorepo `.gitignore`
- [ ] Write SPEC.md and the matching DESIGN.md tokens (capture-and-retrieve visual identity)
- [ ] Provision the AWS account for the 12-month credit-window hosting
- [ ] Wire Supabase: auth, the content metadata table, the credits ledger
- [ ] Configure the Anthropic Claude API key and the per-user inference-cost cap
- [ ] Wire StoreKit 2 (iOS) and Stripe (web) in test mode

## Phase 1: Core

- [ ] Web app: Next.js + TypeScript + Tailwind save-and-retrieve flow (link + video URL)
- [ ] Supabase backend: auth + content metadata + credits ledger
- [ ] AI tag generation (Anthropic Claude, one call per save, hard cap on monthly inference cost)
- [ ] Credit system: 1 credit per saved link, 1 credit per minute of stored video
- [ ] Free tier: 100 credits on signup
- [ ] iOS app: SwiftUI + StoreKit 2 paywall
- [ ] Stripe paywall for the web tier
- [ ] AWS-cost dashboard (so we see the credit-window burn rate)

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] Migration plan from AWS to Cloudflare at month 10 (before the credit window closes)
- [ ] 200-user beta via r/SaaS and IndieHackers
- [ ] Post-mortem at week 12
