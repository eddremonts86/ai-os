---
id: "4223"
slug: no-rush-free-macos-ambient-places-on-their-own-local-ti
title: "No Rush – Free macOS ambient places on their own local time and weather"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507180"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# No Rush – Free macOS ambient places on their own local time and weather

## Problem

No Rush (no-rush.app) is a free macOS ambient app that places a real-looking environment on the user's desk, with its own local time and weather. The landing page frames it as "a real place on your desk" — the place composes itself and quietly follows the user's focus, swelling the room's mask when the user is working and easing back when they stop. Voices come and go, the wind changes its lean, and a bird sings from a new branch. The app ships as an AppImage and a browser version; the page emphasizes that the user does not mix the scene, they inhabit it.


---

## Objective

Ship a free macOS / browser ambient app that places a real-looking environment on the user's desk, with its own local time, weather, and audio that follows the user's focus.


## Target Users

macOS / Linux desktop users who want a quiet ambient scene on their second monitor or in a browser tab, with audio that responds to whether they are working or idle. Assumes the reader can install an AppImage or open a browser tab.


## MVP Scope

- A single ambient scene that renders on a desktop or in a browser.
- A local-time clock for the scene (e.g. a Tokyo cafe runs on JST).
- A weather source so the scene reflects current conditions.
- An audio mix that swells in Focus mode and eases back when the user is idle.
- An AppImage build for Linux desktops.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing; the product is presented as free.
- macOS / Linux desktop is the primary target; mobile is not in scope.
- The scene composes itself; the user does not place objects manually.
