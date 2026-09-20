# SPEC.md — Is OpenAI silently routing GPT‑6 requests to GPT‑4o?

## Problem

I’ve selected GPT‑6, but the responses clearly match GPT‑4o’s behavior.<p>Is OpenAI’s model router performing silent fallback under load?<p>Has anyone else observed inconsistent routing or degraded model quality recently?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49598441)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-07T13:49:22Z

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
