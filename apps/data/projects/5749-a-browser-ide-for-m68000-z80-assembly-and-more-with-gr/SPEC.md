# SPEC.md — A browser IDE for m68000, Z80 assembly (and more), with graphics

## Problem

Asm Editor is an open-source browser IDE for writing, running, and debugging assembly.<p>It currently supports M68K, Z80, MIPS, RISC-V (32- and 64-bit), and x86-64. The debugger includes breakpoints, backward stepping, execution history, register and memory inspection, and other tools intended to make assembly easier to understand.<p>I recently added graphics, keyboard, and mouse support, so it’s now possible to build small games and other interactive programs.<p>The project is aimed primarily at university students learning assembly. The M68K emulator takes inspiration from Easy68K, while the MIPS emulator uses the same emulator as MARS. Both are commonly used in computer science courses.<p>I’m also working on interactive courses for those architectures, allowing students to learn and experiment directly in the app.<p>The app also has architecture documentation, shareable files, project templates, and tools for professors to create exams.<p>You can create a project from one of the templates to quickly try it out. I’d love to hear your feedback, particularly from people who teach or have learned assembly.<p>Demo: <a href="https:&#x2F;&#x2F;asm-editor.specy.app&#x2F;projects&#x2F;create" rel="nofollow">https:&#x2F;&#x2F;asm-editor.specy.app&#x2F;projects&#x2F;create</a> (pick the language and template you prefer)<p>Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;Specy&#x2F;asm-editor" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;Specy&#x2F;asm-editor</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49608665)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T11:08:53Z

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
