---
id: "3149"
slug: music-puzzle-game-on-steroids
title: Music Puzzle Game on Steroids
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447840"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Web Audio API, static HTML/JS/CSS, static host]
---
# Music Puzzle Game on Steroids

## Phase 0: Scaffold

- [ ] Audit the existing vibecoded weekend build to know what is in place before adding anything
- [ ] Decide hosting target (static host sufficient for a single-page client game)
- [ ] Add a minimal build pipeline if the existing code is unbundled
- [ ] Pin a small set of songs cleared for stem-decomposition and puzzle use

## Phase 1: Core

- [ ] Wire Web Audio graph: source track → stem split → vocal-to-humming conversion → speakers
- [ ] Build the round UI: play mix, accept guess, reveal answer, offer replay
- [ ] Confirm the vocal-to-humming DSP gives a stable, recognisable hum across browsers
- [ ] Smoke-test a full round end-to-end in the browser before touching deploy

## Phase 2: Deploy

- [ ] Create the GitHub repo (or push to the existing one the maker already uses)
- [ ] Deploy to a static host that can absorb the existing organic traffic
- [ ] Verify in production: open the deployed URL, play one full round, confirm the humming conversion sounds right

---

_Generated automatically by Lúa on 2026-08-26_
