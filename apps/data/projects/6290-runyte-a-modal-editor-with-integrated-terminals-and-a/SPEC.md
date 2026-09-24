# SPEC.md — Runyte – a modal editor with integrated terminals and a file manager

## Problem

Hi, I&#x27;m building Runyte, an open-source terminal workspace built around a modal
text editor, written in Rust.<p>The goal is to create a coherent workspace with minimal UI and maximum focus.
Files, terminal panes, and Git views share one interface, navigation, clipboard,
and theme. A fuzzy finder searches through files, buffers, and terminals. Runyte
supports a persistent mode (client-server) in which you can detach and return
later while terminal processes and LSP servers keep running, or you can switch
directly to another Git worktree.<p>There are also some features to minimize the friction when working with CLI
coding agents: markdown rendering, image pasting, editing agent prompts, searching
terminal sessions with the fuzzy finder or regex.<p>It&#x27;s pre-1.0, but fully usable. Works on Linux and MacOS. You can download a
binary or install it with cargo install runyte --locked. There&#x27;s an interactive
tutorial :tutorial.<p>I&#x27;d especially appreciate feedback on navigating between editing, terminals, and
worktrees, and where the interface interrupts your concentration.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49648804)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T19:09:22Z

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
