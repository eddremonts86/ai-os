---
id: "742"
slug: need-a-tool-that-automatically-finds-people-in-social-m
title: Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/social/6stv96yp21-need-a-tool-that-automatically-finds-peo"
category: social
date: "2026-04-28"
tags: [Social, Marketing, Business, Startups, AI, Productivity, Other]
country: USA
wtp:
  raw: $50/month
  currency: USD
  min: 50
  max: 50
  period: month
  mrrMid: 50
tech: [TypeScript, Node.js, BullMQ job queue, Postgres with Drizzle ORM, OpenAI or Anthropic API, Apify + Bright Data scraping, Coolify]
---
# Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (criteria builder chrome, results table, quota dashboard, CSV preview)
- [ ] Provision Coolify project + Docker image + Postgres + Redis volumes
- [ ] Wire Resend email-link auth (single workspace per account)
- [ ] Define `PlatformAdapter` interface and ship a stub for X (Twitter)
- [ ] Legal review: per-platform ToS for LinkedIn, X, Facebook, TikTok scraping patterns

## Phase 1: Core

- [ ] Criteria builder UI: platform picker (LinkedIn / X / FB / TikTok), topic keywords, posting cadence (≥ N posts/week for last M weeks), recency window, language, bio signals
- [ ] BullMQ job queue wired to Postgres + Redis; one job per platform per query
- [ ] Apify + Bright Data managed-scraping integration; per-platform rate-limit aware; per-user daily quotas enforced
- [ ] `PlatformAdapter` for LinkedIn (public posts + profiles only)
- [ ] `PlatformAdapter` for Facebook (public pages + groups; no private content)
- [ ] `PlatformAdapter` for TikTok (deferrable — ship only if ToS review clears it by end of M3)
- [ ] `candidates_raw` table populated by adapters; ages out after 30 days
- [ ] Matching engine: LLM-assisted scorer (OpenAI or Anthropic) with criteria-satisfaction metadata; cost capped at ≤ $0.10/query
- [ ] `candidates` table with the structured hit list (profile URL, handle, platform, top posts, match reason)
- [ ] CSV export of the hit list
- [ ] Quota dashboard: visible per-platform quota usage, remaining searches, daily reset
- [ ] Stripe Subscriptions ($50/month) + 7-day trial with 3 searches; webhook gates workspace after trial
- [ ] In-app feedback prompt after CSV download: "would you actually contact this candidate?" — used to tune criteria templates (no PII trained on)
- [ ] End-to-end test: user signs up, defines criteria (LinkedIn + X, ≥ 1 post/week for 8 weeks, English, bio mentions "building"), receives ≥ 50 candidates in < 24 h, downloads CSV

## Phase 2: Deploy

- [ ] Move Stripe to live mode
- [ ] Onboard 20 pilot workspaces (founders, devRel, recruiters)
- [ ] Weekly match-quality review with the pilot cohort for 4 weeks
- [ ] Set up status page + per-platform ToS-change monitoring (legal-news RSS + Apify / Bright Data advisories)
- [ ] Post-mortem after week 12; decide v2 scope (Pro tier with team workspaces, additional platforms)
