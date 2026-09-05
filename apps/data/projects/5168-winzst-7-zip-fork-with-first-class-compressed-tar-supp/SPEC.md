# SPEC.md — WinZST > 7-Zip fork with first-class compressed tar support on Windows

## Problem

WinZST is a 7-Zip fork that extracts compressed tar archives directly to their final directory instead of materializing an intermediate `.tar`.<p>In one 11.8 GiB `.tar.gz` test containing mostly video, WinZST took 51.87s from archive → `foo&#x2F;`; 7-Zip took 103.53s across `.tar.gz` → `.tar` → `foo&#x2F;`.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49572950)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-05T03:58:23Z

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
