---
id: "199"
slug: a-psychologist-needs-an-advertising-bot-that-analyzes-h
title: A psychologist needs an advertising bot that analyzes her workload and automatically adjusts her ads. She is willing to pay for a solution and is open to discussing the details.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/f9domkol61-a-psychologist-needs-an-advertising-bot"
category: marketing
date: "2026-07-20"
tags: [Marketing, Productivity, Other]
country: Russia
tech: [Python, FastAPI, PostgreSQL, Yandex Direct API, VK Ads API, Telegram Bot API]
---
# A psychologist needs an advertising bot that analyzes her workload and automatically adjusts her ads. She is willing to pay for a solution and is open to discussing the details.

## Phase 0: Scaffold

- [ ] Create project folder under apps/
- [ ] Initialize git repo
- [ ] Write SPEC.md skeleton
- [ ] Provision Yandex Cloud Functions and Managed PostgreSQL
- [ ] Register Yandex Direct and/or VK Ads developer app and obtain OAuth token

## Phase 1: Core

- [ ] Calendar connector (Google Calendar first, YCLIENTS second)
- [ ] Ad-platform connector (Yandex Direct first)
- [ ] Rule engine: occupancy → bid/budget adjustment
- [ ] Audit log of every change with revert button
- [ ] Telegram daily summary
- [ ] Manual override and pause-for-N-days control
- [ ] End-to-end test with one real user for 2 weeks

## Phase 2: Deploy

- [ ] Production deploy on Yandex Cloud
- [ ] Pilot with 3 Russian solo practices
- [ ] Russian-language privacy policy and 152-FZ review
- [ ] Onboarding playbook
- [ ] Public launch on Yandex Cloud Marketplace
