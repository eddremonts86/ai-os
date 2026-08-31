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

## Problem

The poster (PopFlamingo) built AbracadaNames, an interactive wall of first names, because a close relative was unhappy with the name websites they had visited. His stated goal was to avoid the feeling of "a long paginated database" and instead enable effortless exploration where you feel you actually have a chance of finding something you like, original or classical. The site offers a pleasant name selection, infinite scrolling, and search by country, origin and similar dimensions. He is explicit that the site will keep evolving and asks for feedback.

## Objective

Keep the wall-of-names experience as the core: effortless, scroll-first exploration with multilingual, data-driven name data and search by country and origin, iterated on real user feedback rather than feature sprawl.

## Target Users

- Parents-to-be browsing first names across countries and origins.
- Users who found existing name websites feel like paginated databases and want exploratory browsing.
- People curious about name origins who want to browse by country and origin.

## MVP Scope

- Interactive wall of first names with infinite scrolling.
- Name selection designed to feel pleasant rather than database-like.
- Search by country, origin and other named dimensions.
- Multilingual, data-driven name content.

## Constraints

- The post is the author's own description; no data-source or dataset-size details are given.
- The core quality bar is experiential ("doesn't feel like a paginated database") — hard to measure and easy to regress.
- The author explicitly frames the site as evolving; the MVP is the current site, not a finished product.
- No monetization or growth goal is stated; the ask is feedback.

## Design Direction

See `DESIGN.md` for this project's design tokens.
