---
id: "3770"
slug: niche-outdoor-sports-conditions-forecast
title: Niche – outdoor sports conditions forecast
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

## Problem

The author built Niche as a centralised platform to check the conditions for different spots for climbing and surfing. It is in beta and only shows spots in Romania. The author plans to add other countries soon, as well as winter sports.

## Objective

Ship a sport-specific conditions dashboard for climbing and surfing spots in Romania, with the data model and ingestion pipeline designed so other countries and winter sports can plug in without a rewrite.

## Target Users

1. **Climber or surfer in Romania** — the primary user; needs a single page with the conditions for their favourite spots.
2. **Outdoor guide / instructor** — checks conditions before scheduling sessions; needs reliability over novelty.
3. **Outdoor-sports visitor** — planning a trip and needs a quick overview of nearby spots.

## MVP Scope

- Per-spot conditions dashboard for climbing and surfing.
- Spot data: location, route grade, surface, tide (for surf), wind (for both).
- A named feed source per sport — the MVP uses one forecast API per sport and merges it with the spot data.
- A spot detail page with the current conditions plus the next 24h outlook.
- Stop short of: user accounts, payment, social, multi-country coverage (planned).

## Design Direction

See DESIGN.md for design tokens.

## Constraints

- Beta scope is Romania only; the data model and the spot schema must be designed so other countries drop in cleanly.
- Forecast data sources change by country; the MVP abstracts behind a sport-specific adapter.
- Conditions pages must load fast on a phone in the field; performance over fancy charts.
