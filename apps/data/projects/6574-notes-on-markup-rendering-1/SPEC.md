# SPEC.md — Notes on Markup Rendering ">(1)

## Problem

Testing: &lt;b&gt;bold&lt;&#x2F;b&gt; &lt;script&gt;alert(1)&lt;&#x2F;script&gt; &lt;a href=&quot;javascript:alert(2)&quot;&gt;link&lt;&#x2F;a&gt; &amp;lt;img src=x onerror=alert(3)&amp;gt; [url](https:&#x2F;&#x2F;example.com) `code` &lt;u&gt;u&lt;&#x2F;u&gt;

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49663110)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-11T18:33:34Z

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
