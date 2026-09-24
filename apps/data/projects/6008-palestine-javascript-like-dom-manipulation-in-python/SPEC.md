# SPEC.md — Palestine – JavaScript-like DOM manipulation in Python

## Problem

from palestine import Document, Html, Body, Div, Text<p>doc = Document()<p>html = Html()<p>body = Body()<p>doc.append_child(html)<p>html.append_child(body)<p>page = Div(class_=&quot;container&quot;)<p>page.append_child(Text(&quot;Hello from Palestine&quot;))<p>body.append_child(page)<p>print(doc)<p><a href="https:&#x2F;&#x2F;github.com&#x2F;u84u&#x2F;palestine" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;u84u&#x2F;palestine</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49626886)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T14:08:47Z

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
