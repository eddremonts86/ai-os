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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Evoboard turns the apps you already love into a year-long habit heatmap: your GitHub commits, chess games and LeetCode solves can each auto-complete a habit, with a Chrome extension and a public API for everything else.

**One-liner:** A GitHub-style habit heatmap that fills itself in from the apps you already use.

## Target Users

Self-trackers and developers who already use GitHub/LeetCode-style contribution views. Adjacent: habit-tracker fans who want less manual logging.

## Jobs To Be Done

- When I commit code, I want my habit board to tick automatically so I do not log twice.
- When I do an unsupported activity, I want a Chrome extension or API to fill the gap so all my habits show up.
- When I am on a streak, I want a public profile so friends can see it.

## Success Metrics

- Number of daily active users.
- Number of connected integrations per user.
- Streak length and heatmap density.
- Profile shares and clicks-through.

## Pricing & Monetization

Source does not state pricing. Treat as a free hobbyist tool until the author publishes a model.

## Competitive Landscape

Generic habit trackers (Streaks, Habitica, Way of Life) and developer-focused trackers (WakaTime, GitHub contribution view) cover parts of the use case. Evoboard's differentiator is the auto-completion from existing apps plus the GitHub-style heatmap.

## Risks & Open Questions

- Integration churn: GitHub/LeetCode APIs change; mitigation is to keep each connector isolated.
- Chrome extension distribution and review risk; mitigation is to keep extension permissions minimal.
- Privacy: tracking habits is sensitive; mitigation is to make every data point user-controllable.
