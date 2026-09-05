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

## Tech Stack

- React + TypeScript single-page app
- TanStack Start as the Node.js API for brief intake, question generation, and share-link resolution
- SQLite + Drizzle ORM for worlds, briefs, and answers
- Coolify + Docker for self-hosting
- LLM (closed or open) for question generation and final render prompt assembly
- Procedural / model-based world render (3D, isometric, or sprite-based)
- Optional share-link CDN for static renders

## Architecture

The creator types up to 100 words; the server stores the brief and the date. A short follow-up loop asks 2 or 3 closing questions and stores the answers. A render job combines brief + answers + a render prompt template to produce the island assets (ground, water, weather, buildings, creatures) and the day-night cycle parameters. The result is stored as a world record with a short URL. The client renders the world in a 3D-or-isometric viewport with tap interactions and a day-night cycle. The gallery indexes every public world.

## Milestones

1. Brief intake form with 100-word live counter
2. Follow-up question loop with answer persistence
3. World render job producing the island with day-night cycle
4. 3D / isometric viewport with turn and tap interactions
5. Shareable short link with server-rendered preview card
6. Public gallery with search and tags
7. Optional Pro tier with longer briefs and higher-fidelity renders

## Risks

- Generation cost per world must stay low; needs aggressive caching
- Quality of worlds will vary; risk of looking like AI slop
- Day-night cycle may not match every brief's mood
- Brief length cap may frustrate paying power users