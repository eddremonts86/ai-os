# SPEC.md — I'm not a PostgREST fan this is why I'm building an alternative

## Problem

Don&#x27;t get me wrong, core PostgREST concept is good. But I do think that stuff like Haskell and PlSQL should not be used in production.<p>This is why I came up with the idea to make my own API generation service.
Right now it is using SqLite as a main DB and generates endpoints based based on TOML DSL with some LUA scripting.<p>I guess in several week I will have fully working usable MVP.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49630394)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T17:47:41Z

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
