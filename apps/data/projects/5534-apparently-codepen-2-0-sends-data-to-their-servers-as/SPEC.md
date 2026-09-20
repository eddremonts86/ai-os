# SPEC.md — Apparently CodePen 2.0 sends data to their servers as you type

## Problem

They send all typed into editor input to codepen.dev almost immediately (you would see in 1-2 sec after you typed your secret that it appears in respective Network&#x2F;Response tab) even before one saved it. I tested this with a unique marker: after typing it into index.html, CodePen ran a build with &quot;save:false&quot;, and the marker then appeared verbatim in the HTML served from the generated &quot;*.codepen.dev preview&quot;. Thus, if you ever entered some secrets in there by mistake consider them compromized even if you did not publish&#x2F;save the pen

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49596976)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-07T11:22:40Z

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
