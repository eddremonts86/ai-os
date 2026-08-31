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

## Problem

The poster rewrote Snaketron, a competitive multiplayer Snake game, 14 years after the original. The 2012 version kept game state on the client; he knew it was insecure, shipped it anyway as a school project, and during the HN traffic surge players exploited it — the poster once loaded a 1v1 where his opponent's "snake" rendered as Space Invaders and was invincible. V2 is different: server-authoritative state with client-side prediction to hide latency; a game engine written in Rust and compiled to WASM for the client library; and a strict resiliency requirement — auto-scaling, so a node can join the cluster and live games rebalance to it without disrupting gameplay. Gameplay adds team matches with objectives to structure competitive play, a Bronze to Grand Master ranking subsystem, and features like boosting, combos, skins and Play of the Game detection. The project is about 200k LOC, most of it tests; the author credits AI assistance heavily and posts snaketron.io with the GitHub repo.

## Objective

Run V2 as a real game service: server-authoritative competitive Snake with client prediction, an auto-scaling cluster where live games rebalance across nodes, and the stated feature set — team objectives, ranking, boosts, combos, skins and Play of the Game — available to players.

## Target Users

- Competitive browser-game players looking for ranked multiplayer.
- The original Snaketron community returning after 14 years.
- Systems engineers curious about auto-scaling game-state migration.

## MVP Scope

- Server-authoritative Snake with client-side prediction (Rust engine, WASM client).
- Auto-scaling: node joins, live games rebalance without disrupting gameplay.
- Team matches with objectives.
- Bronze-to-Grand-Master ranking subsystem.
- Boosting, combos, skins and Play of the Game detection.

## Constraints

- Latency honesty: prediction must compensate, not eliminate, network lag.
- Auto-scaling is a stated hard requirement, not an optimization.
- 200k LOC is the author's size claim (mostly tests, per the post).
- The 2012 lesson: never trust client state — no authoritative data may live client-side.

## Design Direction

See `DESIGN.md` for this project's design tokens.
