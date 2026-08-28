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

## Problem

Filip / "Rubinosław" (REParadoxy channel) built his first web game using Python with Pygame and Pygbag. It is a humour-led "Player vs Computer" game — explicitly not AI — where the player tests their durability against the machine across a few mini-modes (Rock Paper Scissors... Water, Click The Gigachad without ending, random fun facts, quippy responses and the occasional advice), backed by his own retro pixel art and original music by ToMek OsuMek. He is asking for open-source contributions via the GitHub repo.

## Objective

Ship the game in a browser, gather open-source contributors, and grow the REParadoxy channel's audience around it. The poster names no revenue goal — the objective is reach and contributor inflow, not monetisation.

## Target Users

Casual web-games players who land on the GitHub Pages URL and viewers of the REParadoxy YouTube channel who follow the trailer link. Both groups expect a short, retro-arcade-style browser experience with no install.

## MVP Scope

The four named mini-modes (Rock Paper Scissors... Water, Click The Gigachad without ending, random fun facts, computer quips/advice), the retro pixel art by Rubinosław, and the original soundtrack by ToMek OsuMek — already live at rubinoslaw.github.io/Player-vs-Computer/ and on GitHub.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Pygbag compiles Pygame to WebAssembly, so the game has to stay within what the WASM sandbox will run — no native Python deps, no filesystem writes. Original assets (art and music) live with the project; licence terms for those assets are not stated in the source, so re-use outside the project needs author confirmation.
