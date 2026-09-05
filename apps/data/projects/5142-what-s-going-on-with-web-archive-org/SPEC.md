# SPEC.md — What's Going on with Web.archive.org

## Problem

https:&#x2F;&#x2F;web.archive.org&#x2F;cdx&#x2F;search&#x2F;cdx?url=example.com&amp;fl=timestamp,original&amp;limit=5&amp;showDupeCount=true<p>https:&#x2F;&#x2F;web.archive.org&#x2F;*&#x2F;example.com<p>HTTP 429 Too many requests

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49571448)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-04T23:36:03Z

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
