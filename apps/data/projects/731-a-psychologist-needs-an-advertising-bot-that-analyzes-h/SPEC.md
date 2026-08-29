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

## Problem

Elizaveta, a psychologist with her own private practice in Russia, knows the upper bound of clients she can take per month without compromising quality. But the ads she runs to fill her pipeline behave unpredictably: some months the advertising over-shoots and she burns out trying to cope, other months it under-shoots and she loses income. Manually re-tuning campaigns every month is stressful, time-consuming, and outside her area of expertise. She has tried (a) setting the ads up and adjusting them herself — too complicated, too time-consuming; (b) hiring targeting specialists — they don't understand the specifics of psychotherapy work and can't flexibly regulate client flow, and their prices are high; and (c) looking for off-the-shelf solutions that do this automatically in Russia — she has not found any. The problem repeats every month and gets worse during holidays and seasonal peaks.

## Objective

Ship a marketing bot for solo service-providers (therapists, coaches, tutors, lawyers, dentists) that connects to ad-platform accounts (Yandex Direct, VK Ads, Meta) and to a workload signal (calendar, CRM, or a simple "I'm at capacity" button in Telegram), then continuously tunes bid, budget and audience-exposure so that incoming client requests stay close to the operator's stated monthly ceiling — without the operator having to log into the ad account. The MVP is a Telegram bot plus a Yandex Direct adapter that pulls daily lead counts, matches them to the operator's capacity, and applies simple budget / pause rules.

## Target Users

- **Primary:** solo private-practice professionals in the Russian-speaking market (psychologists, psychotherapists, tutors, lawyers) who rely on performance ads and have a hard, personally-known client-capacity ceiling.
- **Secondary:** small clinics and training centres with 2–10 practitioners who each have their own capacity profile and need shared visibility.

## MVP Scope

- A Telegram bot the operator chats with (`/capacity N`, `/pause_ads`, `/resume`, `/stats`).
- One ad-platform adapter (Yandex Direct) via the official API: pull daily lead count, read campaign state, write bid and "enabled/paused" updates.
- A workload signal — either the Telegram "I'm at capacity" / "I have N slots free" button or a one-way Google Calendar / Yandex Calendar freebusy read.
- A simple policy: if 7-day rolling lead count is above the capacity line → lower daily budget by X% (or pause underperforming campaigns); if below → raise daily budget by Y%.
- Audit log of every bot-applied change, viewable in Telegram (`/history`).
- One operator, one ad account, one calendar source — no multi-tenant billing in v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Author is "willing to pay a reasonable price" and "everything is negotiable" — no stated budget cap. Default a sensible SMB-tier subscription price (~1,500–3,000 RUB/month) and validate willingness-to-pay in pilot.
- Russian-language UX in v1 (the operator wrote in Russian); English is post-MVP.
- Must not pass ad-budget money through the tool — the operator's ad accounts stay on Yandex Direct / VK Ads; the bot only adjusts bid and pause state.
- Yandex Direct OAuth flow and rate limits are the launch blocker; the adapter must degrade gracefully (read-only mode) when the token expires.
- Specialist rules of professional practice must be respected — for psychologists, no client-identifying data should ever leave the practitioner's calendar.
