---
id: "3899"
slug: dice-for-board-games-and-rpgs
title: Dice for Board Games and RPGs
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49496542"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [canvas animation, cryptographic RNG, dice presets, browser storage, PWA, static hosting]
---
# Dice for Board Games and RPGs

## Tech Stack

- **Canvas animation:** the roll tumble.
- **Cryptographic-strength RNG:** results the user can trust.
- **Dice presets:** the standard polyhedral set and common pools.
- **Browser storage:** history and favorites.
- **PWA shell:** the roller works offline at the table.
- **Static hosting:** the public app.

## Architecture

- A roll engine draws results from the secure RNG and resolves pools and modifiers.
- An animation layer plays a tumble that lands on the pre-drawn result.
- A session model records rolls in order with timestamps.
- A sharing layer syncs the session to other browsers.
- Presets store common rolls per game system.

## Milestones

1. **M0 — Scaffold:** roll engine with secure RNG, basic d6 render, static deploy.
2. **M1 — The dice:** full polyhedral set, pools, modifiers, roll history.
3. **M2 — The table:** shared sessions, visible fairness, presets.
4. **M3 — The feel:** tumble animation polish, PWA offline, sound and haptics.

## Risks

- Fairness is the brand: any RNG doubt is fatal, so the source must be auditable.
- Animation must land on the committed result or trust collapses.
- The category is saturated; the differentiator must be speed and shared rolls.
- Offline support matters at real tables where Wi-Fi fails.
