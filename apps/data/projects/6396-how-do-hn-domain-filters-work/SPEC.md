# SPEC.md — How do HN domain filters work?

## Problem

I’ve had an HN account for years and submit everything manually. I occasionally posted articles from my project’s domain, but at some point those submissions started appearing normally to me while disappearing when viewed logged out.<p>No bots, no automated posting, no mass submissions.<p>What frustrates me is that this seems to be happening everywhere. Reddit can restrict accounts as soon as you post a link. HN appears to silently filter domains. The Internet is becoming a place where it’s increasingly hard to simply build something, share it, and reach even a small relevant audience.<p>Does HN apply automatic domain-level filtering? What usually triggers it, and is there any normal way to recover from it?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49657611)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-11T12:53:05Z

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
