---
id: "4202"
slug: words-to-worlds-world-build-in-100-words-or-less
title: "Words to Worlds - world build in 100 words or less"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508988"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Words to Worlds - world build in 100 words or less

## Problem

Generative worldbuilding tools tend to bury the creator in choices — long prompts, parameter sliders, asset pickers. Words to Worlds flips the constraint: a hundred words is the limit, not the floor. The poster's site (wordstoworlds.com) opens with "A hundred words. A whole world." and a four-step loop: describe a place in up to 100 words, the system asks two or three questions about what you left open, then it builds an island with ground, water, weather, buildings, creatures, and a day that turns. Visitors can turn the island in their hands, tap creatures, read the stories, leave something of their own, and share a link. The gallery shows real examples: Never Sleeps (high rises, old squares, harbour at midnight), Firefly Vigil (a tree glowing at midnight), Just Left (blue horses under two moons), Loch Morar, Ashcombe, The Lantern Marsh, Saltglass Coast, Hollowpine, The Brass Meridian, Cinderwake, The Orchard Moon, The Seven Bells, Kettlebrook, The Coral Tenement, Meadow Under Glass.

## Objective

Force the creator to spend their hundred words on what matters, then build a small living island from the brief and the answers, so each generated world is short, specific, and shareable.

## Target Users

- Writers sketching a setting before they commit to a longer piece
- TTRPG GMs who want a one-shot location idea in five minutes
- Worldbuilders and conlangers collecting ideas as gallery fodder
- Anyone who wants a 30-second creative ritual

## MVP Scope

- 100-word input box with live counter
- Back-and-forth questions until the brief is closed
- Island render with ground, water, weather, buildings, and creatures
- Day-night cycle and tap-on-creature interactions
- Shareable link per world
- Gallery view of every world ever made

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- 100 words is the literal input cap on the brief
- Each world must be shareable via a single URL
- Generation cost must stay under a few cents per world
- No login required to make or share a world; an account is optional