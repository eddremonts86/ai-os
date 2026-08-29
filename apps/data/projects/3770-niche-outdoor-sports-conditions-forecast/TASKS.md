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

## Phase 0: Scaffold

- Seed the Romania spot database (climbing + surfing).
- Stand up the Node.js ingestion job.
- Implement the sport-specific adapter (one per sport in the MVP).
- Build the spot list page with conditions at a glance.
- Build the spot detail page with the 24h outlook.
- Add a small admin page to edit spots.
- Hand-test with five real spots in Romania.

## Phase 1: Core

- All MVP Scope items shipped end-to-end.
- A user sees the conditions for any seeded Romania spot within two seconds on a phone.
- Forecast ingestion runs on a schedule and the spot page reflects the latest pull.
- Sport-adapter boundary is documented; the next sport plug-in is a clear path.
- Test coverage on the adapter and the ingestion job.

## Phase 2: Deploy

- Deploy on Coolify behind HTTPS.
- Document the sport-adapter contract for future contributors.
- Publish the beta and ask for feedback from the Romania climbing / surfing communities.
- Plan the multi-country rollout once the adapter pattern holds.
