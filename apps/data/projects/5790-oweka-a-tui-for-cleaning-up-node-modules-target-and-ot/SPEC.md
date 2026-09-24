# SPEC.md — Oweka, a TUI for cleaning up node_modules, target, and other artifacts

## Problem

Hey HN folks!<p>I noticed that folders like node_modules, target, venv, etc., spread over dozens of old projects, were taking up almost 100GB on my machine! I know npkill exists, but I found it a bit slow and it doesn&#x27;t seem to handle anything other than node_modules yet.<p>As a result, I decided to make oweka; it&#x27;s written in Rust with the ratatui framework, and is cross-platform (to the best of my ability).

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49612018)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T15:45:15Z

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
