---
id: "3120"
slug: highball-run-windows-games-on-apple-silicon-with-an-ope
title: "Highball – Run Windows games on Apple Silicon, with an open game db"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450662"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Highball – Run Windows games on Apple Silicon, with an open game db

## Tech Stack

Not stated by the source. A translation-layer launcher would typically be a Swift / SwiftUI macOS app wrapping Wine, CrossOver or the Game Porting Toolkit, with a separate data store for the open DB. Specifics are TODO.

## Architecture

A macOS launcher that drives an existing translation backend (which one is TODO) and a queryable open database of per-game compatibility results. The DB contribution flow is not described by the source.

## Milestones

- [ ] The GitHub repo at gauthierpiarrette/highball builds and runs a Windows game on an M-series Mac.
- [ ] The open game DB is queryable and accepts contributions.
- [ ] Anything beyond a single-user launcher (multi-user, cloud sync, store integration) is not implied by the source.

## Risks

Translation-layer projects drift when Apple changes the underlying SDK. The project also inherits whatever licensing applies to the bundled translation engine.
