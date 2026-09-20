# SPEC.md — Claude Code injects a system reminder to replace attribution guidance

## Problem

Here&#x27;s the block which is injected:<p>Attribution for git commits and pull requests you create from here on (this replaces any earlier attribution guidance):
 - End git commit messages with:
   Co-Authored-By: Claude Opus 5 &lt;noreply@anthropic.com&gt;
   Claude-Session: https:&#x2F;&#x2F;claude.ai&#x2F;code&#x2F;session_**************
 - End pull request descriptions with:  Generated with [Claude Code]…<p>This can be overriden by adding or modifying your .claude&#x2F;settings.json:<p>&quot;attribution&quot;: {
  &quot;commit&quot;: &quot;&quot;,
  &quot;sessionUrl&quot;: false
}

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49598498)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-07T13:54:34Z

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
