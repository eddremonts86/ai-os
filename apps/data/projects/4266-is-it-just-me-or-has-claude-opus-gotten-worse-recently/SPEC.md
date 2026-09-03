# SPEC.md — Is it just me, or has Claude Opus gotten worse recently?

## Problem

Since the recent updates, I have the feeling that Claude Opus is becoming dumber on complex tasks.<p>Things that used to work cleanly in a single prompt now fail completely. In coding workflows, it constantly ignores mandatory CLAUDE.md project rules, makes unsolicited edits to unrelated files, and breaks working code. It starts arguing based on stale comments, fails to update documentation when code changes, and edits based on blind guesswork instead of actually verifying the codebase first.<p>I even caught myself using Fable for tasks that I always used Opus for in the past, just to get decent results.<p>It feels like Anthropic is shifting their technical problems onto paying users. Either they are using strict safety filters that silently fall back to cheaper models without telling us, or they are downgrading the compute under heavy load to save money.<p>The result is the same kind of shrinkflation: we pay the same subscription price, but we either burn way more Opus tokens on endless retries, or we are forced to spend money on more expensive Fable tokens to get the quality we used to have.<p>Has anyone here successfully moved away from Claude for complex engineering workflows? What are you replacing it with, and how are you handling the transition?<p>Disclaimer: As a native German speaker, I used Gemini to clean up and polish the English text for this post.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49519639)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-01T08:58:16Z

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
