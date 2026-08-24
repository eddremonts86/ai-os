---
id: "1616"
slug: automatically-detect-and-patch-walking-dead-states-in-s
title: Automatically detect and patch walking-dead states in Sierra games
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49355607"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Automatically detect and patch walking-dead states in Sierra games

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN, I've become lazier in my old age and struggle to replay my favorite Sierra games from the 80s and 90s because I keep getting into those situations where I need an item from 3 acts ago, I have no save game handy, and now I gotta make dinner.So I'm building the Lucasartsifier: a static analysis tool that decompiles Sierra resource files, automatically finds those states, automatically generates code to prevent the player from getting into those states, then emits loose patch files that can be placed alongside the original game resources. There's no game-specific code involved; all the logic is generic, though of course Sierra introduces new idioms and mechanics in every game so every new supported game needs a bunch of engine work.So for example in Leisure Suit Larry 2, the patched game prevents you from boarding the cruise ship until you have both the sunscreen and the Grotesque Gulp. Without them you die on the raft 3 play-hours later.So far this works on Leisure Suit Larry 2 (SCI0), King's Quest 4 (SCI0), King's Quest 6 (SCI1.1), and Laura Bow 2 (SCI1.1). I'm currently working on King's Quest 5 (SCI1.0).This is work done with Claude -- I do the design and playtesting and it does the rest :DAny feedback, play testing, and suggestions would be great!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49355607) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
