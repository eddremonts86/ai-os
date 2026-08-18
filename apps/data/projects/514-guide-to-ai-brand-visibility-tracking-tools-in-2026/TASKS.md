---
id: "514"
slug: guide-to-ai-brand-visibility-tracking-tools-in-2026
title: Guide to AI Brand Visibility Tracking Tools in 2026
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo4r4a/guide_to_ai_brand_visibility_tracking_tools_in/"
category: saas
date: "2026-08-14"
---
# Guide to AI Brand Visibility Tracking Tools in 2026

## Phase 0: Scaffold

- [x] Capture problem from Reddit + write SPEC.md skeleton
- [ ] Define DESIGN.md (dashboard palette, table density)
- [ ] Provision Postgres + Redis + Fastify backend
- [ ] BYOK encryption helper (libsodium) + key CRUD endpoints
- [ ] BullMQ workers per engine (stub for each, real impl for ChatGPT)

## Phase 1: Core

- [ ] Brand + prompt CRUD with competitor aliases
- [ ] Per-engine client modules with shared rate-limit + retry policy
- [ ] Citation extractor per engine (Perplexity inline, Gemini structured, Google AI Overviews regex)
- [ ] Share-of-voice rollup query + per-prompt "competitors winning here" view
- [ ] CSV export of prompts × engines × citations for the last 30 days
- [ ] Pricing page with seat-based Stripe Checkout (Pro $49, Agency $199)
- [ ] Usage meter on the dashboard (current week vs. tier cap)
- [ ] End-to-end test: agency signs up → BYOK wired → 200 prompts run → report exported

## Phase 2: Deploy

- [ ] Recruit 3 AEO agencies as design partners
- [ ] Coolify-side deployment of Fastify backend
- [ ] Set up per-engine rate-limit alerts
- [ ] Weekly golden-prompt regression job

---

_Generated automatically by Lúa on 2026-08-14_
