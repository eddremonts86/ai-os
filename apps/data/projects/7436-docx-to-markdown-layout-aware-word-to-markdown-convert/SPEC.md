# SPEC.md — Docx-to-Markdown – layout-aware Word to Markdown converter

## Problem

Hey HN, I’m the author of the <a href="https:&#x2F;&#x2F;github.com&#x2F;eigenpal&#x2F;docx-editor" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;eigenpal&#x2F;docx-editor</a>, it’s an SDK that implements Word-compatible layout engine in Typescript.<p>Today, we are releasing Word to markdown converter library. It’s open source and published under Apache 2.0 license. It uses our layout engine, so it can return accurate, per-page markdown blocks (with headers, footers, and image references). We also handle fonts (Google fonts as fallback) or let you pass your font files upfront for accurate content measurement.<p>To our surprise, Word to per-page Markdown conversion is not a solved problem even in 2026! We initially faced this friction when preprocessing Word documents for agentic workflows. For our use case, it was important to represent per-page content in markdown. Initially, we ended up using LibreOffice sidecar to convert to PDF and then using .pdf -&gt; .md library. This was not ideal given that LibreOffice sidecar that was sitting idle most of the time.<p>This issue is addressed with docx-to-markdown library. it can be used directly in your Typescript ingestion pipeline. Try with your docs at <a href="https:&#x2F;&#x2F;www.docx-editor.dev&#x2F;solutions&#x2F;word-to-markdown" rel="nofollow">https:&#x2F;&#x2F;www.docx-editor.dev&#x2F;solutions&#x2F;word-to-markdown</a>.<p>(if you catch any bugs please let us know in the comments &#x2F; or file gh issues)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49728477)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T15:24:31Z

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
