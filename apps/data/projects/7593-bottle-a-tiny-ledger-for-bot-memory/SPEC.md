# SPEC.md — Bottle – a tiny ledger for bot memory

## Problem

Bottle is a ledger that gives AI agents&#x2F;bots the ability to log facts against custom schemas and query those facts using a fixed set of commands.<p>It&#x27;s the middle ground for when you want more structure than markdown, but less structure than SQL.<p>I made it because I wanted to give AI agents a way to store and retrieve structured facts for repeated events but didn&#x27;t want the structure to be defined as prose, didn&#x27;t want the facts to be stored as prose, and didn&#x27;t want AI to overcomplicate things with SQL.<p>Maybe you want to track hours worked on projects.  Maybe want to track fitness or nutrition data.  Maybe you want to track expenses, or leads, or any other form of repeated, structured data, and you want an agent or a bot to do all the tracking.<p>If that&#x27;s the case, then Bottle might be what you&#x27;re looking for.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49739531)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T12:01:33Z

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
