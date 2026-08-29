---
id: "3721"
slug: bora-praia-weather-and-tide-forecasts-turned-into-a-tim
title: Bora Praia – weather and tide forecasts turned into a time to leave
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487925"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Mobile, Weather, Tide, Travel]
tech: [Flutter, Dart, iOS, Android, Open-Meteo, marine weather providers]
---
# Bora Praia – weather and tide forecasts turned into a time to leave

## Tech Stack

- **Frontend:** React + TypeScript
- **Backend:** Node.js API (TanStack Start)
- **DB:** SQLite with Drizzle ORM
- **Deployment:** Coolify + Docker

## Architecture

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Client    │────▶│   API       │────▶│   DB        │
└─────────────┘     └─────────────┘     └─────────────┘
```

## Milestones

1. **M0:** Project setup + SPEC.md + DESIGN.md approved
2. **M1:** Scaffold + auth
3. **M2:** Core feature
4. **M3:** Testing + deployment

## Risks

- Dependency on external APIs
- Ambiguous scope without further detail
