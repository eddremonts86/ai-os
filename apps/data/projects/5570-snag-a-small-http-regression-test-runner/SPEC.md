# SPEC.md — Snag, a small HTTP regression test runner

## Problem

For a personal project, I needed a small and lightweight HTTP regression test runner. Hurl was the closest thing I found, but I needed real scripting in my assertions. So I wrote Snag, It&#x27;s written in Rust and uses TOML for test definitions and Rhai for assertions and scripting. It&#x27;s pretty early in development but it&#x27;s usable. If you have any feedback, criticism or suggestions please let me know.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49601017)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-07T17:54:38Z

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
