# SPEC.md — Are coding agents too cautious because they estimate work in human time?

## Problem

I&#x27;m asking this because I&#x27;ve noticed that a model will tell me something is “several days of work,” but then I let it run in auto mode and it finishes most of it in 20–30 minutes. The same happens if it says “this will take about an hour” but then it takes less than 10 minutes.<p>What really bothers me is that after the model decides a task is large it starts reducing scope, or splitting it, or avoiding parts of the implementation that may be critical or add a lot of value.<p>So my guess is that we&#x27;ve ended up with unnecessarily cautious agents. But I don&#x27;t want that, especially if I&#x27;m paying extra usage credits for it. I want it to be ambitious about what it can take on.<p>So my question is: should we consider “hours” and “days” the wrong units for an agent? Maybe it should estimate itself in some other way that reflects how much it can actually take on and deliver.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49543917)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-02T23:17:43Z

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
