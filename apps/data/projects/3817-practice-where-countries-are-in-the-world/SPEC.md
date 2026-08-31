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

## Problem

The poster keeps making little web apps to practice geography, and since some people on HN enjoyed the previous version, he is sharing this one: a game loop where you either tap or name countries on the world map, with varying conditions like zoom levels. Following feedback from last time, he reconsidered almost all of the game systems and fixed quite a few issues — the old version was too hard, too easy, had too many boring islands, repeated countries too often, and had confusing UX. The stack is TypeScript and Vue with GeoJSON data, plus some Python for data crunching, and the learning algorithm is built on top of FSRS (Free Spaced Repetition Scheduler). It is all free, no ads, no signup, and open source, hosted at samlearns.org/world-map, and he is explicitly asking for feedback and ideas.

## Objective

Polish the reworked game loop into a dependable geography practice habit: tap-or-name rounds with sane difficulty and zoom conditions, driven by an FSRS-based scheduler so each country reappears when the learner actually needs it.

## Target Users

- Geography learners drilling country locations on a world map.
- Teachers and parents looking for a free, no-signup classroom or homework tool.
- The HN audience that tested the previous version and reported the difficulty and UX problems.

## MVP Scope

- Tap mode: locate a named country on the world map.
- Name mode: identify a highlighted country by name.
- Varying conditions: zoom levels and other difficulty modifiers.
- FSRS-backed scheduling of which countries appear when.
- GeoJSON country data rendered with Vue and TypeScript.
- Free, no ads, no signup, open source, static-hosted.

## Constraints

- Feedback is the spec: the previous round's complaints (too hard, too easy, boring islands, recurring countries, confusing UX) define the acceptance criteria.
- No ads, no signup, free and open source — monetization is explicitly out of the picture.
- Static client-side hosting; there is no server-side user state, so progress persistence must live locally.
- Python exists in the pipeline only for data crunching, not in the shipped app.

## Design Direction

See `DESIGN.md` for this project's design tokens.
