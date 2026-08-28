---
id: "845"
slug: there-is-no-effective-tool-for-researching-high-margin-
title: There is no effective tool for researching high-margin and small e-commerce products
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: retail
date: "2025-11-14"
tags: [Retail, Other]
country: Australia
tech: [Python (FastAPI), HTMX + Jinja templates, Postgres, Fly.io]
---
# There is no effective tool for researching high-margin and small e-commerce products

## Tech Stack

Python (FastAPI), HTMX + Jinja templates, Postgres, Fly.io.

## Architecture

FastAPI backend orchestrates public signal sources and persists a watchlist. HTMX frontend keeps the UX simple and the deploy cheap.

## Milestones

- M1: pick one public signal source (e.g. eBay sold listings) end to end
- M2: add a second signal and a simple saturation heuristic
- M3: watchlist with revision history

## Risks

Server-rendered dashboards over public APIs. Citations attached to every signal so the user can verify.

- Public trend and review APIs change; the heuristics will rot.
- Margin is a local calculation (wholesale price minus landed cost); do not invent it.
