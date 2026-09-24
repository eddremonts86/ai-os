# SPEC.md — How do you get coding agents to clean up after changing direction?

## Problem

I&#x27;ve noticed the same failure mode across most coding agents.<p>When an implementation runs into a problem, such as a function not meeting the requirement, the agent often writes a replacement. If the overall approach changes, it starts a new path. If only a detail needs adjustment, it may add another helper or class.<p>What it rarely does is remove the code and data definitions added for the abandoned approach. After a few iterations, the result may work, but it contains stale branches, unused helpers, redundant logic, and fields that no longer serve a purpose.<p>I&#x27;ve started thinking this needs an explicit project-level rule for agents responsible for implementation and fixes:<p>```
After changing an implementation approach or fixing an issue, review the code logic and data definitions touched by the change. Keep only items that are still required. Remove unused functions, redundant logic, and data fields that are no longer needed.
```<p>A git-commit skill can be a useful trigger for this check, but the cleanup should remain part of the implementation process rather than the responsibility of a commit skill.<p>How are others handling this? do you add an explicit cleanup phase after each correction, enforce it during review, or rely on tooling to catch the leftovers?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49722980)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-16T06:59:33Z

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
