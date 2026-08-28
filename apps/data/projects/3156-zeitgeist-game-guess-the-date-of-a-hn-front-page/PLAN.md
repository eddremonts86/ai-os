---
id: "3156"
slug: zeitgeist-game-guess-the-date-of-a-hn-front-page
title: Zeitgeist Game – guess the date of a HN front page
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447306"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Zeitgeist Game – guess the date of a HN front page

## Tech Stack

Static site at zeitgeistgame.pages.dev (Cloudflare Pages).
Archive of HN front-page HTML snapshots committed as JSON or static HTML.
Vanilla JS for the guess UI; no server logic.

## Architecture

Single-process deliverable: Static web app that pulls archived HN front pages, shows one, and grades the player's date guess.

## Milestones

MVP static game with a small archive of HN front pages and a guess UI.

## Risks

Source of historical HN snapshots; gaps would limit coverage.
