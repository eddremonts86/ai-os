---
id: "200"
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
tech: [Next.js 14, TypeScript, PostgreSQL, Twitter API v2, LinkedIn API, BullMQ + Redis]
---
# Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.

## Phase 0: Scaffold

- [ ] Create project folder under apps/
- [ ] Initialize git repo
- [ ] Twitter/X developer account application
- [ ] LinkedIn developer app + Marketing Developer Platform access
- [ ] Provision Postgres + Redis on Hetzner

## Phase 1: Core

- [ ] Structured filter UI (recency, keyword, language, follower band)
- [ ] BullMQ workers with per-platform rate-limit tokens
- [ ] Deduplication across runs
- [ ] CSV export
- [ ] Natural-language criteria → structured query via LLM
- [ ] Behavioural ranking score
- [ ] Webhook delivery (Zapier-compatible)

## Phase 2: Deploy

- [ ] Production deploy
- [ ] Pilot with 5 paying customers at $50/month
- [ ] Monitoring dashboards for per-platform quota usage
- [ ] Public launch
