# SPEC.md — Beautiful Markdown rendering in your terminal

## Problem

Hey HN, I’ve been cobbling together a tool to read beautifully formatted markdown without leaving my terminal.<p>Lime renders markdown in the terminal with actual formatting - big headers, syntax highlighted code, mermaid diagrams, all drawn using Ghostty’s Kitty graphics protocol support.<p>It picks up your terminal’s native theme and you can jump between headings, pull up a table of contents to search and jump to sections of your document.<p>It’s macOS and Ghostty for now, the document lives in scroll back and we use Apple Events to ask Ghostty jump around the scroll back instead of re-rendering. This also lets you use Ghostty’s native search and shortcuts for navigation.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49655403)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T08:59:07Z

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
