# SPEC.md — A chess analyzer that runs in the browser

## Problem

I play chess casually and usually struggle to figure out why Lichess analysis say my move is a blunder. Almost all the analysis tools will just suggest the best variant for a position, and you will have to follow the suggested engine lines, or play them out manually to analyze it better.<p>So I built this tool to make that process easier for beginner players. Behind the scene: This app run Stockfish in your browser, at a position, the app will follow the engine&#x27;s suggested lines, search for any meaningful situation like a check, a fork, a capture, material change, positional disadvantages,... and point that out with an explanation.<p>You can see the app here: <a href="https:&#x2F;&#x2F;whyblunder.vercel.app" rel="nofollow">https:&#x2F;&#x2F;whyblunder.vercel.app</a> and paste the PGN of your game.<p>If you play on Lichess, you can also replace the lichess.org part in the browser URl with https:&#x2F;&#x2F;whyblunder.vercel.app&#x2F;#&lt;game-id&gt; to quickly analyze, for example: <a href="https:&#x2F;&#x2F;whyblunder.vercel.app&#x2F;#cBVQFX8l" rel="nofollow">https:&#x2F;&#x2F;whyblunder.vercel.app&#x2F;#cBVQFX8l</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49720669)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T00:28:30Z

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
