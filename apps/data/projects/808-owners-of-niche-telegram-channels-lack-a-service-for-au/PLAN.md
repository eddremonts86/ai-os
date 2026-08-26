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

## Tech Stack

- **Frontend:** React with TypeScript, single-page app served from Coolify.
- **Backend API:** Node.js (TanStack Start) handling channel-profile import, match search, proposal inbox, and settlement.
- **Database:** SQLite via Drizzle ORM (file-based, fits the Coolify + Docker one-VPS model).
- **Channel-metadata fetcher:** A polite, rate-limited fetcher for public t.me/preview pages — no login-required fetches, no private-channel scraping.
- **Settlement:** Telegram Stars API for Telegram-native settlement; USDT via a small wallet layer (no fiat custody).
- **Hosting:** Coolify on a single Hetzner CX22 (or equivalent), Docker Compose for app + reverse proxy.

## Architecture

```
Browser ─▶ TanStack Start (SSR + route handlers)
              │
              ├─▶ SQLite (Drizzle) — channels, matches, proposals, settlements
              │
              ├─▶ Channel-metadata fetcher (polite, rate-limited)
              │
              └─▶ Settlement layer ─▶ Telegram Stars API + USDT wallet
```

The match search is a SQL query joining channel metadata (niche tags, language, subscriber band, view-to-subscriber ratio) against the requesting channel's profile. Proposals and settlements are state machines: drafted → sent → accepted/declined → executed → settled.

## Milestones

1. **M0 — Channel import + metadata fetcher.** Public t.me/preview ingestion; no login scraping. End of week 2.
2. **M1 — Match search.** Niche + language + subscriber-band + view-to-subscriber-ratio filters. End of week 5.
3. **M2 — Post-swap proposal flow.** One-click proposal, in-app approve/decline, draft included. End of week 8.
4. **M3 — Paid cross-promo + escrow.** Telegram Stars settlement, USDT wallet layer, 8% platform fee. End of week 11.
5. **M4 — Free + $19 plans.** Stripe-free billing for USDT-paid deals; $19/mo for unlimited match searches. End of week 14.

## Risks

- **Channel-metadata brittleness** — t.me/preview HTML changes and the fetcher silently breaks. Mitigation: per-channel health-check alert on 24h metadata-freshness silence; fallback to cached snapshot with explicit "last updated" timestamp.
- **Settlement dispute** — a paid cross-promo is delivered but the receiving channel claims it never ran. Mitigation: post-screenshot proof required on both sides; escrow holds until both confirm.
- **Match-quality drift** — niche tags are self-reported and inconsistent. Mitigation: per-niche rubric the platform enforces; review queue for first-50 channels per niche to seed the rubric.
- **Telegram-policy shift** — Telegram changes the cross-promo landscape (e.g. paid promo must be disclosed in-post). Mitigation: explicit disclosure template enforced by the platform; settlement blocked if disclosure missing.
