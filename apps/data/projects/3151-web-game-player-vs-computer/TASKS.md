---
id: "3151"
slug: web-game-player-vs-computer
title: "Web Game \"Player vs. Computer\""
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447717"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Python, Pygame, Pygbag, GitHub Pages]
---
# Web Game "Player vs. Computer"

## Phase 0: Scaffold

- [ ] Audit the existing repo at github.com/Rubinoslaw/Player-vs-Computer/ to know what is already there
- [ ] Pin Python and Pygame/Pygbag versions so the WASM build is reproducible
- [ ] Confirm CONTRIBUTING.md exists and is readable on first repo visit
- [ ] Document the assets folder layout (Rubinosław art, ToMek OsuMek music) for new contributors

## Phase 1: Core

- [ ] Make every mini-mode run inside the Pygbag browser build, not just desktop Pygame
- [ ] Centralise the computer "AI" responses so the post's "not ai" stays accurate as more quips are added
- [ ] Smoke-test each mini-mode in the browser before tagging a release
- [ ] Confirm the YouTube launch trailer link still resolves to the correct video

## Phase 2: Deploy

- [ ] Push the WASM bundle to GitHub Pages at rubinoslaw.github.io/Player-vs-Computer/
- [ ] Verify in production: open the deployed URL, play one round of RPS…Water and one Click The Gigachad round

---

_Generated automatically by Lúa on 2026-08-26_
