---
id: "3013"
slug: flashframe-free-browser-based-fast-multiplayer-movie-gu
title: FlashFrame-Free Browser-Based Fast Multiplayer Movie Guessing Game
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49339210"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# FlashFrame-Free Browser-Based Fast Multiplayer Movie Guessing Game

## Phase 0: Scaffold

- [ ] Create project folder `apps/3013-flashframe/`
- [ ] Initialize Node + TypeScript repo
- [ ] Add a minimal HTTP server for the landing page and a WebSocket endpoint with a single echo
- [ ] Wire design tokens from DESIGN.md into the landing page stylesheet
- [ ] Add a minimal README documenting the TMDB key requirement
- [ ] Author the Postgres schema for `rooms`, `players`, `rounds`, `scores`, `frames`

## Phase 1: Core

- [ ] Implement the room CRUD layer against Postgres (create, join, leave, kick)
- [ ] Implement the TMDB server-side fetcher with API key from env and a cache write to the `frames` table
- [ ] Build the curated "safe-for-guessing" frame list — a checked-in JSON of TMDB movie IDs that pass a playtest
- [ ] Implement the realtime game loop: round start, frame broadcast, 10-second timer tick, guess broadcast, per-round score update, five rounds
- [ ] Build the lobby landing page: create-or-join with a short room code, nickname entry
- [ ] Build the room screen: shared frame, chat-style guess box, per-player scoreboard, timer countdown
- [ ] Add the post-game summary screen and the "start a new game with same players" button
- [ ] Add the in-room "swap this frame" flag for playtesting spoiler frames
- [ ] Add the kick-and-respawn flow and a simple WebSocket reconnect that resyncs a player to the current round
- [ ] Add the TMDB attribution line to the room footer
- [ ] Run ten games with the author's friend group and log friction before declaring v1

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Provision a Postgres instance (Fly.io Postgres or a self-hosted one)
- [ ] Deploy the Node server behind HTTPS with a WebSocket upgrade path
- [ ] Wire CI: type-check + room-CRUD tests + a small end-to-end WebSocket test on every push
- [ ] Verify the deployed instance handles a five-round game with three simulated players end-to-end
