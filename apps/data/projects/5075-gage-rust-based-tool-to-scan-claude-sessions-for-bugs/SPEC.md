# SPEC.md — Gage – Rust based tool to scan Claude sessions for bugs, other issues

## Problem

Gage is an open source (Apache 2) CLI + TUI that scans Claude Code session
transcripts and files issues with evidence.<p>Yesterday it found a bug that I had approved. In the original session Claude
flagged the risk. I didn&#x27;t read carefully, said &quot;go ahead&quot;, and it broke a
feature. Nothing in the commit shows this. It&#x27;s obvious in the session.<p>Sessions contain the code and the reasoning behind it. That makes them a
better source for review than the diff alone.<p>Every issue must cite lines in the session record, so any claim traces to its
source. You can review, fix, or close issues as skipped. Gage integrates with
Claude Code to review and resolve issues from the transcript.<p>Cost: scans run under your Claude login. On a subscription they count against
your plan limits. On usage-based billing they cost about $0.50 to $1.00 per
session. Running it daily, I&#x27;m paying roughly $2 per issue resolved. Some are
minor. Some are not.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49566640)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T16:13:22Z

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
