---
id: "1560"
slug: drawcity-geography-game-where-you-circle-the-target-pop
title: "Draw.city – geography game where you circle the target population [US]"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49353515"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Draw.city – geography game where you circle the target population [US]

## Problem

The core idea is, you draw a circle on a satellite view map and it tells you the population inside + more info.The home page is a daily challenge, I've backfilled some "past challenges" so there's more than just the past couple of days to play, and there is also a free-draw mode that tells you population + some census demographic info & points-of-interest data from OpenStreetMap.In most cases, the data comes from taking the census blocks w/ centroids contained in your circle and summing their population. Demographic info is slightly more complex as it's not sourced on blocks, so we allocate population-weighted fractions of a source territory's published census values into the drawn territory. Happy to answer any questions about the data or the technical side. The game/app only covers US areas at the moment, I'd like to add international data in the future!I am re-submitting this as a proper "Show HN", as I left the 'Show HN' text out of the title the last time I submitted

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
