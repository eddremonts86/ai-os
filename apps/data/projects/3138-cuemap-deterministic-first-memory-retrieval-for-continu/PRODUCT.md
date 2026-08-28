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

## Value Proposition

A memory store whose retrieval prefers exact, deterministic matches and only falls back to embedding similarity when the deterministic path returns nothing. Every hit carries a confidence tier so the calling agent knows whether to trust it.

## Target Users

- AI agent authors who want predictable memory behaviour and a clear explanation of why a fact was retrieved.
- Teams building long-running assistants that need to recall exact facts (dates, IDs, names) and not "things like this".
- Researchers comparing deterministic and fuzzy retrieval in a single tool.

## Jobs To Be Done

- When my agent needs to recall an exact fact, I want a deterministic lookup to win over a "looks similar" embedding match so I do not get the wrong fact with high confidence.
- When my agent's memory is empty, I want a clear signal about that so I can decide to fall back to fuzzy retrieval or to ask the user.
- When I tune the memory layer, I want a confidence tier on every retrieval so I can measure how often each path fires.

## Success Metrics

- Share of retrievals served by the deterministic path vs. the structured path vs. the fuzzy path (target: the deterministic share grows over time as the schema fills).
- Number of `supersedes` chains per memory key, as a signal of how often facts update.
- Number of distinct agents and CLIs using the store, as adoption signal.

## Competitive Landscape

Agent memory stores (MemGPT, Zep) exist, but the source does not name any direct competitor that commits to deterministic-first retrieval for continuous recall.

## Risks & Open Questions

- The "deterministic first" stance depends on a well-typed schema; if the caller dumps free-form text into the `value` field, deterministic retrieval degrades into string matching.
- Embedding-similarity fallback can silently mask schema gaps; a "no fuzzy hits" alarm is needed if the deterministic share drops unexpectedly.
- Append-only writes can grow the store quickly; a compaction policy that preserves `supersedes` chains is necessary at some point.
- Whether the confidence tier becomes a hard policy (refuse fuzzy hits in certain contexts) or stays an advisory signal is a product call for later.
