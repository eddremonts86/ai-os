---
id: "4205"
slug: i-built-this-social-leaderboard-game
title: I built this social leaderboard game
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508885"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# I built this social leaderboard game

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — fits the web game plus a small backend that stores leaderboard state and player profiles. SQLite/Drizzle holds the leaderboard and per-player score history.

## Architecture

Browser-based game with a thin React front-end and a TanStack Start backend that owns the leaderboard and the share-link surface. SQLite/Drizzle stores the leaderboard and player scores. Coolify hosts the app behind Docker.

## Milestones

- M1 — Leaderboard and a basic game loop.
- M2 — Shareable title or top-rank handle.
- M3 — Profile page per player.
- M4 — Show HN launch with a stable leaderboard.

## Risks

- Design space is wide-open; mitigation is to keep scope tiny until retention data arrives.
- Single-developer workload risk; mitigation is to keep the dependency surface minimal.
- Discovery risk; mitigation is to time the Show HN post and lean on the leaderboard's social loop.
