# SPEC.md — A Coding Agent from Scratch

## Problem

I saw a post about building a coding agent from &quot;first principles&quot; and that inspired me to create my own.  I used my own custom Rust-based ML DSL to implement this.<p>The blog post includes link to the repos (MIT Licensed), a video of the agent in action, sample code produced, and an Emacs org-mode literate programming document explaining the implementation and tests.  There are links to an interactive playground for the sw-MLPL language.<p>The git repo can be used to run this agent locally on a system with Ollama and a coding LLM.  Does not yet connect to cloud LLMs.<p>I hope this helps someone learn how a coding agent can be built.  Inspired by (but not ported from) OpenCode.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49729456)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T16:30:10Z

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
