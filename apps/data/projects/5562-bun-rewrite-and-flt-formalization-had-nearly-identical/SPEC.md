# SPEC.md — Bun rewrite and FLT formalization had nearly identical resource usage

## Problem

The Bun rewrite took 11 days and used 5.9B tokens:<p>https:&#x2F;&#x2F;bun.com&#x2F;blog&#x2F;bun-in-rust<p>The FLT formalization took 11 days (!) and used 6B tokens.<p>Why the similar numbers? Why are the numbers so low? 6B is just enough for 6 agents at 1000 tokens&#x2F;s running for 11 days.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49600530)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-07T17:07:45Z

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
