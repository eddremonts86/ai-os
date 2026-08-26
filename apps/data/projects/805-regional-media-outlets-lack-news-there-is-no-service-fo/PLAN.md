---
id: "805"
slug: regional-media-outlets-lack-news-there-is-no-service-fo
title: "Regional media outlets lack news: there is no service for automatically finding local events and topics not yet covered by competitors"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/hap6bnpjo1-regional-media-outlets-lack-news-there-i"
  captured: "2026-01-03"
category: media
date: "2026-01-03"
tags: [Media, AI, Other]
country: Russia
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Regional media outlets lack news: there is no service for automatically finding local events and topics not yet covered by competitors

## Tech Stack

- **Frontend:** React with TypeScript, single-page app served from Coolify.
- **Backend API:** Node.js (TanStack Start) handling newsroom configuration, ingestion scheduling, coverage scoring, and the ranked feed.
- **Database:** SQLite via Drizzle ORM (file-based, fits the Coolify + Docker one-VPS model).
- **Ingestion jobs:** Cron-based fetchers per source type (municipal calendars, court dockets, arbitration filings, procurement, Telegram public RSS, small-business registries).
- **Coverage scoring:** A separate ranking service that compares discovered items against each newsroom's chosen competitor set, refreshed on a 6-hour cadence.
- **Hosting:** Coolify on a single Hetzner CX22 (or equivalent), Docker Compose for app + reverse proxy.

## Architecture

```
Browser ─▶ TanStack Start (SSR + route handlers)
              │
              ├─▶ SQLite (Drizzle) — newsroom config, discovered items, coverage scores
              │
              ├─▶ Ingestion jobs (cron) ─▶ Municipal + court + procurement + Telegram + SMB registries
              │
              └─▶ Coverage scoring service — competitor-set comparison, 6h refresh
```

The discovery feed is a SQL view over the union of all ingestion sources, filtered by region, joined to the coverage-score table that ranks items by low-competitor-coverage first.

## Milestones

1. **M0 — Schema + first ingestion source.** Newsroom config + item tables; municipal calendars live for 1 region. End of week 2.
2. **M1 — Five ingestion sources.** Municipal + court + arbitration + procurement + Telegram public RSS. End of week 5.
3. **M2 — Coverage scoring.** Competitor-set definition + 7-day coverage count per item. End of week 8.
4. **M3 — Editorial dashboard.** Ranked feed, per-item detail drawer, "draft story" export. End of week 11.
5. **M4 — Pricing tiers.** Free / Pro / Enterprise Stripe plans wired. End of week 14.
6. **M5 — Country expansion hook.** Onboarding for a 2nd country with open municipal/court data. Ongoing.

## Risks

- **Ingestion brittleness** — a municipal site changes its HTML and the scraper silently breaks. Mitigation: per-source health-check with a Slack/email alert on 24h ingestion silence; manual re-verification every 90 days.
- **Coverage-score false positives** — a national outlet reporting on a local story counts as a local competitor by mistake. Mitigation: competitor-set definition requires a region tag + a recency window; review UI shows the matches so the editor can exclude.
- **Telegram-channel availability** — public RSS disappears or moves behind a wall. Mitigation: per-channel health-check + automatic replacement with a public alternative (vk.com, regional forum) where available.
- **Editorial trust** — a surfaced item is wrong or a duplicate and the editor loses faith in the feed. Mitigation: source attribution is mandatory on every item, and the "draft story" export includes the primary record link so the editor can verify before publishing.
