---
id: "3138"
slug: cuemap-deterministic-first-memory-retrieval-for-continu
title: CueMap – deterministic-first memory retrieval for continuous recall
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449043"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, AI, Memory, RAG, Developer-Tools]
tech: [Python, SQLite, BM25, FastAPI, sentence-transformers]
---
# CueMap – deterministic-first memory retrieval for continuous recall

## Tech Stack

- Python because the audience (agent authors, researchers) and the embedding ecosystem are Python-first.
- SQLite as the only datastore — memory items are small structured rows and a single SQL query is the deterministic path.
- A small BM25 layer over the `value` text for the structured path; it sits between exact match and embedding similarity.
- `sentence-transformers` (or any swappable encoder) for the embedding fallback, behind a thin interface so the model can change without touching the retrieval API.
- FastAPI to expose the retrieval and write endpoints to agent runtimes.

## Architecture

- A `MemoryStore` wraps SQLite and exposes `add(item)`, `get(key)`, `query(criteria)`, and `search(text)`.
- The retrieval orchestrator runs the deterministic path first (exact `key` lookup), then the structured path (BM25 over tag and value filters), then the fuzzy path (embedding similarity); each step is short-circuited if it returns a hit above a per-tier threshold.
- A `RetrievedHit` carries the confidence tier, the source record, and the path that produced it.
- A write service handles append-only semantics: every update creates a new row that points at the prior row with `supersedes`, so the chain is reconstructable.
- A CLI consumes the FastAPI service for human inspection and small-scale testing.

## Milestones

1. SQLite schema: `memories`, `tags`, and the `supersedes` chain.
2. Write API: append-only with provenance.
3. Retrieval API: deterministic path (exact key + tag filter), with `deterministic` confidence.
4. Structured path: BM25 over the value and tag fields, with `structured` confidence.
5. Fuzzy path: embedding similarity with a swappable encoder, with `fuzzy` confidence.
6. CLI for listing, adding, and querying, plus a per-tier hit-rate metric in the README.

## Risks

- The deterministic path's quality is bounded by the schema discipline of the caller; a sloppy schema makes "deterministic first" a label, not a behaviour.
- BM25 on short values is brittle; a fallback to fuzzy on small-value items may be necessary, and the threshold for that fallback is a tuning question.
- The embedding model choice changes fuzzy behaviour; a benchmark with a few candidate models is needed before locking the default.
- Append-only writes need a compaction story; without it, the store grows linearly with every fact update.
