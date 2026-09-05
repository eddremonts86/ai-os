---
id: "4177"
slug: slotstream-run-qwen38-flash-next-4-bit-on-a-low-memory-
title: "Slotstream, run Qwen3.8-Flash-Next 4-bit on a low-memory Mac"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510441"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Slotstream, run Qwen3.8-Flash-Next 4-bit on a low-memory Mac

## Problem

Slotstream is a way to run Qwen3.8-Flash-Next 4-bit on a low-memory Mac starting from 16GB of RAM, even though the model is 125B parameters and would normally need 100GB+ of memory. The trick is expert-offloading and SSD-streaming, native to macOS via MLX and Swift. It ships with an auto-mode that trades off memory usage vs speed. Future work: implement and port the MTP module for speculative decoding.


---

## Objective

Run a 125B-parameter model locally on a 16GB Mac with a usable speed/quality trade-off, without requiring the user to set up a deep-learning stack by hand.


## Target Users

macOS users with 16GB+ RAM who want to run a large local model without renting GPUs. Assumes comfort with installing a CLI app and tolerating the slower-than-GPU throughput that SSD-streaming implies.


## MVP Scope

- Native macOS install (via MLX + Swift) that runs Qwen3.8-Flash-Next 4-bit.
- Expert-offloading and SSD-streaming so the model fits in 16GB of RAM.
- Auto-mode that picks a sensible memory/speed trade-off.
- Easy install and update flow.
- Roadmap item: MTP module for speculative decoding.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Hard memory budget: must run on a 16GB Mac.
- Native macOS only via MLX + Swift; not cross-platform in the source.
- Throughput is bound by SSD bandwidth and expert-offloading; competitive gameplay latency is not the target.
- Source does not state pricing or licensing model for the tool itself.

