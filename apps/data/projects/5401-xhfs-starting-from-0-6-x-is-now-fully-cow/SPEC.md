# SPEC.md — XHFS starting from 0.6.x is now fully CoW

## Problem

The spec was revisited, especially around its Copy-on-Write mechanism. XHFS now provides more robust guarantees for concurrent reads and writes. It has its own embedded WebDAV server, which has also been improved for better speed.<p>It has been tested with Windows Explorer, GNOME Nautilus, rclone, and more!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49587244)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T15:10:32Z

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
