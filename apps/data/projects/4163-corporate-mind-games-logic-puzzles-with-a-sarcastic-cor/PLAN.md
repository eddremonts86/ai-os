---
id: "4163"
slug: corporate-mind-games-logic-puzzles-with-a-sarcastic-cor
title: Corporate Mind Games – logic puzzles with a sarcastic corporate theme
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511400"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Corporate Mind Games – logic puzzles with a sarcastic corporate theme

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — covers the static-leaning web app: a small server-side component for puzzle state and a Drizzle-managed SQLite store. The puzzles themselves run client-side in the browser.

## Architecture

Static-first SPA (React) for puzzle rendering, with a thin server (TanStack Start) handling puzzle definitions, leaderboard scores, and a small share-link flow. SQLite + Drizzle holds puzzle metadata and a tiny result-store. Coolify hosts the app behind Docker.

## Milestones

- M1 — Three to five playable puzzles with stable rules and timer.
- M2 — Sarcastic copy layer applied consistently across puzzles.
- M3 — Result page with a share link.
- M4 — A small leaderboard or streak tracker.
- M5 — Steady cadence of new puzzles (content not in scope of the code, but a CMS slot for it).

## Risks

- Content cadence risk: the puzzles live or die on whether the author keeps shipping; mitigation is to make adding a puzzle cheap.
- Tone consistency is subjective; mitigation is to lock a copy-style guide early.
- Hosting costs are negligible at MVP scale; revisit if traffic spikes.
