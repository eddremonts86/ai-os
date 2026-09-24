# SPEC.md — EterDB, a Postgres fork that makes it easy to recover from incidents

## Problem

Hey everyone, a few months ago, after recovering from a Clade-generated bug, I was thinking to myself “wouldn’t it be nice if prod DB writes were easy to roll back”. I’ve put something together: it’s a two-container deploy plus a CLI tool. It’s far from being production ready, so please be gentle. All feedback welcome!<p>The nitty gritty: <a href="https:&#x2F;&#x2F;eterdb.com&#x2F;tech" rel="nofollow">https:&#x2F;&#x2F;eterdb.com&#x2F;tech</a><p>GitHub: <a href="https:&#x2F;&#x2F;github.com&#x2F;eterdb&#x2F;eterdb" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;eterdb&#x2F;eterdb</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49645654)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T15:41:36Z

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
