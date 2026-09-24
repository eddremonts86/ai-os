# SPEC.md — EmbedFlow –> Upgrade embedding models without re-embedding your corpus

## Problem

I was playing around with embedding models and I realized the moving between embedding models on a large corpus can cause a huge backfill, as all of the previous documents would have to be re embedded.<p>embedflow tries to forgo that; it takes candidate documents from the previous index, and reranks them in realtime with the new model. It supports faiss, qdrant, and pgvector<p>people who have migrated large production vector indexes, would this be helpful for you?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49636147)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T23:34:24Z

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
