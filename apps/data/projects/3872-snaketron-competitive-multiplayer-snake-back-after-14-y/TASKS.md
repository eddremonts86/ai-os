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

## Phase 0: Scaffold

- [x] Read the Show HN capture and record the V1 history, V2 architecture and feature list
- [x] Write SPEC.md (this document)
- [x] Stand up the Rust workspace with the server core and WASM client target
- [x] Run the existing test suite to confirm the 200k LOC baseline builds

## Phase 1: Core

- [ ] Verify server-authoritative play with client-side prediction in a live 1v1
- [ ] Wire team matches, objectives and the Bronze to Grand Master ladder
- [ ] Exercise the auto-scaling path: node join plus live-game rebalance with no disruption

## Phase 2: Deploy

- [ ] Launch snaketron.io publicly and monitor concurrency and rebalances
- [ ] Calibrate the ladder once enough players arrive
- [ ] Decide the server-cost and monetization story openly
