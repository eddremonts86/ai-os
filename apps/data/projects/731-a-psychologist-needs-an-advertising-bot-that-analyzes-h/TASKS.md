---
id: "731"
slug: a-psychologist-needs-an-advertising-bot-that-analyzes-h
title: A psychologist needs an advertising bot that analyzes her workload and automatically adjusts her ads. She is willing to pay for a solution and is open to discussing the details.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/f9domkol61-a-psychologist-needs-an-advertising-bot"
  captured: "2026-07-20"
category: marketing
date: "2026-07-20"
tags: [Marketing, Productivity, Other]
country: Russia
wtp:
  raw: negotiable / reasonable price
  currency: RUB
  min: 0
  max: 0
  period: month
  mrrMid: 0
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Telegram bot (grammY or node-telegram-bot-api), Yandex Direct / VK Ads APIs]
---
# A psychologist needs an advertising bot that analyzes her workload and automatically adjusts her ads. She is willing to pay for a solution and is open to discussing the details.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Decide the `AdAdapter` interface shape; stub a Yandex Direct adapter
- [ ] Provision Coolify project + Docker image + SQLite volume
- [ ] Wire Telegram bot token via BotFather and long-polling entrypoint
- [ ] Decide policy representation in SQLite (capacity_curve, ad_account, audit_log)
- [ ] File Robokassa / YooKassa merchant application for RUB-denominated billing

## Phase 1: Core

- [ ] Bot commands: `/start`, `/capacity N`, `/stats`, `/pause_ads`, `/resume_ads`, `/history`
- [ ] Yandex Direct OAuth handshake with PKCE; encrypt access + refresh tokens at rest
- [ ] Daily lead-count ingestion (cron 09:00 MSK) per connected campaign into SQLite
- [ ] Capacity profile editor (web dashboard): monthly target + max swing per day
- [ ] Policy engine: rolling 7-day leads vs. capacity → ±X% daily budget; cap at ±20% per change
- [ ] Dry-run mode: each candidate change is logged but not written; operator approves once before live writes
- [ ] Audit log of every bot-applied change with before/after, timestamp, and reason
- [ ] Optional Google / Yandex Calendar freebusy read (opt-in only, aggregate counts)
- [ ] End-to-end test: connect Yandex Direct, set capacity, simulate 14 days of leads, verify two budget changes
- [ ] Russian-language copy across bot, dashboard, and onboarding email

## Phase 2: Deploy

- [ ] Pilot with 3 solo private-practice operators for 60 days
- [ ] Add VK Ads adapter behind the same `AdAdapter` interface (no operator-visible changes)
- [ ] Public launch on Product Hunt / vc.ru
- [ ] Multi-practitioner clinic tier (2–10 practitioners per workspace)
