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

## Value Proposition

An hourly-updating, data-first dashboard for comparing countries, with every number traced back to one of the official sources (ONS, FRED, Eurostat, e-Stat and the Bank of Japan, MoSPI, the Bank of Korea, the OECD, World Bank). Compare, My Dashboard, and country pages are different views of the same data, never a different version. No commentary, no forecasts, no opinion — just official figures, rebuilt automatically from source every hour.

The coverage spans Europe, the Americas, Asia, Africa, and the Middle East. The entry point is the G7-economy live surface; the reader can drill into a per-country breakdown, build a custom dashboard, or run a side-by-side Compare.

**One-liner:** An hourly-updating, data-only dashboard for comparing countries across five regions, with every number traced back to one of eight official sources and no commentary, forecasts, or opinion.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Readers comparing countries | Want a data-first dashboard without commentary or forecasts. |
| Researchers | Want hourly updates from official sources. |
| Analysts | Want Compare, My Dashboard, and country pages as different views of the same data. |
| Journalists | Need to cite official figures (ONS, FRED, Eurostat, e-Stat, MoSPI, OECD, World Bank) without re-checking the source. |
| Policy teams | Want a single dashboard that covers Europe, the Americas, Asia, Africa, and the Middle East. |

## Jobs To Be Done

1. **Functional job** — Compare two countries on the same metric from a data-first surface, with no commentary or forecasts mixed in.
2. **Functional job** — Build a custom dashboard with the metrics the reader cares about, and see the numbers update hourly from the official source.
3. **Functional job** — Drill into a per-country breakdown and see every number traced back to the official source (ONS, FRED, Eurostat, e-Stat, MoSPI, OECD, World Bank).
4. **Functional job** — Spot missing, wrong, or worth-adding data and surface it to the dashboard team via the "Get in touch" surface.
5. **Emotional job** — Stop the feeling that the number the reader sees is mixed with commentary or forecasts the reader has to separate.
6. **Social job** — Be the reader whose comparison is grounded in official figures the reader can cite, not in a vendor's narrative.

## Success Metrics

- **Hourly-freshness rate** — share of numbers on the dashboard that are within the hourly freshness window. A number older than the window is a freshness breach.
- **Official-source traceability** — share of numbers on the dashboard that trace back to one of the eight named official sources. A number without a traceable source is a sourcing breach.
- **View-isolation rate** — share of Compare / My Dashboard / country-page views that read the same data, never a recomputed or re-fetched version. A view that recomputes is a view-isolation failure.
- **Regional coverage rate** — share of the five named regions (Europe, the Americas, Asia, Africa, the Middle East) that the dashboard covers. A region outside the five is a coverage gap.
- **Reader-submitted data points** — number of "Get in touch" submissions the reader sends for missing, wrong, or worth-adding data. The metric is the reader-engagement funnel.
- **G7-economy live surface availability** — share of hours the G7-economy entry surface is live. A surface that is down is an entry-point failure.
- **Per-source fetch success rate** — share of hourly fetches per source (ONS, FRED, Eurostat, e-Stat, MoSPI, OECD, World Bank) that succeed. A source that fails to fetch is a freshness breach for that source's metrics.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The dashboard is free to use at theeconomicatlas.com. The plan does not invent a monetization the source does not name. Any future monetization has to be measured against the hourly-freshness rate and the official-source traceability, because those are the metrics the source ties to the dashboard's value proposition.

## Competitive Landscape

- **Generic economic dashboards (the names the source does not provide)** — mix data with commentary, forecasts, or opinion; the source's pitch is the data-only surface.
- **Central bank websites (the names the source does not provide)** — host the official data; the source's pitch is the unified cross-source view (eight sources, one dashboard).
- **Investment-bank research (the names the source does not provide)** — produce commentary on the data; the source's pitch is the data without commentary.
- **Wikipedia** — has country-level data; the source's pitch is the hourly-updating, traceable, cross-region dashboard.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the eight official sources cover the metrics the reader expects. The source names ONS, FRED, Eurostat, e-Stat, MoSPI, OECD, World Bank; the open question is whether a metric the reader cares about (e.g. employment, inflation, GDP per capita) is in one of the eight for the countries the reader compares.
- [ ] Validate the hourly rebuild pipeline keeps up with the data sources. The source states hourly updates; the open question is whether a source that publishes less frequently (e.g. monthly) is surfaced with the right "last updated" timestamp.
- [ ] Define the policy on a source that goes offline. A source like ONS or World Bank that returns an error during the hourly fetch is a freshness breach for that source's metrics; the open question is whether the dashboard surfaces a "stale" badge or fails silently.
- [ ] Decide the policy on a "Get in touch" submission. The source has a "Get in touch" surface; the open question is whether the dashboard team triages submissions publicly, responds privately, or surfaces the submission on a public roadmap.
- [ ] Establish a documented escalation path when two official sources disagree on the same metric. The source names eight sources; the open question is whether the dashboard picks a canonical source per metric or surfaces both with a note.
- [ ] Confirm the regional coverage (Europe, the Americas, Asia, Africa, the Middle East) is the right initial set. The source names five regions; the open question is whether Oceania is a future addition or stays out of scope.
- [ ] Define the policy on a per-source license change. A source that changes its terms (e.g. requires a key, switches to a paid tier) is a sourcing breach; the open question is whether the dashboard surfaces a "source changed" warning or fails silently.
