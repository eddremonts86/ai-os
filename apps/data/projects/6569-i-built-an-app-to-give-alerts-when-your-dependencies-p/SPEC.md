# SPEC.md — I built an App to give alerts when your dependencies(Postgres) reach End of Life

## Problem

At my current org, our product has a couple of dependencies we need to keep up to date whenever a new release ships.
So I built this app to track those dependencies&#x27; end-of-life dates and alert us when a new release ships after its EOL date.
461 products, 8,441 tracked release cycles, polled daily against endoflife.date. That&#x27;s where the underlying dates come from; it&#x27;s MIT-licensed, and if you only need a one-time lookup, use it directly instead of this.
Check out the app here: https:&#x2F;&#x2F;www.getendoflife.com&#x2F;

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49669898)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-12T07:32:04Z

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
