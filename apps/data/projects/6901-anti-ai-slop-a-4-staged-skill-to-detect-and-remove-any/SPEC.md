# SPEC.md — Anti-AI-slop: a 4 staged skill to detect and remove any AI writing slop

## Problem

catches 41 different slop patterns:
• ~120 ai words, ~100 phrases
• em dashes, emoji bullets, title case headings
• watermarks, negative parallelism, colon reveals, throat-clearing openers<p>4 gates:
1. sanitize invisible chars
2. remove common ai words&#x2F;chars
3. an agent reviews original vs rewrite, loops back for failed reviews
4. optional: a parallel agent uses a different model to generate additional review + score<p>Works with any of your AI agents.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49692619)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T06:11:01Z

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
