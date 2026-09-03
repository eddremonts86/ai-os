# SPEC.md — The Fastest Local H3 Video Generation on Mac

## Problem

960×544, 124 frames, 6 DiT steps with Turbo LoRA:<p>On M5 Pro MacBook Pro 16&quot;, 24 GB RAM: 
Vpipe 5 min 0 sec vs. H3.c 7 min 19 sec.<p>For comparison, H3.c is probably the best-known “hardcore” H3 implementation out there.<p>Vpipe runs H3 through our own C++&#x2F;Metal inference stack — no Python or third-party tensor runtime in the forward pass. We use weight streaming with resident blocks to fit the 33B model on a 16GB Mac, with M5-specific acceleration through NAX matmul2d.<p>If you know of a faster H3 implementation on Apple Silicon, we’d love to benchmark against it.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49523873)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T16:03:04Z

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
