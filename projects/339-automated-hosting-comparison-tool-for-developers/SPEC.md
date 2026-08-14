---
id: "339"
slug: automated-hosting-comparison-tool-for-developers
title: Automated hosting comparison tool for developers
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/dev/djk3np9401-automated-hosting-comparison-tool-for-de"
category: dev
date: "2025-10-29"
tags: [Dev]
country: Russia
tech: [Python (FastAPI), Puppeteer (headless Chrome) for live probes, Postgres + TimescaleDB, Telegram Bot API, React + Vite]
---
# Automated hosting comparison tool for developers

## Problem

A Russian developer evaluating hosting for a small SaaS or a personal project currently visits 5-7 vendor pages, copies specs into a spreadsheet, and tests pricing each time a promo changes. The work is mechanical but its volume is high - every new project, every renewal cycle, every vendor price change re-opens the spreadsheet. The poster wants an automated comparison tool that keeps the data fresh without rebuilding the spreadsheet.

## Objective

Ship a hosting comparison tool for Russian developers that ingests public vendor pricing and capability data on a daily schedule, runs an on-demand live probe for latency and TTFB from a Russian vantage point, and lets a developer pick a config (CPU, RAM, bandwidth, region) and see ranked vendors in under 10 seconds.

## Target Users

- Russian freelance developers choosing hosting for a new client project.
- In-house engineering teams at Russian SaaS companies evaluating a move or a renewal.
- DevOps leads at Russian SMBs who want an internal benchmark, not a marketing comparison page.

## MVP Scope

- Vendor catalog: >= 12 hosting vendors with prices in RUB and supported regions.
- Config selector: vCPU, RAM, storage, bandwidth, OS, region (RU-EU, RU-CIS, RU-MSK, RU-SPB), support tier.
- Daily price/capability ingest: pull vendor pricing pages and parse; flag anomalies.
- On-demand live probe: lightweight HTTP probe from a Moscow vantage point, latency + TTFB + cold-start, 3 runs averaged.
- Ranking view: by effective price, by latency, by SLA presence, by support tier.
- Telegram bot: 'Compare 2c 4g EU ssd' returns a ranked list within the chat.
- CSV export of the ranked list for an internal decision.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/dev/djk3np9401-automated-hosting-comparison-tool-for-` follows the constraints in `339-.../SPEC.md` and the chosen stack (Python (FastAPI), Puppeteer (headless Chrome) for live probes, Postgres + TimescaleDB). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Live probe rate-limited per user; one probe per vendor per minute.
- Vendors must have a public Russian-language pricing page; opaque enterprise pricing is excluded.
- Operates only on hosting vendors that have a documented public probe endpoint (TCP/80 or TCP/443).
