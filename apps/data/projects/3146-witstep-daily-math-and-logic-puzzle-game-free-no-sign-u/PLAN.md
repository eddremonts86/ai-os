---
id: "3146"
slug: witstep-daily-math-and-logic-puzzle-game-free-no-sign-u
title: Witstep – daily math and logic puzzle game (Free No Sign-up)
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448164"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Witstep – daily math and logic puzzle game (Free No Sign-up)

## Tech Stack

A static web app with client-side state: no accounts means no user table, no session backend, and no personal data, so the whole thing can be pre-rendered and the daily puzzle selected deterministically from the date.

## Architecture

A puzzle library shipped as data, a date-seeded selector so every player gets the same daily without a server deciding, and progress kept in browser storage. Anonymity is the architecture: nothing needs to be stored server-side for the product to work.

## Milestones

1. Puzzle data format and a first set of daily puzzles
2. Date-seeded daily plus the patterns mode
3. Local progress and streaks with no account
4. Ship free and sign-up-free

## Risks

- Daily cadence means the puzzle library is a standing content commitment
- Local-only progress is lost when a player clears their browser
- Without accounts, difficulty cannot be tuned per player
