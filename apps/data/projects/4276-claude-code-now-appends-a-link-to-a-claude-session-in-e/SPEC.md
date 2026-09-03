# SPEC.md — Claude Code now appends a link to a Claude session in every commit

## Problem

Claude code now appends every commit with this line, everyone is opted in automatically.<p>This link is only accessible to the user so it doesn&#x27;t make sense to be put in a commit.<p>Claude-Session: https:&#x2F;&#x2F;claude.ai&#x2F;code&#x2F;session_...<p>There is a new setting that allows you to disable it.<p><pre><code>  &quot;attribution&quot;: {
    &quot;sessionUrl&quot;: false
  }</code></pre>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49515667)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-08-31T22:32:37Z

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
