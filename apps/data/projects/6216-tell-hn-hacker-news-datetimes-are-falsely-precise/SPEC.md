# SPEC.md — Tell HN: Hacker News datetimes are falsely precise

## Problem

I just noticed that the datetime for comments and submissions is weirdly precise. Apparently all comments happen exactly on the second, to the microsecond!<p>e.g. here is one from a few minutes ago:
2026-09-10T14:50:13.000000Z<p>This is a clear example of false precision:<p>https:&#x2F;&#x2F;en.wikipedia.org&#x2F;wiki&#x2F;False_precision

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49644964)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-10T15:01:41Z

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
