# SPEC.md — RAII and It's Architecture in C++

## Problem

RAII (Resource Acquisition Is Initialization) is the core of C++ idiom. It is about the process and idea of how the object cleans up happens after itself and how a resource belongs to an object lifetime. Why it’s needed anyway, it’s because manually managing resources is easy to get wrong.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49565572)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T14:54:37Z

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
