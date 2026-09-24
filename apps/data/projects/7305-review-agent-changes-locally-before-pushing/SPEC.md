# SPEC.md — Review agent changes locally before pushing

## Problem

I&#x27;ve often found that agents do stupid things when implementing requests. When I only see their changes  with  limited context in a scroll-by approval blob, it&#x27;s easy to miss some of that stupidity.  In those cases, I&#x27;ll often only see it when I can review the full change in context in a PR.<p>This tool adds a local review step, giving the human a final opportunity to be in the loop: your agent commits the changes, pushes to a local &#x27;review&#x27; remote, and waits for feedback. The push itself opens a review via post-receive hook, and provides you with a localhost URL to review the changes.<p>If you request changes via inline comments (like you would for a PR), the agent sees the comments and makes adjustments.  It pushes again and the process repeats until you&#x27;re satisfied.<p>When you approve the change, your agent can take whatever step is next in your normal workflow - push to open an actual PR, merge locally, etc. These are lightweight instructions (~500 tokens) that should be customized for your workflow.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49721156)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T01:39:55Z

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
