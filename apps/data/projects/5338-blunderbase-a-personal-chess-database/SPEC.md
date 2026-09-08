# SPEC.md — Blunderbase: A Personal Chess Database

## Problem

I made a free and open source chess database. It&#x27;s useful for personal game study and gathering statistics across sites. Supports import from lichess, chess.com, FICS and PGN then runs Stockfish and Maia over every game.<p>With it you can analyze your games, take notes on positions and look up openings. The self hosted web version includes a remote-runner that allows connecting engines running on other machines (finally, the CPUs of the AI server at work come to use :D) and an MCP server with a live board to push positions and comments to.<p>Roadmap: iOS and Android companion apps, a sync service, multi-engine analysis, and a correspondence game mode supporting multiple long running calculations.<p>Looking forward to feedback and critique.<p>Docker, Windows, Mac: <a href="https:&#x2F;&#x2F;blunderbase.org" rel="nofollow">https:&#x2F;&#x2F;blunderbase.org</a>
Demo: <a href="https:&#x2F;&#x2F;demo.blunderbase.org" rel="nofollow">https:&#x2F;&#x2F;demo.blunderbase.org</a> (read-only)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49584085)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T07:21:32Z

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
