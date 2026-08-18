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

## Tech Stack

- **Frontend:** Plain HTML + a small TypeScript module. The author built the original with vanilla HTML and the MVP keeps that constraint. No React, no virtual DOM.
- **Realtime transport:** WebSocket via the `ws` library on a Node server. Each room is a single broadcast channel.
- **Backend:** Node.js with TypeScript. Express is overkill; a small HTTP server for the landing page plus the WebSocket endpoint is enough.
- **Database:** Postgres for room state (current frame, round number, scores) and a small `frames` cache of TMDB responses. Chosen because the author already used it and the schema is small.
- **External API:** TMDB for frames. Server-side fetch only, with an API key in env.
- **Hosting:** A small VM (Fly.io or a personal box) with Postgres alongside. No Docker orchestration beyond a single container plus a Postgres container.

## Architecture

The browser opens a WebSocket to the server when a player creates or joins a room. The server holds room state in Postgres, fetches frames from TMDB at game start (cached in the `frames` table), and broadcasts each round's frame and timer tick. Guesses are submitted as WebSocket messages and scored server-side.

```
Browser (HTML + TS)
   |  WebSocket
   v
Node server
   |--- room state ----> Postgres
   |--- frame cache ----> Postgres
   |--- TMDB fetch ----> tmdb.org
```

A single Postgres instance serves all rooms in v1. Frame fetch happens once per game, not per round.

## Milestones

1. **M0 — Scaffold:** Node + TypeScript repo, HTTP server for the landing page, WebSocket endpoint with a single echo.
2. **M1 — Room state in Postgres:** Schema for `rooms`, `players`, `rounds`, `scores`. CRUD on a single room.
3. **M2 — TMDB frame fetch:** Server-side fetch, cache to Postgres, "safe-for-guessing" filter on the curated list.
4. **M3 — Realtime loop:** Round start, frame broadcast, 10-second timer tick, guess broadcast, per-round score update, five rounds.
5. **M4 — Lobby and join:** Create-or-join landing page, short room codes, nickname per player, kick-and-respawn flow.
6. **M5 — Post-game and feedback:** Summary screen, "start a new game with same players" button, an in-room feedback link.
7. **M6 — Dogfood and external playtest:** Run ten games with the author's friend group, log friction, iterate before declaring v1.

## Risks

- **TMDB rate limits and content licensing.** Mitigation: cache frames per game; attribute TMDB in the room footer.
- **Spoiler frames.** Mitigation: the curated filter plus an in-game "swap this frame" flag for playtesting.
- **WebSocket disconnects.** Mitigation: a reconnect flow that resyncs the player into the current round with their existing score.
- **No-account griefing.** Mitigation: per-room kick, no permanent bans in v1.
