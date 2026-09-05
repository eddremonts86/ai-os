# SPEC.md — Coder Eval – A Framework for Evals

## Problem

We needed a framework to write our evals in and easily update them, run A&#x2F;B tests, set all kinds of constraints (ex: timeouts, number of turns), and configure the execution environment (ex: sandboxes, dependencies, how to handle AskQuestion). We also have an agent judge.<p>It’s all in a YAML file now.<p>We seem to be moving toward a world where companies rely more and more on evals to decide what to ship, so this should be super helpful for normalizing evals across teams.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49568876)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T19:09:52Z

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
