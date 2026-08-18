---
id: "199"
slug: a-psychologist-needs-an-advertising-bot-that-analyzes-h
title: A psychologist needs an advertising bot that analyzes her workload and automatically adjusts her ads. She is willing to pay for a solution and is open to discussing the details.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/f9domkol61-a-psychologist-needs-an-advertising-bot"
category: marketing
date: "2026-07-20"
tags: [Marketing, Productivity, Other]
country: Russia
tech: [Python, FastAPI, PostgreSQL, Yandex Direct API, VK Ads API, Telegram Bot API]
---
# A psychologist needs an advertising bot that analyzes her workload and automatically adjusts her ads. She is willing to pay for a solution and is open to discussing the details.

## Tech Stack

Python service on Yandex Cloud Functions (ru-central1). FastAPI for the webhook surface. PostgreSQL on Yandex Managed PostgreSQL for calendar snapshots, rule definitions, and the audit log. Yandex Direct and VK Ads API clients via official SDKs. Telegram Bot API for the daily summary.

## Architecture

Two scheduled paths. A pull path runs every 15 minutes, fetches free/busy from the calendar, computes a load score, and emits an adjustment intent. An apply path receives the intent, calls the ad-platform API with the new bids or budgets, and logs the result. A daily summary path aggregates the day's changes into a Telegram message. Manual override and audit log are exposed in a small admin UI.

## Milestones

M0 — connector to one calendar plus one ad platform working end-to-end with hardcoded rules. M1 — rule editor UI for the user to define their own occupancy thresholds. M2 — Telegram summary with weekly rollup. M3 — pilot with 3 Russian solo-practice professionals. M4 — public launch behind Yandex Cloud Marketplace.

## Risks

Yandex Direct API has had multi-hour outages; the bot must keep a safe-mode (last known good bid) when APIs are unreachable. Russian personal-data law (152-FZ) requires Russian-only storage of calendar data, ruling out any third-party SaaS that processes data outside Russia.
