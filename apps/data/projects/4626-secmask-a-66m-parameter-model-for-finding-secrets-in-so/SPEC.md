# SPEC.md — SecMask – a 66M parameter model for finding secrets in source code

## Problem

I started this project just to learn how to train and fine-tune models. I published my first version distilbert-secret-masker which currently averages 228 downloads per month. Some security company used it in a advertisement benchmark for their product, which it got the lowest score, but they called it one of the &quot;five leading open-source scanners&quot;. So through spite I updated the model and should now be considered the #1 open-source secret detector ;) (according to my benchmarks)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49535146)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T12:18:19Z

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
