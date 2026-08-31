---
id: "3817"
slug: practice-where-countries-are-in-the-world
title: Practice where countries are in the world
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495618"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Vue 3 and TypeScript, GeoJSON country data, Python data crunching, FSRS spaced repetition, static hosting, open source no-signup game]
---
# Practice where countries are in the world

## Tech Stack

Stated by the poster in the capture.

- **Vue 3 with TypeScript:** the app framework for the game UI.
- **GeoJSON:** country geometry data rendered on the map.
- **Python:** data crunching only — country shape simplification and data prep outside the shipped app.
- **FSRS:** the spaced-repetition scheduler behind which countries appear when.
- **Static hosting:** the deployed app at samlearns.org/world-map.
- **Open source:** a public repository, no ads, no signup.

## Architecture

- **Map view:** renders GeoJSON country shapes with hover and tap targets.
- **Game loop:** rounds in tap mode (name given, tap the country) or name mode (country given, name it), with zoom-level conditions.
- **Scheduler:** FSRS rates each country per learner and selects the next rounds.
- **Data pipeline:** Python preprocessing that turns raw geography data into the GeoJSON the game ships.
- **Local state:** learner progress and schedules persisted client-side (no server).

## Milestones

1. **M0 — Playable loop.** Tap and name modes run over the GeoJSON map with basic rounds.
2. **M1 — Feedback fixes.** The named complaints — difficulty extremes, boring islands, recurring countries, UX confusion — are resolved in the loop.
3. **M2 — FSRS integration.** The scheduler picks countries by recall need; zoom-level conditions land.
4. **M3 — Community round.** Ship the open-source release and collect the feedback the poster asked for.

## Risks

- **Local-only progress:** no accounts means progress dies with browser storage; an export feature could be a future ask.
- **Data curation:** island clutter and name disputes were past complaints and will keep recurring.
- **Difficulty drift:** any change to the loop can reintroduce the too-hard and too-easy complaints.
- **Solo hobby maintenance:** no roadmap cadence is stated beyond open feedback.
