# SPEC.md — ChessNotate – Fix a broken PGN without branching into a new variation

## Problem

Hi HN! I just built ChessNotate to turn my handwritten chess scoresheet into a clean PGN to solve my own pain points when it comes to capturing my games (and my son&#x27;s)<p>A lot of times my son and I make typos (accidentally mixing up B with b), or missing out moves through the middlegame and the frustrating part is when I try to validate it using PGN validator, if the PGN is invalid, it either rejects the PGN outright, or stops at the first error and everything else gets discarded. Then I have to fix the moves one by one. Worse, correcting a move usually gets treated as branching to a new variation<p>ChessNotate validates the moves but it doesn&#x27;t simply stop and discard past any errors. You can still see the rest of the moves which helps you to confirm if your fixes (including inserting or deleting moves) on the errors are correct. The lack of branching is on purpose because it&#x27;s not an analysis tool so it&#x27;s meant to do move correction<p>Initially the plan was to use OCR to capture handwritten notes with Apple VisionKit to avoid paying for a frontier model but it didn&#x27;t work out. It only detected tables on a really good photo and it couldn&#x27;t reliably parse fairly neat handwriting so I decided just to discard the OCR idea and focus on the core problem of making it easy to fix PGN instead<p>It&#x27;s on the App Store now as a paid app (small one-time fee) and there&#x27;s also a free web version available. The app is a UX upgrade over the web version with sound&#x2F;haptic feedback, eval bar and a dedicated notation keypad built for iPhone

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49582796)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T02:41:29Z

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
