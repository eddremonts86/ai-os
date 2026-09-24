# SPEC.md — InverSQL: Build SQL interactively in inverse

## Problem

Since both ML [1] and SQL can be used to select cells from a table, can I convert one to the other?<p>This allows creating SQL in a smart way (select cells -&gt; build SQL, hence the name inverse SQL).<p>Yes.<p>Create a decision tree (an ML predictor) from the cells selected
Formulate it as SAT
Simplify it
Convert to SQL.<p>Demo on streamlit.<p>Love to hear your thoughts and suggestions on this!<p>[1]: ML = machine learning, here I’m using decision trees

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49612826)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T16:44:14Z

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
