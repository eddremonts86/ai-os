# SPEC.md — Chess960v2.com – 960×960 asymmetric chess, 600/960 rounds done

## Problem

Hi HN,<p>I just hit a major milestone on my side project.<p>I work a demanding day job, so I built a platform where Stockfish plays continuous self-play (2s&#x2F;move to keep server load manageable) to analyze asymmetrical chess variants.<p>In Chess960v2, White and Black independently choose any of the 960 valid setups, resulting in 921,600 possible starting combinations. I&#x27;m running a massive round-robin tournament (960 rounds total, where each setup plays against every other setup), and 600 out of 960 rounds have been completed.<p>The goal is to mathematically find which combinations are genuinely balanced (50&#x2F;50) and which give an unfair engine bias to one side due to asymmetry.<p>I&#x27;m pretty exhausted today, so I might be slow to reply, but I&#x27;d love for you to check out the site, look at the current data, and share your thoughts.<p>Thanks!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49674368)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-12T16:52:50Z

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
