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

## Tech Stack

- **Frontend / dashboard:** React + TypeScript SPA served by TanStack Start, for the operator's web view (settings, history, capacity).
- **Backend API:** Node.js + TanStack Start server functions, SQLite via Drizzle ORM, single Coolify instance behind Docker.
- **Telegram bot:** `grammY` (TypeScript-native, well-maintained). Long-polling is fine for v1.
- **Ad-platform adapters:** a thin `AdAdapter` interface with a Yandex Direct implementation (REST API + OAuth). VK Ads and Meta are pluggable later.
- **Workload signal:** Telegram "set capacity" button for v1; optional Google Calendar / Yandex Calendar freebusy read behind a feature flag.
- **Auth:** Telegram-login for the operator; no separate password. Single-operator per workspace.
- **Billing:** Russian-friendly — Robokassa or YooKassa for RUB-denominated subscriptions.

## Architecture

The Telegram bot is the operator's primary surface. It owns commands, conversational state, and the daily cron that asks each adapter for the previous day's lead count and applies budget / bid changes. The web dashboard is for setup (connecting Yandex Direct, defining the capacity curve) and review (the audit log). SQLite stores operators, ad-account connections, capacity profiles, the policy parameters, and the audit trail of every bot-applied change.

```
Operator ──▶ Telegram bot (grammY)
                 │
                 ├─▶ /capacity N         ──▶ Drizzle/SQLite (capacity_profile)
                 ├─▶ /stats              ──▶ AdAdapter ──▶ Yandex Direct API
                 ├─▶ /history            ──▶ Drizzle/SQLite (audit_log)
                 │
                 └─▶ daily cron 09:00 MSK
                        │
                        ├─▶ read lead counts (AdAdapter)
                        ├─▶ read calendar freebusy (optional)
                        ├─▶ evaluate policy
                        └─▶ write bid/budget changes (AdAdapter) ──▶ audit_log
                                            │
Web dashboard (TanStack Start) ◀────────────┘
                 │
                 └─▶ Stripe/Robokassa webhook ──▶ Drizzle/SQLite (subscription)
```

## Milestones

1. **M0 — Spec freeze + Yandex Direct adapter skeleton.** SPEC.md approved; `AdAdapter` interface designed; stub Yandex adapter returns canned data. End of week 1.
2. **M1 — Telegram bot MVP.** Bot runs locally; `/capacity`, `/stats`, `/pause`, `/resume`, `/history` work against in-memory state. End of week 3.
3. **M2 — Real Yandex Direct integration.** OAuth handshake, encrypt stored tokens, daily lead-count read, daily bid/budget write with audit log. End of week 5.
4. **M3 — Policy engine.** Capacity-aware rule: 7-day rolling lead vs. capacity → ±X% budget or pause. Dry-run mode before any write. End of week 7.
5. **M4 — Web dashboard + billing.** Operator onboarding, capacity curve editor, history view; Robokassa integration. End of week 9.
6. **M5 — Pilot.** 3 solo private-practice operators (psychology / tutoring) onboarded for 60 days; weekly check-ins; iterate on policy parameters. End of week 13.

## Risks

- **Over-shoot → burnout.** The whole product exists to prevent this; if the policy is too aggressive the bot will *cause* the very pain it claims to solve. Cap per-day change at ±20% and require explicit confirmation above that.
- **Yandex Direct API partner-tier access.** SMB-tier OAuth is workable, but rate limits and write-permission scopes need early validation; a partner-program request should be filed in parallel.
- **Calendar vs. capacity-button accuracy.** Calendar reads are precise but expose appointment metadata; the manual button is dumb but privacy-safe. Default to the button, treat calendar as opt-in.
- **RUB pricing + Russian payments.** Robokassa / YooKassa are required for the operator's market; subscription must be visible in rubles, not dollars.
- **Domain-specific compliance.** For psychology, storing any client-identifying data scraped from calendars is a non-starter. Freebusy aggregate counts only; never per-event titles.
