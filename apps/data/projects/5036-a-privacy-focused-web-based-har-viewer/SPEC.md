# SPEC.md — A privacy-focused web-based HAR viewer

## Problem

The idea of having to connect to a cloud service or even log in to do something like look at or make network requests has never sat well with me. And viewing har files in devtools is clunky. So I built a web-based, as-private-as-I-could-make it har viewer. Basically it has all the CSP along with build-time and run-time verification to confirm that the page can&#x27;t leak anything. I&#x27;d love to hear feedback on how to make it even harder to mess up :)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49564463)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T13:38:24Z

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
