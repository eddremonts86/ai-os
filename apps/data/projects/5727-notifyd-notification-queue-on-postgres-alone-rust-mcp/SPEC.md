# SPEC.md — Notifyd – notification queue on Postgres alone (Rust, MCP, no UI)

## Problem

https://rmzlb.github.io/notifyd/articles/postgres-queue-what-skip-locked-does-not-give-you.html

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49609589)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T12:45:05Z

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
