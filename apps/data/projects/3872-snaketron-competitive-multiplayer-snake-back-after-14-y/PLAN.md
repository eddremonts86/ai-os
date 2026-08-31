---
id: "3872"
slug: snaketron-competitive-multiplayer-snake-back-after-14-y
title: Snaketron – Competitive multiplayer Snake. Back after 14 years
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499499"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Rust, WebAssembly, Server-authoritative netcode, Client-side prediction, Auto-scaling cluster, Ranked match systems]
---
# Snaketron – Competitive multiplayer Snake. Back after 14 years

## Tech Stack

Chosen from the poster's stated architecture; he names Rust, WASM and the prediction model explicitly.

- **Rust game engine:** the server core and shared logic.
- **WebAssembly client:** the engine compiled for the browser.
- **Server-authoritative state:** the single source of truth per match.
- **Client-side prediction:** the client extrapolates between server ticks.
- **Auto-scaling cluster:** nodes join and live games rebalance to them.
- **Ranked match systems:** the Bronze to Grand Master ladder and team objectives.

## Architecture

- **Authoritative server:** per-match game state lives server-side only.
- **Prediction client:** the WASM engine extrapolates between server updates.
- **Cluster layer:** nodes join; live games migrate or rebalance without interruption.
- **Gameplay systems:** team objectives, boosting, combos, skins and Play of the Game detection.
- **Ladder:** ranking across matches feeds the Bronze to Grand Master subsystem.

## Milestones

1. **M0 — Fair 1v1.** Server-authoritative play with client-side prediction is playable end to end.
2. **M1 — Structure.** Team matches with objectives plus the ladder MVP.
3. **M2 — Scale.** The auto-scaling cluster rebalances live games under load test with zero disruption.
4. **M3 — Launch.** snaketron.io goes public with ranking live and observability on rebalances.

## Risks

- **Rebalance correctness:** migrating live game state under real traffic is the hardest path in the project.
- **Population-dependent ranking:** the ladder cannot calibrate without enough players.
- **Bus factor:** one author, even with heavy test coverage, is a single point of maintenance.
- **Ops cost:** an always-on game server has real bills and no stated revenue.
