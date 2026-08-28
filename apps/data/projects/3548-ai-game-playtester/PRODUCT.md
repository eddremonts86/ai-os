---
id: "3548"
slug: ai-game-playtester
title: AI Game Playtester
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49475316"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# AI Game Playtester

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey everyone! Wanted to show off a little side project I've been working on. A lot of people have been using AI to one-shot games, but they're often quite buggy - glitchy graphics, collisions aren't setup, or regressions in earlier levels. With an AI playtester in the loop, I've been able to one-shot games like Candy Crush or Crossy Road that would previously have bugs like cut-off UIs or stuck retries.The way it works basically goes like this:1/ The playtester starts by reading the code to understand what its parent AI is asking it to play, and to decide what breakpoints, hooks and logging to add
2/ The playtester sets up the scene with the needed environment
3/ The playtester sends a sequence of inputs, then pauses the game
4/ The playtester then uses a vision model to understand the scene, queries the hooks it initially set up, and reads the logs to decide what to do nextAfter doing a few input loops, it then determines if the game is working, the game is broken, or if the test failed.It is a paid offering so I'm not expecting anyone to try it out, but I wanted to share it nonetheless ^^. Lmk if you have other ideas on how you think it can be improved

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49475316) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
