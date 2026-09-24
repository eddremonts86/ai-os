# SPEC.md — Sirius – A type system for array programming

## Problem

Hi HN, this page is a pitch &amp; demo for my WIP array programming language. Nothing in the type system is novel -- shape-dependent types with constraint solving, loop nest lattice counting, existentials -- but I think the combination is unique (hard to say considering the activity in this space). I find it surprisingly easy to read and debug. I&#x27;d love to hear your thoughts if you&#x27;re a PL person or just work day-to-day with array langs.<p>Sorry if the web demo doesn&#x27;t work for you; it depends on a Z3 Wasm build which seems flaky on some browsers. You&#x27;ll have to try the CLI to get a hands-on experience.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49643870)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T14:01:35Z

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
