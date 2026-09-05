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

## Problem

Economic dashboards usually mix data with commentary, forecasts, and opinion. The result is that the reader has to separate the number from the narrative before they can compare two countries on the same metric. The Economic Atlas removes the noise by being only data. No commentary, no forecasts, no opinion — just official figures, rebuilt automatically from source every hour. Economies across Europe, the Americas, Asia, Africa, and the Middle East are live.

The source is theeconomicatlas.com landing page. Every number traces back to one of: ONS, FRED, Eurostat, e-Stat and the Bank of Japan, MoSPI, the Bank of Korea, the OECD, and the World Bank. Compare, My Dashboard, and the country pages are just different ways of looking at that same data, never a different version of it. The dashboard is hourly updating; the data is fetched only from official sources.

The source names the actor (a reader who wants to compare countries on the same metric without commentary or forecasts), the pain (data mixed with narrative; the reader has to separate the number from the opinion), and the missing thing (a data-first dashboard with hourly updates from official sources, no commentary, no forecasts, no opinion). It does not name a specific metric set, a specific country list, or a specific pricing tier.

## Objective

Build the Economic Atlas: an hourly-updating, data-first dashboard for comparing countries, with every number traced back to one of the official sources (ONS, FRED, Eurostat, e-Stat and the Bank of Japan, MoSPI, the Bank of Korea, the OECD, World Bank), with Compare, My Dashboard, and country pages as different views of the same data, and no commentary, no forecasts, no opinion.

## Target Users

- Readers who want to compare countries on the same metric without commentary or forecasts.
- Researchers who want a data-first dashboard with hourly updates from official sources.
- Analysts who want Compare, My Dashboard, and country pages as different views of the same data, never a different version.
- Journalists who need to cite official figures (ONS, FRED, Eurostat, e-Stat, MoSPI, OECD, World Bank) without re-checking the source for every number.
- Policy teams who want a single dashboard that covers Europe, the Americas, Asia, Africa, and the Middle East.

## MVP Scope

- The Economic Atlas dashboard at theeconomicatlas.com with hourly-updating data from official sources.
- An hourly rebuild pipeline that fetches data from ONS, FRED, Eurostat, e-Stat and the Bank of Japan, MoSPI, the Bank of Korea, the OECD, and the World Bank.
- A data-first surface: no commentary, no forecasts, no opinion. Numbers only.
- Three views of the same data: Compare (side-by-side country comparison), My Dashboard (the reader's saved metrics), and country pages (a per-country breakdown).
- Coverage across Europe, the Americas, Asia, Africa, and the Middle East.
- A traceable source for every number: each number is tied to the official source it came from (ONS, FRED, Eurostat, e-Stat and the Bank of Japan, MoSPI, the Bank of Korea, the OECD, or the World Bank).
- A "Get in touch" surface for missing, wrong, or worth-adding data the reader spots.
- A G7-economy live surface as the entry point (the landing page names G7 as the live entry).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The dashboard is data-only. No commentary, no forecasts, no opinion; the source is explicit about this.
- The data is hourly-updating. A number that is older than the hourly window is a freshness breach.
- The data is from official sources only. The eight named sources are ONS, FRED, Eurostat, e-Stat and the Bank of Japan, MoSPI, the Bank of Korea, the OECD, and the World Bank. A non-official source is a sourcing breach.
- The three views (Compare, My Dashboard, country pages) are different views of the same data, never a different version. A view that recomputes or re-fetches the data is a view-isolation failure.
- Coverage spans Europe, the Americas, Asia, Africa, and the Middle East. A region outside the five is a coverage gap.
- Every number traces back to one of the eight official sources. A number without a traceable source is a traceability failure.
- The plan does not invent a metric set the source does not name. The source does not name specific metrics; the reader sees the data the official sources publish.
- The plan does not invent a pricing tier the source does not name. The source does not name a fee, a tier, or a subscription.
