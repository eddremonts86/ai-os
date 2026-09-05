---
id: "4159"
slug: tinyengine-game-engine-for-microcontrollers
title: TinyEngine – Game Engine for Microcontrollers
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511757"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# TinyEngine – Game Engine for Microcontrollers

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copy `edd-app-template` → `apps/4159-tinyengine-game-engine-for-microcontrollers/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Implement the bare-metal VM interpreter in C/C++ targeting Arduino reference board.
- [ ] Add SD card streaming so game data is read on the fly.
- [ ] Build a minimal reference game (one screen, one input) that fits in 2KB SRAM.
- [ ] Expose a React-based game browser that lists games available on the inserted storage.
- [ ] Add a CLI/host-side tool that packages a game into the on-disk format.
- [ ] Smoke-test end-to-end: drop a game file onto the SD card, power-cycle, see it run.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
