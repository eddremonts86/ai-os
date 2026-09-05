# SPEC.md — Who is using FPGA for ML inference?

## Problem

With RAM price inflation, I wonder if FPGAs can be used to offload inference processing without keeping weights in RAM?  The available RAM would be for activations, KV Cache, context but not static weights.  Weights could be streamed from disk.  This approach is not for tokens&#x2F;second but throughput at a lower cost.  Possibly better answers&#x2F;kHh?  I&#x27;ve started researching this, but wonder if others have considered&#x2F;tried this?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49557875)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-03T22:14:35Z

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
