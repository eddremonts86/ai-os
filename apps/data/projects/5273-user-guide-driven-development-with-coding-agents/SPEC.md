# SPEC.md — User-guide-driven development with coding agents

## Problem

Since agents now own most, if not all of the coding process, I&#x27;ve been wondering what would be the best durable and reviewable source of truth for the human side to own.<p>One of the ideas I&#x27;ve been experimenting with is user-guide-driven development, where I write a user guide and mockups first, and let the agents iterate from there until they match the guide. I&#x27;ve almost stopped using unit tests and create user-experience instead, i.e. a context-less agent goes through the guide and tries to follow it literally before the work is considered done.<p>I&#x27;ve been using it in small utils, and feel more in control of the process. tbh though, I&#x27;m not sure how far this approach can scale.  I&#x27;m curious where people think this breaks.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49579372)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-05T18:38:11Z

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
