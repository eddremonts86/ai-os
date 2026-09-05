---
id: "3897"
slug: lexino-build-five-letter-words-with-letter-dominoes
title: Lexino - Build five-letter words with letter dominoes
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497141"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [game engine, word dictionary, local storage, offline PWA, CSS animation, static hosting]
---
# Lexino - Build five-letter words with letter dominoes

## Tech Stack

- **Game engine:** the board and tile interactions.
- **Word dictionary:** a curated five-letter list with licensing review.
- **Local storage:** streaks, stats and daily progress.
- **Offline-capable PWA:** the daily puzzle works anywhere.
- **CSS animation:** tile placement and chain feedback.
- **Static hosting:** the public game.

## Architecture

- Board state: placed dominoes, available letters, formed words.
- A validator checking every completed chain against the dictionary.
- A scorer weighting chain length and letter rarity.
- A daily puzzle generator with a solvability check.
- Local persistence of streaks and settings.

## Milestones

1. **M0 — Scaffold:** board render, tile model, dictionary import, static deploy.
2. **M1 — Playable core:** placement, chaining, validation, scoring.
3. **M2 — Daily mode:** puzzle generation with solvability guarantee, streaks.
4. **M3 — Feel:** animations, mobile haptics, share cards, PWA offline.

## Risks

- Dictionary coverage determines perceived fairness more than any other factor.
- Solvability bugs in generation are trust-destroying and hard to detect.
- A new mechanic needs teaching moments or early players bounce.
- Monetization is entirely open; the MVP ships without it.
