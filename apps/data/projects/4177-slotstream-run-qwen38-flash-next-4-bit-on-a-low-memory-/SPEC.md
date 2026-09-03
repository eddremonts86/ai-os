# SPEC.md — Slotstream, run Qwen3.8-Flash-Next 4-bit on a low-memory Mac

## Problem

I built slotstream, a way to run Qwen3.8-Flash-Next 4-bit on a low-memory mac starting from 16GB, a 125B parameter model that would need 100GB+ memory&#x2F;RAM, thanks to expert-offloading&#x2F;ssd-streaming. Easy to install&#x2F;update, and mac-native using MLX and Swift.<p>It ships with auto-mode, which makes a good tradeoff between memory usage and speed.<p>I&#x27;ll be implementing and porting the MTP module for speculative decoding next<p>Local models really are the future of computing!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49510441)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-08-31T14:46:54Z

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
