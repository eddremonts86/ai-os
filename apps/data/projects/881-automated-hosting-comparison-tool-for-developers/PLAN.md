---
id: "881"
slug: automated-hosting-comparison-tool-for-developers
title: Automated hosting comparison tool for developers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/djk3np9401-automated-hosting-comparison-tool-for-de"
  captured: "2025-10-26"
category: dev
date: "2025-10-26"
tags: [Dev]
country: Russia
wtp:
  raw: "300–500 RUB ($5–6) per month"
  currency: USD
  min: 5
  max: 6
  period: month
  mrrMid: 5.5
tech: [Go scrapers with per-provider adapters, PostgreSQL with historical price snapshots, HTMX server-rendered filter UI, Playwright for JS-rendered pricing pages, Cron scheduler, CSV and JSON export]
---
# Automated hosting comparison tool for developers

## Tech Stack

- **Scrapers in Go:** one adapter per provider, because pricing pages have nothing in common and a generic parser breaks on the first redesign. Go keeps many concurrent fetches cheap, which matters when the whole product must run at $5–6 per user per month.
- **Playwright, selectively:** some providers render pricing client-side and cannot be read from HTML alone. Used only for those, since a headless browser per provider per refresh is the expensive path.
- **PostgreSQL with snapshots:** each refresh writes a new plan snapshot rather than overwriting. That is what lets the tool show when a price was last verified, and later, whether it moved.
- **HTMX server-rendered UI:** the interface is filter, sort, compare. Server-rendered filtering is fewer moving parts than a client-side app and keeps the tool fast on a small host.
- **Cron scheduler:** refresh cadence per provider, tuned by how often that provider actually changes prices.
- **Export:** CSV and JSON, so the comparison can go back into the spreadsheet workflow the author already uses.

## Architecture

Two halves with a normalised catalogue between them. Collection is a set of independent per-provider adapters, each responsible for turning one vendor's pricing page into plan rows: price, CPU, RAM, disk, and data centre locations. Normalisation is the hard part and is deliberately explicit — a mapping layer with recorded rules, not inference, so when two providers describe a vCPU differently the tool's assumption is inspectable rather than silent. The read side is a filter over the latest snapshot, with a last-verified timestamp on every row.

The scheduler is where the price ceiling shows up in the design. Refreshing every provider hourly is affordable for nobody at $5–6 a month, so cadence is per-provider and driven by observed volatility: providers that change prices rarely get checked rarely.

## Milestones

1. **M0 — Normalisation schema.** Define the canonical plan shape and the spec-mapping rules across providers. Get this wrong and every comparison downstream is misleading. End of week 2.
2. **M1 — Three provider adapters.** Three real providers scraped, normalised and snapshotted, with a last-verified timestamp. End of week 4.
3. **M2 — Filter and compare UI.** Price, specs and data centre location filters, sorting, side-by-side view, CSV and JSON export. End of week 6.
4. **M3 — Adapter breakage detection.** Alert when a provider's page shape changes or a scrape returns implausible values, before users see wrong prices. End of week 8.
5. **M4 — Coverage expansion.** Ten providers, with refresh cadence tuned per provider against observed price volatility. End of week 12.
6. **M5 — Paid launch.** Subscription at the author's stated $5–6 band; measure infrastructure cost per subscriber. End of week 14.

## Risks

- **Adapter maintenance is a permanent cost.** Each provider redesign breaks one adapter, and that upkeep does not shrink with scale. At $5–6 per subscriber per month, the number of providers the tool can afford to cover is set by maintenance hours, not ambition.
- **Wrong prices are worse than missing ones.** The author is replacing tables he parsed himself and knows to be right. A single stale or misnormalised price destroys the reason to use the tool, which is why breakage detection is a milestone rather than a nice-to-have.
- **Spec normalisation may not be honest across vendors.** vCPU, burst behaviour and disk types are not described comparably by different providers. Where a genuine equivalence does not exist, the tool has to show the raw claim instead of inventing a comparable number.
- **Provider objections and blocking.** Republished pricing and automated fetching may draw either technical blocks or legal complaints. No affiliate or API relationship is mentioned in the source.
- **Low frequency, low price.** The author needs this 2–3 times a month and pays $5–6. That is a narrow revenue base per user for a product whose cost is continuous, so subscriber count has to carry it.
