---
id: "4188"
slug: cool-concepts
title: "Cool Concepts"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509756"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Cool Concepts

## Problem

Cool Concepts (mkornreich.me/projects/coolconcepts/) is a small interactive demo that makes up cool, real-sounding big ideas. The landing page frames it as inspired by xkcd #2318 ("Dynamic Entropy") and shows the mechanic: drag words around, drop two on top of each other to mix them into a new one, hit Space for a new word or E for "what is it?", and use the arrow keys to nudge. The "What is it?" description uses a tiny word-brain that runs in the browser. The post is the demo itself, not a product with a market.


---

## Objective

Ship a small interactive browser demo that mashes up big-idea words into real-sounding but invented concepts, with a tiny word-brain that can describe what the user just made.


## Target Users

Visitors to a personal site who want a five-minute toy: drag words, mash two together, read what the mash-up is supposed to mean. Assumes the reader has a mouse or keyboard and a browser.


## MVP Scope

- A word list of "cool, real-sounding big ideas" (the xkcd-style starting vocabulary).
- A drag-and-drop UI that mixes two words into a new one.
- A keyboard fallback (arrow keys to nudge, Space / E for new word / what-is-it).
- A tiny in-browser word-brain that produces a description for the user's mash-up.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing; the demo is a personal-project toy.
- The "word-brain" has to run entirely in the browser, no API call.
- The mash-up has to look like a real concept on the page, not a placeholder.
