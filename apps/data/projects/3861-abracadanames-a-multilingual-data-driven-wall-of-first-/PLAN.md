---
id: "3861"
slug: abracadanames-a-multilingual-data-driven-wall-of-first-
title: "AbracadaNames – a multilingual, data-driven wall of first names"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49500794"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Multilingual name dataset ingestion, Country and origin metadata model, Infinite-scroll wall renderer, Name search and filter UI, Static web frontend]
---
# AbracadaNames – a multilingual, data-driven wall of first names

## Tech Stack

- **Multilingual name dataset ingestion:** names with country and origin metadata loaded into the wall.
- **Country and origin metadata model:** the dimensions behind the search filters.
- **Infinite-scroll wall renderer:** virtualization or similar so scrolling stays pleasant at scale.
- **Name search and filter UI:** instant filtering by country, origin and other fields.
- **Static web frontend:** a content-heavy site that can ship as static pages.

## Architecture

- **Data layer:** name records keyed with country, origin and any additional dimensions.
- **Wall renderer:** scroll-driven rendering that appends names without pagination.
- **Search layer:** client-side or edge filtering across the metadata dimensions.
- **Selection UX:** hover and select states designed for pleasant exploration, not list skimming.
- **Static hosting:** the site serves as a static web frontend.

## Milestones

1. **M0 — The wall.** Infinite-scrolling name wall rendering the multilingual dataset.
2. **M1 — Search dimensions.** Country, origin and additional filters over the dataset.
3. **M2 — Experience polish.** Selection states, density and performance tuned against real browsing sessions.
4. **M3 — Feedback loop.** Collect and act on HN and visitor feedback to shape the next iterations.

## Risks

- **Performance at scale:** infinite scroll of a large multilingual dataset must stay smooth.
- **Metadata completeness:** uneven country and origin coverage will be noticed quickly.
- **The "not a database" feeling is subjective:** measuring it needs qualitative feedback.
- **An evolving side project without monetization** may stall when enthusiasm fades.
