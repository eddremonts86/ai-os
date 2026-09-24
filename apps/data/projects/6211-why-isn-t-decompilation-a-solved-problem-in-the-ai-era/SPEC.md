# SPEC.md — Why isn't decompilation a solved problem in the AI era?

## Problem

There are thousands of pairs of source-executable pairs that could be used for training, and the compiler is a parameter that AI can easily identify and account for as a heavily weighted factor.<p>So why isn&#x27;t there (or maybe there is and I don&#x27;t know about it) an AI based decompiler that can take almost any machine code, and transform it into highly readable source code (complete with meaningful guesses for variable names and comments)? It seems like it should be even easier when the executable could be run and inspected at runtime by the AI model.<p>What is the state of the art with AI decompilation, and are there tools I can play with today?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49646640)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-10T16:42:33Z

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
