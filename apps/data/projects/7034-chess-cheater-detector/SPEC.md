# SPEC.md — Chess Cheater Detector

## Problem

I&#x27;ve been playing with this idea to build an estimation of chess cheating likelihood from an exported chess game (PGN format).<p>The main thing I&#x27;ve developed so far is a way of estimating the complexity of each position. The intuition is that matching an engine&#x27;s top moves in difficult positions is much more informative than doing so when there&#x27;s an obvious best move.<p>The detector currently combines complexity with engine agreement and centipawn loss to make a prediction. I&#x27;d like to move beyond the heuristics and train an ML model on a decent dataset of known cheating&#x2F;non-cheating games.<p>There is an obvious limitation though: I have fewer signals available than than Chess.com&#x2F;Lichess. I generally don&#x27;t have a player&#x27;s game history, and most PGNs don&#x27;t contain time-per-move data, both of which would presumably be very useful.<p>Still pretty experimental, so I&#x27;d be interested in feedback; especially from anyone who&#x27;s worked on chess engines, cheating detection, or related statistical problems.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49706032)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T00:14:36Z

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
