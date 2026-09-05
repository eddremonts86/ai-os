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

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — does not apply to the on-device inference runtime, which is MLX + Swift as stated in the source. The stack supports the docs site and a small companion dashboard for benchmark tracking.

## Architecture

Native macOS app using MLX and Swift. The model is sharded across SSD with expert-offloading so only a fraction of the 125B parameters lives in RAM at any time. A CLI front-end takes prompts and streams tokens back. A TanStack Start + SQLite backend serves a docs site and benchmark dashboard; Coolify hosts it.

## Milestones

- M1 — Load Qwen3.8-Flash-Next 4-bit from SSD with the first working prompt.
- M2 — Auto-mode that adapts the memory/speed trade-off to available RAM.
- M3 — Install/update flow that feels native.
- M4 — Benchmark dashboard.
- M5 — Port the MTP module for speculative decoding.

## Risks

- SSD streaming is the long pole; mitigation is to track throughput regressions and expose a 'RAM-only' mode for users who can afford it.
- macOS-only deployment; mitigation is to keep the CLI front-end portable even if the runtime is not.
- Roadmap item (MTP) is speculative; mitigation is to keep the abstraction stable so the MTP port is additive.
