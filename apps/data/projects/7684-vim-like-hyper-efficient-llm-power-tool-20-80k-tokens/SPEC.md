# SPEC.md — Vim-like, hyper-efficient, LLM power tool - 20-80k tokens not 350k+

## Problem

I built a focused TUI tool for efficient parallelized tasks, early independent testers expressed 90%+ API savings and more direct results.  This is accomplished by user smaller context windows, hybrid client-side compaction, tool compaction, and system nudges (to avoid polluting the base prompts).<p>My Shell features:<p>- Vim-inspired keybindings, your keys never have to leave the keyboard (some mouse control supported as well)<p>- Custom Markdown, LaTeX, and Mermaid rendering support<p>- On-demand subagents with LLM-directed context handoff<p>- Thread pooling, client-side compaction, tool compaction<p>- Supports Powershell without a degraded experience; also support VGA&#x2F;VESA mode, run even when GPU drivers break!<p>- Single bundle, no external packages required<p>It’s opinionated, terminal-first, Vim-inspired; if that’s not for you, I have a web chat and a desktop app <i>coming soon</i>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49746030)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T20:26:06Z

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
