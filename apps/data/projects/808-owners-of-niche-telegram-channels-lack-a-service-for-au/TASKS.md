---
id: "808"
slug: owners-of-niche-telegram-channels-lack-a-service-for-au
title: Owners of niche Telegram channels lack a service for automatically finding and organizing cross-promotion with relevant channels without spending hours on manual selection and negotiations
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/m2fxpkkjp1-owners-of-niche-telegram-channels-lac"
  captured: "2026-01-03"
category: marketing
date: "2026-01-03"
tags: [Marketing, Telegram, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Owners of niche Telegram channels lack a service for automatically finding and organizing cross-promotion with relevant channels without spending hours on manual selection and negotiations

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Provision Coolify app + Drizzle migrations
- [ ] Channel-metadata fetcher (polite, rate-limited, public t.me/preview only)
- [ ] Niche-tag rubric (enforced on channel-profile import)
- [ ] Disclosure-template copy (Telegram paid-promo policy)

## Phase 1: Core

- [ ] Channel-profile import: @username + niche tags + language
- [ ] Match search: niche + language + subscriber-band + view-to-subscriber-ratio filters
- [ ] Match detail: per-match view showing the underlying signals (sub count, avg views, comments/post ratio, language, niche tags)
- [ ] Post-swap proposal: one-click, draft included, in-app approve/decline
- [ ] Proposal inbox: chronological, with status (drafted/sent/accepted/declined/executed)
- [ ] Paid cross-promo: Telegram Stars settlement, USDT wallet layer, 8% platform fee
- [ ] Escrow flow: hold until both sides confirm with post-screenshot proof
- [ ] Disclosure template enforced before settlement completes
- [ ] End-to-end test: 2 channels imported → 1 match → 1 swap proposed → 1 paid cross-promo settled

## Phase 2: Deploy

- [ ] Coolify production deploy with daily SQLite backup
- [ ] Free-5-searches + $19/mo unlimited-searches billing (USDT-paid deals skip Stripe)
- [ ] 24h channel-metadata freshness health-check alerts
- [ ] Niche-rubric review queue for first-50 channels per niche
- [ ] Post-mortem at week 14: do match suggestions actually lead to closed cross-promos?
