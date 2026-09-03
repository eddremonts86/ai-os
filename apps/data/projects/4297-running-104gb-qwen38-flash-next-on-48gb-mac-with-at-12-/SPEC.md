# SPEC.md — Running 104GB Qwen3.8-Flash-Next on 48GB Mac with at ~12 tok/s

## Problem

I built slotstream, a way to run Qwen3.8-Flash-Next 4-bit on a low-memory mac starting from 16GB, a 125B parameter model that would need 100GB+ memory&#x2F;RAM, thanks to expert-offloading&#x2F;ssd-streaming. Easy to install&#x2F;update, and mac-native using MLX and Swift.<p>It ships with auto-mode, which makes a good tradeoff between memory usage and speed. I&#x27;ll be implementing and porting the MTP module for speculative decoding next

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49524447)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T16:42:46Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
