# SPEC.md — Pappice live demo in browser via WASM

## Problem

I needed a public demo to show pappice usage, and I just wanted to bypass the public shared contents problem (periodic resets, features disabling, contents restrictions, ecc).
The solution was to compile all the server, SQLite included, to WASM and run it entirely in browser, so every user has his own instance now and can mess freely.
That&#x27;s just a 8&#x2F;9 gzipped MBs download.
I&#x27;m very proud of the achievement; that demonstrates a lot of how lightweight pappice is.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49743479)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T16:55:04Z

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
