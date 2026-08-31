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

## Tech Stack

TypeScript, React + Vite, Node.js API for the ingestion pipeline, SQLite + Drizzle ORM, Coolify + Docker.

## Architecture

Static front end + a Node.js ingestion job that pulls forecast APIs per sport, joins with the spot table, and serves a JSON payload. The sport-adapter boundary is the abstraction the future countries plug into.

## Milestones

- **M0:** SPEC + DESIGN approved.
- **M1:** Romania climbing + surfing spots seeded.
- **M2:** Forecast ingestion pipeline + spot detail page.
- **M3:** Beta launch.

## Risks

- Forecast API availability and rate limits vary; the MVP needs a fallback strategy.
- Spot data is curated manually for the MVP; a community-sourced flow is out of scope.
- Performance on a phone in poor signal is the field reality; offline cache is out of MVP scope but on the roadmap.
