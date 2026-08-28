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

## Tech Stack

Python 3 with Pygame for the game loop and Pygbag to compile to WebAssembly for the browser. GitHub Pages hosts the static WASM bundle at rubinoslaw.github.io/Player-vs-Computer/. GitHub is the source-of-truth and the contribution surface, per the post.

## Architecture

Pygame game code runs in a single Python module; Pygbag wraps it for the browser. Each mini-mode is a self-contained state in the game loop, and the computer "AI" is a deterministic script — not a model — that picks responses per the post ("not ai"). Art and music load from the project assets folder.

## Milestones

- Keep the four mini-modes (RPS…Water, Click The Gigachad, fun-facts rounds, quips/advice) playable end-to-end in the browser build.
- Ensure Pygbag build stays inside the WASM sandbox constraints — no native deps creep in.
- Maintain the CONTRIBUTING.md path so the post's call for contributions lands somewhere real.
- Verify the GitHub Pages deploy still resolves and the trailer YouTube link still points at the right video.

## Risks

WASM sandbox may quietly drop features that work in desktop Pygame. Asset licences for the original pixel art and original soundtrack are not declared in the source. The game depends on two collaborators (Rubinosław for art, ToMek OsuMek for music) — losing either leaves a gap the project can't fill unilaterally.
