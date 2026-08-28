---
id: "3278"
slug: warp-run-the-313b-glm-53-flash-on-a-macbook-with-8gb-ra
title: Warp – Run the 313B GLM-5.3-Flash on a MacBook with 8GB RAM
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49466646"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Warp – Run the 313B GLM-5.3-Flash on a MacBook with 8GB RAM

## Problem

A few months ago, I created the WARP engine (formerly WASTE) to run Kimi K3, the complete 2.78-trillion-parameter model, on macOS.GLM-5.3-Flash shares many architectural similarities with Kimi K3, so I added support for it as well. It requires as little as 5.14 GB of RAM to run, and on a 64 GB MacBook Pro M5 Pro it reaches about 3.32 tok/s, or 3.86 tok/s on longer runs.More memory means a larger expert cache, while higher storage and memory bandwidth can further improve performance.The project is completely open-source and free to use:
https://github.com/sqliteai/warp

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
