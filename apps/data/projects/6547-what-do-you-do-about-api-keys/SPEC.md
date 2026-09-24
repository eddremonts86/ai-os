# SPEC.md — What do you do about API keys?

## Problem

Having them in plaintext always seemed like a bad idea. Forget agents accidentally reading .env; any random package you get from the AUR can trivially read all your keys.<p>Ideally you&#x27;d have read permissions restricted to users&#x2F;groups that need it, but since most software that needs it is under the user UID, I don&#x27;t see how this would work.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49668727)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-12T04:11:54Z

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
