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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A free browser game where the player competes against the computer (not AI) across quirky mini-modes, with the author's original retro pixel art and ToMek OsuMek's original soundtrack.

## Target Users

Casual browser-game players and viewers of the REParadoxy YouTube channel — both groups arrive expecting a quick, install-free retro-arcade experience.

## Jobs To Be Done

When a viewer of the REParadoxy channel wants to play the game from the trailer, they open the GitHub Pages link, pick a mini-mode (RPS…Water, Click The Gigachad, fun-facts rounds), and try to outlast the computer's scripted responses. When a hobbyist coder likes the game, they fork the repo and follow CONTRIBUTING.md to send a patch.

## Success Metrics

The post gives no numbers. The only signals in the source are the launch trailer on YouTube, the live GitHub Pages URL, and the open CONTRIBUTING.md — treat those as the channels through which success will show up, but do not invent a target retention or DAU figure.

## Competitive Landscape

_Source does not name any competing game in this niche._

## Risks & Open Questions

Pygbag's WASM sandbox limits what the runtime can do — anything that needs filesystem or native Python extensions will not work in the browser build. Asset licences for Rubinosław's art and ToMek OsuMek's music are not stated, so redistribution outside the project needs author confirmation. Source gives no WTP signal — the game is explicitly free.
