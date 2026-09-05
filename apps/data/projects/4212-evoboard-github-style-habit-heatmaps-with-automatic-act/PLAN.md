---
id: "4212"
slug: evoboard-github-style-habit-heatmaps-with-automatic-act
title: Evoboard – GitHub style habit heatmaps with automatic activity logging
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508482"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Evoboard – GitHub style habit heatmaps with automatic activity logging

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — fits the web app and the connectors that read public activity feeds. The Chrome extension is a separate codebase and is not changed here.

## Architecture

Web app (React + TanStack Start) shows the heatmap and the per-habit configuration. Backend connectors for GitHub, LeetCode, chess sites, etc. read public activity and write to the user's habit board. A Chrome extension lets users add custom auto-completion for unsupported apps via DOM/UI events. SQLite/Drizzle holds habits and history.

## Milestones

- M1 — Year-long heatmap and habit CRUD.
- M2 — GitHub connector for auto-completion.
- M3 — LeetCode + chess connectors.
- M4 — Chrome extension for unsupported apps.
- M5 — Public, shareable profile.

## Risks

- API churn risk; mitigation is to isolate connectors and ship with feature flags.
- Chrome extension review friction; mitigation is to keep extension permissions minimal.
- Privacy expectations; mitigation is to document what each connector reads.
