# SPEC.md — Froogle – a search engine portal in one HTML file

## Problem

Silly but fun project: a search engine portal in one html file. It aims to bring back that retro 2005 search experience: lighting fast list of links and that’s about it.<p>It’s powered by <a href="https:&#x2F;&#x2F;keenable.ai" rel="nofollow">https:&#x2F;&#x2F;keenable.ai</a>, a new search API. You have 2 privacy options. 1) Proxied via <a href="https:&#x2F;&#x2F;froogle.fyi" rel="nofollow">https:&#x2F;&#x2F;froogle.fyi</a>. Keenable sees your queries, but not your IP or any user IDs. Your traffic is mixed with everyone else’s. This may get rate limited, but zero setup. 2) Direct access: bring your own Keenable API key (free 100k searches&#x2F;mo), and the browser calls the API directly. Froogle can’t see your queries, but Keenable gets a unique ID.<p>Try it: <a href="https:&#x2F;&#x2F;froogle.fyi&#x2F;" rel="nofollow">https:&#x2F;&#x2F;froogle.fyi&#x2F;</a><p>Github: <a href="https:&#x2F;&#x2F;github.com&#x2F;scosman&#x2F;froogle" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;scosman&#x2F;froogle</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49604846)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T01:52:54Z

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
