# SPEC.md — Correctness as spectrum not as binary in distributed system

## Problem

In distributed system correctness is not about a program being complied well with the computer and it’s network, it’s only correctness can be only specified by it’s definition, assumptions and failure model.<p>One of the area in which we can see this happen is when system breaks the idea of single machine model and it’s assumptions. Networks can drop or reorder messages, clock drift, nodes can fail in mid operations and network partitions can occur. These are normal conditions, not rare edge cases.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49599255)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-07T15:06:57Z

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
