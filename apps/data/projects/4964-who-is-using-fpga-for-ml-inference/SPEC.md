---
id: "4964"
slug: who-is-using-fpga-for-ml-inference
title: Who is using FPGA for ML inference?
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49557875"
category: ask-hn
date: "2026-09-03"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Who is using FPGA for ML inference?

## Problem

With RAM price inflation, I wonder if FPGAs can be used to offload inference processing without keeping weights in RAM? The available RAM would be for activations, KV Cache, context but not static weights. Weights could be streamed from disk. This approach is not for tokens/second but throughput at a lower cost. Possibly better answers/kHh? I've started researching this, but wonder if others have considered/tried this?

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
