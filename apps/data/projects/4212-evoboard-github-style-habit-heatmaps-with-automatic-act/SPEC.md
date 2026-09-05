---
id: "4212"
slug: evoboard-github-style-habit-heatmaps-with-automatic-act
title: Evoboard – GitHub style habit heatmaps with automatic activity logging
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508482"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Evoboard – GitHub style habit heatmaps with automatic activity logging

## Problem

The author liked the contribution graphs on GitHub and LeetCode and wanted the same idea for everyday habits. Evoboard is a year-long heatmap of personal habits, with habits that can be completed automatically when you do them: committing to GitHub, playing a game of chess, or doing a LeetCode problem can update the corresponding habit automatically. Other apps connect through API or a Chrome extension. Users can share their profile to stay motivated.


---

## Objective

Track everyday habits on a year-long GitHub-style heatmap, with auto-completion from the apps the user already uses, and a shareable profile.


## Target Users

Self-trackers, developers and lifelong learners who already use GitHub/LeetCode and want a single habit board that updates itself when those activities happen. Assumes comfort connecting accounts and using a Chrome extension.


## MVP Scope

- Year-long heatmap view of habits, GitHub-style.
- Built-in auto-completion: GitHub commits, chess games, LeetCode solves.
- Connect any other app via API or a Chrome extension.
- Shareable profile URL.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Integration list is open-ended; each new app is its own connector.
- Source does not state pricing, premium features, or storage retention.
- The Chrome extension is the catch-all channel for unsupported apps.

