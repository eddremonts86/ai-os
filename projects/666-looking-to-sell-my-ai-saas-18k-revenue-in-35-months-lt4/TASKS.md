---
id: "666"
slug: looking-to-sell-my-ai-saas-18k-revenue-in-35-months-lt4
title: "Looking to Sell my AI SaaS: $1.8K revenue in 3.5 months, <$45/month in costs"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpvny2/looking_to_sell_my_ai_saas_18k_revenue_in_35/"
category: saas
date: "2026-08-16"
tags: [saas, twitter, ai, byok]
tech: [Next.js, TypeScript, Tailwind CSS, Cloudflare, Dodo Payments, Resend, Umami]
---
## Phase 0: Scaffold

- [ ] Provision `apps/666-looking-to-sell-my-ai-saas-18k-revenue-in-35-months-lt4/` from the SaaS template
- [ ] Initialize git, add the standard `.gitignore` and a `LICENSE`
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens
- [ ] Wire the Tailwind config to the DESIGN.md colour, type, and spacing tokens
- [ ] Provision a Cloudflare Pages project pointed at the repo
- [ ] Wire Dodo Payments test mode, Resend sandbox, and Umami to the dev build
- [ ] Stand up the BYOK vault: encrypted-at-rest storage for customer OpenAI / Anthropic / xAI keys

## Phase 1: Core

- [ ] BYOK auth (OpenAI / Anthropic / xAI): key paste → encrypted-at-rest storage
- [ ] Browser extension (manifest v3) that reads the active tweet and pushes it to the web app
- [ ] Reply drafting: 3 contextual candidates in the customer's voice
- [ ] Custom style training: paste 20-50 example posts → style profile
- [ ] Keyword and conversation monitoring with a daily digest via Resend
- [ ] Target account watchlist + outreach / DM drafts (draft-only, never auto-send)
- [ ] Telemetry (opt-in): reply count, draft acceptance rate, anonymized

## Phase 2: Deploy

- [ ] Create GitHub repo and provision Cloudflare Pages + Workers for the web app
- [ ] Wire Dodo Payments (recurring + lifetime tiers) and Resend for transactional email
- [ ] Run a 200-indie-founder closed beta via r/SaaS and IndieHackers
- [ ] Post-mortem at week 12
