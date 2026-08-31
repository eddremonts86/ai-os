---
id: "4086"
slug: moe-direct-moe-models-far-larger-than-your-ram-on-a-con
title: "Moe-Direct – MoE Models far larger than your RAM, on a consumer desktop"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49492409"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Moe-Direct – MoE Models far larger than your RAM, on a consumer desktop

## Problem

I wanted to try using the larger models on my computer (32GB RAM, RTX 5080, Gen5 NVMe), but the best I could do was around 30B.
So I started with the idea that it might be possible by taking advantage of the fact that MoE models use only some of the experts rather than all of them.MoE-Direct essentially uses the three layers of SSD, RAM, and VRAM instead of residing entirely in memory, caching only the necessary experts in RAM and making the model usable even with resources far smaller than required.In my environment, I obtained the following decode results:
Kimi K2.6: 1.03 tok/s.
Qwen3.5-122B: 5.59–5.69 tok/s, with decode performance about 2.3 times better than plain mmap for the same binary.The current project is still far from the intended stage of practical use, and there are still many problems that need to be addressed.
Since MoE-Direct is still in its early stages and external usability reviews and testing have not yet been conducted, I am very interested in feedback on my project and participation in testing.(Linux and macOS do not have a test environment available at the moment, so it is only possible on Windows.)

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
