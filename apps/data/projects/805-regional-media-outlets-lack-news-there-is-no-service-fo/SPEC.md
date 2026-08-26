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

## Problem

A regional newsroom in Russia has no fast way to surface local events, municipal decisions, court filings, and small-business announcements that competitors in the same city haven't picked up yet. National news wires cover federal stories; local reporters either miss the small stories or burn hours on municipal-site scraping. The post names the failure: stories that should run never do, because the discovery step is manual and slow, and a competitor with one extra staffer picks up the beat.

## Objective

Ship a local-event-and-topic discovery feed for regional newsrooms that ingests municipal calendars, court dockets, court-of-arbitration decisions, local-government procurement feeds, regional Telegram channels, and small-business registries — and surfaces items that have low coverage in the newsroom's defined competitor set, ranked by likely reader interest.

## Target Users

- Primary: editors and reporters at regional newsrooms in Russia (and later, any country with open municipal + court data) who own the daily topic-board responsibility.
- Secondary: freelance correspondents and small independent local-news blogs serving the same regions.

## MVP Scope

- Ingestion jobs for: municipal event calendars, court dockets, arbitration filings, government procurement (zakupki), regional Telegram channels via public RSS where available, and small-business registry changes.
- Coverage check: per discovered item, count how many outlets in the newsroom's defined competitor set have run a similar story in the last 7 days. Surface items with low coverage.
- Editorial dashboard: ranked feed with source attribution, link to the primary record, and a "draft story" button that opens the newsroom's CMS or exports a brief markdown summary.
- Per-region configuration: the newsroom picks the region, the language, and the competitor set to measure coverage against.
- No automatic story generation in v1; the product is the discovery feed, not the published article.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/media/hap6bnpjo1-regional-media-outlets-lack-news-there-i` follows the constraints in `805-.../SPEC.md` and the chosen stack (React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM). The visual language follows `DESIGN.md`: neutral surface, single primary accent, dense table-driven feed layout for the discovery dashboard.

For Russia, the defaults lean toward Cyrillic primary with Latin transliteration toggle, RUB currency glyph where procurement amounts are shown, and DD.MM.YYYY date format. The product itself is multilingual on launch. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface, one accent for "low competitor coverage" items, one muted accent for items competitors have already covered. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for legal-record IDs and procurement numbers. Type scale is small (4 steps).

**Density** — table-driven feed with sortable columns: discovered-at, source, coverage-count, region. Generous spacing on the per-item detail drawer.

**Motion** — minimal: page transitions only when the user explicitly navigates between feed and item detail.

## Constraints

- Coverage counts are computed against the newsroom's chosen competitor set only; no global "is this covered anywhere" claim.
- Source attribution is mandatory on every surfaced item — primary record link, ingestion timestamp, source type.
- Telegram-channel ingestion is read-only and respects Telegram's public-RSS availability; no scraping of private channels.
- Must run on a $5/month VPS via Coolify + Docker; no managed services that would push infra cost above that ceiling.