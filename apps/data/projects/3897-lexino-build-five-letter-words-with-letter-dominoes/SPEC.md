---
id: "3897"
slug: lexino-build-five-letter-words-with-letter-dominoes
title: "Lexino - Build five-letter words with letter dominoes"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497141"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [game engine, word dictionary, local storage, offline PWA, CSS animation, static hosting]
---
# Lexino - Build five-letter words with letter dominoes

## Problem

The capture for this plan is a URL-only Show HN submission pointing at https://github.com/skorotkiewicz/lexino. The product claim carried by the title is Lexino, a word game where players build five-letter words using letter dominoes — tiles carrying letters that chain together, domino-style, to form valid words. The capture states nothing further: no rules description, no scoring, no platform and no screenshots beyond what the title implies.

## Objective

Ship the playable MVP of the game the title names: a board where letter dominoes are placed and chained, a dictionary that validates five-letter words, and a scoring loop that makes each placement feel earned. Because the capture specifies only the core mechanic, the MVP must keep every other rule minimal and documented as ours.

## Target Users

- Casual word-game players looking for a new daily loop beyond the usual guesses.
- Fans of Wordle-style constraints who want a spatial, tile-based twist.
- Puzzle gamers who enjoy domino mechanics outside the numeric original.
- Language learners using constrained spelling as practice.

## MVP Scope

- A board accepting letter dominoes placed to chain into five-letter words.
- Dictionary validation of every completed word.
- A scoring model rewarding longer or rarer chains.
- A daily puzzle mode with local progress tracking.

## Constraints

- Only the core mechanic is stated in the title; all other rules are our design and must be presented as such.
- The word list is load-bearing: coverage and licensing decisions affect legality and fun.
- Puzzle generation must guarantee solvability, or the daily mode loses trust.
- No platform, pricing or user claims exist in the capture; none may be invented.

## Design Direction

See `DESIGN.md` for this project's design tokens.
