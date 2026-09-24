# SPEC.md — Direct SQL Access to Your QuickBooks Data

## Problem

Hey guys, I dunno about you but if you have a business and use QuickBooks, the normal API access is pretty cumbersome.<p>So we built a direct SQL layer to a simple model of the ledger. It&#x27;s nice to have easy fast programmatic access to your books for building internal apps and stuff, not to mention giving agents access. (Agents are really good at SQL, read-only of course.)<p>Along the way, this made us wonder: when does an app or service really need a custom API at all, rather than just exposing data as SQL, which is sorta the lingua franca of data querying.  Will more services do this in the future?<p>Curious what you think!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49703551)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T20:34:33Z

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
