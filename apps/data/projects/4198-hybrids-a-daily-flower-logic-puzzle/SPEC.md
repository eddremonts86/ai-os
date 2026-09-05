---
id: "4198"
slug: hybrids-a-daily-flower-logic-puzzle
title: "Hybrids – a daily flower logic puzzle"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509199"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Hybrids – a daily flower logic puzzle

## Problem

Daily puzzle sites often focus on Wordle-style word games; floral-themed logic games are rarer. The poster's site (hybrids.rudyp.dev) launches with the headline "Hybrids — A daily flower logic puzzle" and greets the visitor with "Good Afternoon." The intended mechanic, suggested by the title, is hybridisation: combine flowers according to rules that reveal a daily answer. The site is in early ship; the source page shows a sparse landing with the title and a single greeting line.

## Objective

Ship a browser-based daily logic puzzle where the player hybridises flowers according to hidden rules and the site resolves one new puzzle per day, served fresh from a small static API.

## Target Users

- Daily puzzle players who have finished Wordle and want something different
- Botany-curious players who like the floral theme
- Mobile-first visitors who open the link on their phone during a coffee break
- Casual gamers who want a 3–5 minute daily ritual

## MVP Scope

- One puzzle per day served from a tiny backend
- Drag-tap interaction to hybridise two flowers
- Daily answer reveal at midnight, with shareable emoji grid
- Mobile-first layout, no signup

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- One puzzle per day; no archive replay unless the operator opts in
- No user account, no email collection
- Mobile browser is the primary surface
- Loading time from cold cache under 1 second on 4G