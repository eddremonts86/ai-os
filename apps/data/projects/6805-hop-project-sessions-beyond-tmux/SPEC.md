# SPEC.md — Hop – project sessions beyond tmux

## Problem

hop started from a frustration: every project I work on accumulates browser tabs, while tmux sessions can only contain terminals. This really started getting out of hand once coding agents took hold, as more things are now going on at the same time.<p>On top of that, I&#x27;ve started doing more work in sandboxed environments, and tmux isn&#x27;t great at managing sessions across different environments - it wants a tmux server everywhere.<p>So hop moves the project session up to the window-manager level: terminals and GUI apps live together, while shells and the editor can run locally, in a container, or over SSH.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49684537)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T14:42:41Z

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
