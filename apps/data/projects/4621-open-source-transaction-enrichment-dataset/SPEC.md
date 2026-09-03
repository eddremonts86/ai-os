# SPEC.md — Open-source transaction enrichment dataset

## Problem

Many FinTech products display a nice merchant icon and human-readable name for transactions, instead of the plain text SQ *BRICKFIELDS CHIPP that appears on your bank statement. This relies on transaction enrichment, or some way to map these strings to their corresponding merchant details.<p>I&#x27;ve created a lightweight CSV file of many different merchants from around the world, corresponding transaction texts, and simple regular expressions to match those merchants. It&#x27;s tiny, but hopefully can be expanded to get better coverage.<p>The quality of enrichment improves the more accurate data we feed in, so this repository is an attempt to curate a set of human-reviewed, accurate data of merchant and transaction mappings. Pull requests welcome!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49535471)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T12:49:13Z

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
