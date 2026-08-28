---
id: "3125"
slug: burylol-a-2-pixel-art-graveyard-for-things-that-died
title: Bury.lol – a $2 pixel-art graveyard for things that died
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450273"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Bury.lol – a $2 pixel-art graveyard for things that died

## Tech Stack

Not stated by the source. A small paid web app: likely a static frontend, a payment-provider integration, and a backend that stores entries and renders pixel-art pages. Specifics are TODO.

## Architecture

A web flow that takes a small payload, charges $2, and produces a permanent-looking memorial page. The persistence model (CMS, file-on-disk, blockchain) is unstated.

## Milestones

- [ ] The site at bury.lol accepts a name and message, takes a $2 payment, and renders a pixel-art page.
- [ ] The rendered page is reachable by URL.
- [ ] Anything beyond a single-page memorial (comments, sharing, public index) is not implied by the source.

## Risks

Permanence: the marketing promise of a "graveyard" implies long-term hosting that a $2 one-shot payment cannot fund unless volume is high.
