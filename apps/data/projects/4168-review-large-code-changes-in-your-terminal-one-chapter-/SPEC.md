# SPEC.md — Review large code changes in your terminal, one chapter at a time

## Problem

I&#x27;ve been hunting for ways to better review &amp; provide feedback on agent output without facing walls of files or leaving my multiplexer!<p>I&#x27;ve really enjoyed using both hunk and stage-cli and was inspired to combine and extend ideas from both<p>Revue is a terminal-based code review tool that breaks down large code changes into ordered, narrated chunks. You can think it as like a guided tour of a code change - as opposed to a big ol&#x27; list of files<p>Using a skill, you can have any agent generate a guided tour that you can then open using a TUI - stepping through organized chapters whilst leaving comments that can be sent back to the agent<p>You can also just run `revue diff` to get the same UI without the narration.<p>All feedback welcome!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49511126)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-08-31T15:44:08Z

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
