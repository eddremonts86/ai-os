---
id: "4218"
slug: highlander-realtime-minimax-fasth3-with-audio-at-002-pe
title: "Highlander – realtime MiniMax FastH3 with audio at $0.02 per second"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507642"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Highlander – realtime MiniMax FastH3 with audio at $0.02 per second

## Problem

Highlander (highlander.sh) is a hosted realtime video generation service that serves the FastH3 VSA checkpoint distilled from MiniMax H3 on eight H100s. The landing page states the headline numbers: 1344×768, 24 fps, native synchronised audio, 0.94x realtime. Pricing is implied at $0.02 per second of generated video (from the post title). The demo cards show 345-frame / 14.375-second clips: a city rendering itself into existence, a motorcycle chase through rain-soaked neon Tokyo, a photoreal dragon banking between Manhattan skyscrapers at golden hour, and a Formula 1 cockpit view. The product is a hosted endpoint a developer can call to generate short video clips at better-than-realtime speed with audio.


---

## Objective

Ship a hosted realtime video generation endpoint that returns a short video clip with native synchronised audio at $0.02 per second, backed by the FastH3 VSA checkpoint of MiniMax H3 running on eight H100s.


## Target Users

Developers and creative teams that need short generated video clips with audio and want a hosted endpoint instead of standing up their own GPU cluster. Assumes the reader can call an HTTP API and pay per second of output.


## MVP Scope

- A hosted endpoint that accepts a prompt and returns a video clip with audio.
- A pricing meter at $0.02 per second of generated video.
- An example prompt library with the demo clips.
- A status / queue surface so a developer can track a long generation.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Pricing ($0.02/sec) is named in the post title; the metering has to match what the post says, not a different rate.
- Hardware is fixed (eight H100s); throughput is bounded by the cluster size.
- The product is hosted; on-prem is not in scope.
