---
id: "4210"
slug: the-economic-atlas-a-data-first-dashboard-for-comparing
title: "The Economic Atlas: a data-first dashboard for comparing countries"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508704"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# The Economic Atlas: a data-first dashboard for comparing countries

## Tech Stack

- **A web app** at theeconomicatlas.com with the three views (Compare, My Dashboard, country pages) over the same data.
- **An hourly rebuild pipeline** that fetches data from ONS, FRED, Eurostat, e-Stat and the Bank of Japan, MoSPI, the Bank of Korea, the OECD, and the World Bank.
- **A data store** that holds the numbers and the per-source trace (which official source the number came from, when it was fetched, when the source published it).
- **A country / region catalog** that covers Europe, the Americas, Asia, Africa, and the Middle East.
- **A "Get in touch" surface** for reader submissions of missing, wrong, or worth-adding data.
- **A G7-economy live entry surface** as the landing page's primary view.
- **A traceable-source badge per number** so the reader can see which official source the number came from.

## Architecture

The architecture has three layers: the data ingestion layer (the hourly rebuild pipeline), the data store (the numbers with the per-source trace), and the web app (the three views over the same data).

The data ingestion layer is the unit of trust the dashboard ships. Every hour, the pipeline fetches data from each of the eight official sources (ONS, FRED, Eurostat, e-Stat and the Bank of Japan, MoSPI, the Bank of Korea, the OECD, World Bank). Each fetched number is stamped with the source it came from, the fetch timestamp, and the source's publish timestamp. The pipeline is the source of the hourly-freshness guarantee.

The data store holds the numbers and the per-source trace. A number without a traceable source is a sourcing breach; a number older than the hourly window is a freshness breach. The data store is read by the web app; the data store is not re-fetched by the views.

The web app has three views over the same data. Compare is a side-by-side country comparison on the same metric. My Dashboard is the reader's saved metrics. Country pages are a per-country breakdown. The three views read the same data; the three views never recompute or re-fetch the data. A view that recomputes is a view-isolation failure.

The G7-economy live entry surface is the landing page's primary view. The reader sees the G7 countries on the dashboard's most-watched metrics and can drill into a per-country breakdown, build a custom dashboard, or run a side-by-side Compare. The "Get in touch" surface is for reader submissions of missing, wrong, or worth-adding data.

## Milestones

1. **M1 — Country / region catalog** — the country list, the regional grouping (Europe, the Americas, Asia, Africa, the Middle East), the G7 entry set.
2. **M2 — Hourly rebuild pipeline** — the per-source fetcher (ONS, FRED, Eurostat, e-Stat, MoSPI, OECD, World Bank), the per-source fetch success metric, the per-source publish-timestamp stamp.
3. **M3 — Data store** — the per-source trace, the freshness check, the view-isolation guarantee.
4. **M4 — Compare view** — the side-by-side country comparison on the same metric, reading from the data store.
5. **M5 — My Dashboard view** — the reader's saved metrics, reading from the data store.
6. **M6 — Country pages** — the per-country breakdown, reading from the data store.
7. **M7 — G7-economy live entry** — the landing page's primary view, the drill-down into Compare / My Dashboard / country pages.
8. **M8 — "Get in touch" surface** — the reader submissions, the triage, the roadmap (public or private).
9. **M9 — Traceable-source badge per number** — the per-source trace the reader sees, the source-link the reader can click.

## Risks

- **Hourly-freshness breach** — a number older than the hourly window is on the dashboard. Mitigation: the freshness check is a first-class metric; the dashboard surfaces a "stale" badge for numbers that exceed the window; the hourly rebuild is the unit of trust.
- **Source-fetch failure** — an official source returns an error during the hourly fetch. Mitigation: the per-source fetch success rate is a metric; the dashboard surfaces a "source changed" or "stale" warning when a source's numbers are stale; the pipeline retries with backoff.
- **View-isolation regression** — a Compare view recomputes the number instead of reading the data store. Mitigation: the view-isolation guarantee is a structural property of the web app; the Compare / My Dashboard / country-page views read the same data store.
- **Regional coverage gap** — a country outside the five regions is added to the dashboard without coverage. Mitigation: the regional coverage is a metric; the country / region catalog is the source of truth for what the dashboard covers.
- **Source-license change** — an official source changes its terms and requires a key or a paid tier. Mitigation: the dashboard surfaces a "source changed" warning; the pipeline switches to a different official source where possible; the reader sees the source-trail update.
- **Two sources disagree** — two official sources publish different numbers for the same metric. Mitigation: the dashboard picks a canonical source per metric and surfaces the choice in the traceable-source badge; the reader sees the choice.
- **Reader-submission triage overload** — the "Get in touch" surface fills with submissions the team cannot triage. Mitigation: the dashboard surfaces a public roadmap of accepted submissions; the team triages publicly; the reader sees the queue.
