# SPEC.md — Crew — Let Claude/Codex/OpenCode agents talk to each other

## Problem

crew hooks into your favorite CLI agent and injects a brief context of every other running agent (status, goal, recap, last few transcript entries). It also gives agents an interface to message each other, landing messages in another agent&#x27;s context even mid-work.<p>Since starting to use crew I&#x27;ve discovered plenty of use cases: 
- shipping on a single checkout without worktrees
- cross-agent code review
- Fable supervisor overseeing GPT-5.6 execution
- having GLM-5.3 take over a Fable session killed by safety blocks<p>I&#x27;m sure you can come up with more, let me know!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49595212)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-07T07:44:32Z

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
