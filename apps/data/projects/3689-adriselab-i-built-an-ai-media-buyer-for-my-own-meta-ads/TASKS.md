---
id: "3689"
slug: adriselab-i-built-an-ai-media-buyer-for-my-own-meta-ads
title: AdRiseLab – I built an AI media buyer for my own Meta ads
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484708"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
wtp:
  raw: "$39/month (Starter), $99/month (Pro), $249/month (Scale)"
  currency: USD
  min: 39
  max: 249
  period: month
  mrrMid: 99
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL, Meta Marketing API, Stripe]
---
# AdRiseLab – I built an AI media buyer for my own Meta ads

## Phase 0: Scaffold

- [x] Capture problem from HackerNews Show HN + write SPEC.md skeleton
- [ ] Stand up the Next.js monorepo (marketing site + `/app` workspace), Tailwind + design tokens wired to DESIGN.md
- [ ] Provision Postgres + Redis + the FastAPI AI service skeleton behind the same Vercel-or-equivalent deployment
- [ ] Meta Marketing API app registered, OAuth2 flow implemented, account structure read verified against a real sandbox account
- [ ] Stripe account set up with three products (Starter $39, Pro $99, Scale $249), test mode webhook working
- [ ] The "AI cannot be accountable for ad spend" architectural rule documented in the codebase as a code-review checklist item, so removing the human gate is a deliberate PR not a toggle

## Phase 1: Core

- [ ] `meta_client/` module: OAuth token refresh, rate-limit aware retry, campaign / ad set / creative CRUD, insight rollups with hourly granularity
- [ ] Edit-in-place creative refresh path verified on a sandbox account to preserve the learning phase across the refresh
- [ ] Creative generation pipeline: product URL → asset extraction → 5 structurally distinct Meta-ready creatives in the platform's preferred aspect ratios, each tagged with its hook type and structural pattern
- [ ] Fatigue detector: hourly cron, per-creative scoring against frequency ≥ 3.0, hook-rate drop ≥ 25% from rolling baseline, CPA drift; replacement variants pre-generated before the flag fires
- [ ] AI Media Buyer copilot: chat-shaped surface, connected-account context, ranked, specific recommendations with cited metrics; recommendation history persisted with approve / dismiss actions
- [ ] Approval gate enforced server-side on every Meta spend-changing endpoint — including future endpoints — so the architectural rule cannot be bypassed by adding a new route
- [ ] Competitor intelligence module: Meta Ad Library search at tiered rate (20 / 60 / 100 per month), tag by hook type + format, use run duration as the performance proxy
- [ ] Stripe credit ledger with metered top-ups, webhook updates `credit_balance`, free audit + 10 credits on signup with no card
- [ ] ROI calculator on the public site wired to live arithmetic: monthly Meta spend × current creatives × cost per creative → comparison to the Starter plan
- [ ] End-to-end test: connect a sandbox Meta account, generate 5 creatives from a product URL, attach them to a real ad set, observe one fatigue cycle, approve the replacement, verify credit math

## Phase 2: Deploy

- [ ] Move Stripe to live mode, KYC on the company entity
- [ ] Onboard 10 design partners across the three tiers (1 solo founder on Starter, 6 brands on Pro, 3 agencies on Scale)
- [ ] Public status page (Meta API health, generation gateway health, billing reconciliation lag) and an on-call rotation
- [ ] Cohort review at week 20 to decide whether the approval loop has earned any loosening, and publish the audit either way
- [ ] Public launch post that links to the founder's article as the canonical long-form position on the category
