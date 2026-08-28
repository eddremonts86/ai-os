---
id: "304"
slug: need-a-ai-bot-for-analyzing-car-and-real-estate-prices
title: Need a AI-bot for analyzing car and real estate prices
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/lbdzym5un1-need-a-ai-bot-for-analyzing-car-and-real"
category: ai
date: "2025-11-13"
tags: [AI, Other]
country: Russia
tech: [Python, FastAPI, Postgres, Telegram Bot API, Avito API, CIAN API, Anthropic Claude API]
---
# Need a AI-bot for analyzing car and real estate prices

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (verdict card, comparable table, history view)
- [ ] Provision VPS in a Russia-adjacent region + Postgres
- [ ] Register Telegram bot via @BotFather + obtain token
- [ ] Apply for Avito and CIAN API access (or document the scraper fallback)

## Phase 1: Core

- [ ] FastAPI webhook endpoint for Telegram updates; long polling in dev, webhook in prod
- [ ] URL classifier: detect Avito auto vs Avito real estate vs CIAN vs unknown
- [ ] Avito auto comparator: fetch listing, extract model / year / mileage, query comparables within year ±2 and mileage ±20%, last 30 days
- [ ] CIAN real-estate comparator: fetch listing, extract rooms / area / floor / district, query comparables within area ±10% and rooms ±1, last 30 days
- [ ] Verdict engine: median + p25/p75, classify underpriced (p75)
- [ ] Claude call to generate one-line justification with cited attributes
- [ ] Conversation history per chat_id in Postgres; "compare with previous" reply path
- [ ] End-to-end test: paste 10 URLs across both categories, all return a verdict with ≥ 5 comparables

## Phase 2: Deploy

- [ ] Wire paid tier (RUB/month) via a Russian-friendly payment provider
- [ ] Recruit 100 pilot users in Moscow / SPb Telegram groups
- [ ] Systemd-managed FastAPI on the VPS + Nginx reverse proxy
- [ ] Status page + per-host scraper health monitoring
- [ ] Post-mortem after week 10 with the pilot cohort
