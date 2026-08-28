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

## Problem

The poster shipped Zeitgeist Game at zeitgeistgame.pages.dev, a game where you guess the date a given Hacker News front page belongs to. The HN post body contains no further detail.

## Objective

Show an old HN front page and let the player guess which date it is from.

## Target Users

HN readers who want a nostalgia/zeitgeist guessing game based on what was trending on the site years ago.

## MVP Scope

Static web app that pulls archived HN front pages, shows one, and grades the player's date guess.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Source of historical HN snapshots; gaps would limit coverage.
