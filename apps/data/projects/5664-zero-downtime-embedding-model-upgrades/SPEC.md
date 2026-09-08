# SPEC.md — Zero downtime embedding model upgrades

## Problem

People use embedding models all the time for rag&#x2F;semantic retrieval. However, when a newer, more desireable model comes out, there is an expensive (both in time and computational) cost of re-embedding every document in the database.<p>However, I figured out an interesting way to forgo that upfront embedding cost.<p>algo:<p>old model&#x2F;index -&gt; retrieve top-K docs -&gt; score those docs with the new model -&gt; cache&#x2F;materialize the new embeddings<p>so instead of rebuilding the entire vector store upfront, the old index keeps getting retrieved from, while the new model reranks those candidates.<p>This works surprisingly well for some model pairs, (i tested 63 source-&gt; target migrations on h100s, on upto 1M documents).<p>For example, on a 1M document Natural Questions dataset,<p>native Qwen3-Embedding-8B: 0.6812 nDCG@10
Qwen3-4B -&gt; Qwen3-8B, K=50: 0.6816
Qwen3-0.6B -&gt; Qwen3-8B, K=50: 0.6638
MiniLM -&gt; Qwen3-8B, K=50: 0.6486<p>(the hard part is determining k, I held the k constant above to give some sense of migratability).<p>You can install it with pip<p>pip install embedflow<p>and the code is on github<p><a href="https:&#x2F;&#x2F;github.com&#x2F;arnsri33&#x2F;embedflow" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;arnsri33&#x2F;embedflow</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49605110)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T02:35:36Z

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
