# SPEC.md — Glu – installing Homebrew packages 2x faster on macOS

## Problem

I wanted to see how fast Homebrew installs could get if end-to-end install time was the primary design constraint.<p>It turned into a package manager for macOS that uses Homebrew&#x27;s bottle ecosystem, consistently ~2x faster than Homebrew on large install graphs.<p>It&#x27;s written in Rust, but most performance ideas are independent of the language.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49722369)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T05:15:40Z

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
