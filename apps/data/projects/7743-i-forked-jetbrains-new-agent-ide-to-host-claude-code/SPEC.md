# SPEC.md — I forked JetBrains' new agent IDE to host Claude Code

## Problem

ThinkRail is JetBrains&#x27; open-source IDE shell for AI coding agents: worktree-per-tab, chat + file tree + terminal, but hardwired to one agent (Pi).<p>My fork adds a plugin API so it can host others too, starting with Claude Code running in the same UI.<p>What&#x27;s new over upstream:<p>- A prototype of real plugin system
- Claude Code as a first-class citizen — config, IDE bridge, and terminal status all wired in as a builtin plugin, so you get Claude Code sessions in the same worktree-scoped UI as `pi`.
- Seven other builtin plugins split out the same way: blueprint (interactive specs), PDF preview, branch graph, a live drawing&#x2F;visualize surface, and file-type icons<p>Nightly builds via a Homebrew tap are provided.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49741832)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T15:00:32Z

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
