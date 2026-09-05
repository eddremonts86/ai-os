---
id: "4303"
slug: the-fastest-local-h3-video-generation-on-mac
title: The Fastest Local H3 Video Generation on Mac
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49523873"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# The Fastest Local H3 Video Generation on Mac

## Problem

960×544, 124 frames, 6 DiT steps with Turbo LoRA:On M5 Pro MacBook Pro 16", 24 GB RAM:
Vpipe 5 min 0 sec vs. H3.c 7 min 19 sec.For comparison, H3.c is probably the best-known “hardcore” H3 implementation out there.Vpipe runs H3 through our own C++/Metal inference stack — no Python or third-party tensor runtime in the forward pass. We use weight streaming with resident blocks to fit the 33B model on a 16GB Mac, with M5-specific acceleration through NAX matmul2d.If you know of a faster H3 implementation on Apple Silicon, we’d love to benchmark against it.

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
