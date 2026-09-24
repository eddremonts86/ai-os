# SPEC.md — PredictionArchive - Database of Internet Predictions

## Problem

PredictionArchive is the public database of the world&#x27;s predictions.
PredictionArchive scrapes predictions from across the internet, stores
them in postgres, and then has AI grade them correct&#x2F;incorrect when
the time comes. I&#x27;ve backfilled predictions from several blogs popular
on HN: marginalrevoluion.com, slatestarcodex, paulgraham.com among
them.<p>Predictions are searchable by predictor and prediction text. Touring
the predictions via the &#x2F;random endpoint has been fun for me.<p>I&#x27;ve had the idea for years, and this has been a backburner project of
mine for a while, but I recently got some time to polish it up. Hope you enjoy.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49661236)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T16:35:01Z

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
