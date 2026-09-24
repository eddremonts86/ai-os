# SPEC.md — Biloba: fast and stable Chrome-based browser tests in Go and Vitest

## Problem

I wrote Ginkgo and Gomega over a decade ago.  Biloba&#x27;s the browser-testing library I&#x27;ve always wanted.  It&#x27;s 2-3x faster than playwright and allows you to write expressive parallelizable browser tests and automations in Ginkgo and Gomega (for Go) and Vitest (for TypeScript).<p>Pragmatic atomic Javascript operations (b.Click(&quot;#foo&quot;) =&gt; foo.click()) give you speed and stability by trading off realism.  Opting back into realism (scroll then emit pointer click event) where you need it is as easy as b.Realistic().Click(&quot;#foo&quot;).<p>And it&#x27;s designed from the ground-up to be agent-friendly.  Failure messages include DOM outlines, paths to saved screenshots, and polling traces so agents can pinpoint failures quickly.  Visual regression tests produce diff images and textual descriptions that point agents at what changed. A set of Claude Code skills describes best practices for finding and eliminating flakes, and keeping them gone.<p>Performance numbers: <a href="https:&#x2F;&#x2F;github.com&#x2F;onsi&#x2F;biloba?tab=readme-ov-file#performance" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;onsi&#x2F;biloba?tab=readme-ov-file#performanc...</a>
Docs: <a href="https:&#x2F;&#x2F;github.com&#x2F;onsi&#x2F;biloba?tab=readme-ov-file#performance" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;onsi&#x2F;biloba?tab=readme-ov-file#performanc...</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49699819)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T16:41:52Z

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
