---
id: "2883"
slug: game-to-see-if-youre-over-under-confident-in-your-own-k
title: "Game to see if you're over-/under-confident in your own knowledge"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49441660"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Game to see if you're over-/under-confident in your own knowledge

## Problem

I wrote a simple "trivia" game to get a sense about how well calibrated you are in terms of how well you know things: https://est.alejo.chYou get ten simple "what happened first" questions and give a confidence level (for each answer). The game tracks your success rates per confidence level and gives you a calibration graph/table (e.g., "you consistently over-estimate your success rate"). You can play multiple times to see aggregated statistics.After 60 games (480 questions), I found out that I am relatively well-calibrated, though I should ~never bet under 60% (for this specific type of binary questions): https://alejo.ch/3mkThe game is open source (GPLv3 at https://github.com/alefore/estimate) and it's just static files. There's no server-side logic: the game log/stats are stored in your browser (local storage API). It's pure TypeScript, no framework.You can read more about it on https://alejo.ch/3m9Just figured I'd share in case others find it useful and/or have suggestions to improve it. I'd also be curious to see the calibration stats of other people.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
