# SPEC.md — MarkFlowy – A open source Markdown editor rebuilt for large documents

## Problem

I maintain MarkFlowy, a desktop Markdown editor for Windows, macOS, and Linux. I’ve spent the past two months rebuilding its editor core, mainly to improve performance with larger documents.<p>The changes are part of v0.100.0. In testing, a 2 MB Markdown document opened in about a second. I’d be interested to see how it performs with other people’s documents and hardware.<p>Opening speed was one part of the work. I also worked on editing long documents and copying and cutting large selections. Much of the overhead came from repeatedly processing the entire document or doing unnecessary work within a single operation. Finding and reducing that work took up a substantial part of the rewrite.<p>I want to thank the users who reported bugs, slow operations, and awkward interactions. Those reports helped me understand where to focus.<p>The rewrite changes some editing behavior, and there are still rough edges to work through. If you regularly work with long Markdown documents, I’d appreciate feedback on anything that still feels slow or gets in your way.<p>Project and downloads: <a href="https:&#x2F;&#x2F;github.com&#x2F;drl990114&#x2F;MarkFlowy" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;drl990114&#x2F;MarkFlowy</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49586334)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T13:25:07Z

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
