# SPEC.md — A C Compiler written with help of Claude

## Problem

For fun, I wrote a c compiler (non-optimizing) in Java targeting modern C (C23) using claude. I developed a c shell similar to jshell in java.  The compiler also bundles a built in an assembler for x86. A linker is planned for end-to-end compilation.  There is still a lot of work in progress but I wanted to share the project early for feedback.  I spent around $400 in AI credits so far and it took over a week on and off of working on it.<p>I drive the architecture of the compiler and verify the AI implementation with a large test suite.<p>It can compile and run lua (all test passing) and curl (partially).<p>Cheers!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49673804)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-12T16:06:11Z

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
