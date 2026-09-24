# SPEC.md — Opair, a coding harness that eschews autonomy

## Problem

Obviously everyone is writing their own coding harness these days, so I&#x27;ll cut straight to the points of difference in mine:<p>* There&#x27;s no tool that grants shell access. Instead there&#x27;s a bunch of development-specific tools, scoped to restricted functionality.<p>* Reads and writes are gated by access control. Project files can be read without prompting, git-ignored files and dotfiles can&#x27;t.<p>* The shipped MCP integrations are restricted to read-only access. There are no tools for git add and commit.<p>* Perhaps the biggest difference is separate driver and navigator modes. In driver mode, Opair works like other harnesses but with less autonomy for the agent. In navigator mode, the agent has no access to writable tools at all and instead monitors the project for changes you make in your regular editor. The idea is to imitate the relationship with a human pair programmer.<p>Why on earth would anyone build this? Because I want less autonomy, not more. I don&#x27;t want to read a massive diff at the end of an implementation push, I want to be involved all the way through. Opair is my attempt to make the human&#x2F;agent relationship more like pair programming and less like code review.<p>I wrote more about this in a philosophy doc:<p><a href="https:&#x2F;&#x2F;www.opairdev.org&#x2F;philosophy" rel="nofollow">https:&#x2F;&#x2F;www.opairdev.org&#x2F;philosophy</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49625009)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T11:54:04Z

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
