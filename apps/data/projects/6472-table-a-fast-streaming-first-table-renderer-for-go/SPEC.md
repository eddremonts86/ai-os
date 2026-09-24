# SPEC.md — Table – A fast, streaming-first table renderer for Go

## Problem

I built this because I wanted one Go table library that could handle text, HTML, GFM, CSV&#x2F;TSV, and other table-oriented output without giving up streaming.<p>The main design goal is to provide both a Table API and a row-at-a-time Stream API for every output format. I also spent quite a bit of time reducing allocations; in the included Simple and Complex benchmarks, it was the fastest of the compared implementations.<p>I’d appreciate any feedback.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49660276)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T15:40:07Z

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
