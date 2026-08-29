---
id: "3770"
slug: niche-outdoor-sports-conditions-forecast
title: "Niche – outdoor sports conditions forecast"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488884"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [TypeScript, React + Vite, Node.js API for the ingestion pipeline, SQLite + Drizzle ORM, Coolify + Docker]
---

# Niche – outdoor sports conditions forecast

> Brief derived from the source post. No facts added beyond what the post asserts.

## Value Proposition

One page, every spot, the conditions that matter. Climbing and surfing in Romania today; more sports and more countries queued behind a clean adapter boundary.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Local climber/surfer | They pick a spot based on conditions; the dashboard is the decision tool. |
| Guide / instructor | Reliability matters; a broken forecast loses them a session fee. |
| Trip planner | They need at-a-glance conditions across several spots. |

## Jobs To Be Done

1. **Functional job** — see the conditions for their climbing or surfing spot without juggling multiple apps.
2. **Emotional job** — feel confident the trip is worth it before they drive.
3. **Social job** — share a spot with a friend via a link.

## Success Metrics

- **Activation:** % of visitors who view a spot detail page.
- **Retention:** weekly active users; spots viewed per session.
- **Revenue:** the post does not state pricing; freemium with a per-country / per-sport paywall is the obvious shape.

## Competitive Landscape

- Windy / Windfinder: global wind + wave forecasts but not sport-specific.
- Tide-forecast sites: tide-only; the climbing use case is missing.
- Mountain-project / theCrag: climbing databases with conditions as a secondary surface.

## Risks & Open Questions

- Forecast API coverage and quality varies by country; the adapter boundary is the risk.
- Beta scope is Romania; international expansion needs local spot data, not just a language toggle.
- Conditions UX must be fast on a phone in the field; charts are tempting but slow.
