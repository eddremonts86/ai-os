---
id: "4205"
slug: i-built-this-social-leaderboard-game
title: I built this social leaderboard game
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508885"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I built this social leaderboard game

## Problem

The author built 'King of the World', an online social leaderboard game, just for fun. The title is won in the game's world and grants nothing in the real one.


---

## Objective

Ship a small social leaderboard game where players compete for an in-game title that has no real-world value.


## Target Users

Players who enjoy light social competition online and want a low-stakes game they can play for fun. Assumes web access and a willingness to keep coming back to defend or chase a title.


## MVP Scope

- An online leaderboard.
- A social game loop that produces a 'title' for the current leader.
- Public profile or shareable link so players can show their standings.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The source post is a one-paragraph pitch; many standard product decisions (monetisation, retention loop, audience size, platforms) are unstated.
- 'Just for fun' is a stated framing, so commercial pressure is intentionally low.
- No stated distribution channels beyond a Show HN.

