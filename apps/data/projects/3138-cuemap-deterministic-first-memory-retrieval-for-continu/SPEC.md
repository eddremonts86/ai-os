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

## Problem

Memory for AI agents — long-term recall of facts, decisions, and past interactions — usually leans on embeddings and vector search, which is fuzzy by design: similar-but-not-equal queries return similar-but-not-equal hits. CueMap's pitch is to invert the order: deterministic retrieval (exact match, structured filters, ID lookup) first, embeddings as a fallback for the long tail. The "deterministic first" stance is the answer to agents that lose or hallucinate facts because the memory layer silently picked the wrong similar item.

## Objective

Ship a memory store whose retrieval API prefers deterministic matches and only falls back to embedding similarity when the deterministic path returns nothing. Every retrieval returns a confidence tier (deterministic / structured / fuzzy) so the calling agent can decide what to trust.

## Target Users

- AI agent authors who want predictable memory behaviour and a clear explanation of why a fact was retrieved.
- Teams building long-running assistants that need to recall exact facts (dates, IDs, names) and not "things like this".
- Researchers comparing deterministic and fuzzy retrieval in a single tool.

## MVP Scope

- A memory store with a typed schema (key, value, tags, source, timestamp) backed by SQLite.
- A retrieval API: deterministic match by exact key, structured match by tag filters, and an embedding-similarity fallback when both return empty.
- A confidence tier returned with every hit (`deterministic`, `structured`, `fuzzy`) so the caller can choose policy.
- A write path that accepts a memory item plus its provenance (where it came from).
- A small CLI for listing, adding, and querying memories.
- Out of scope: a vector DB cluster, multi-tenant auth, an automatic ingestion agent.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Deterministic retrieval must always run first; the embedding path is never queried unless the deterministic path returns zero hits.
- Every retrieval result includes the confidence tier; a fuzzy hit is never silently returned as a deterministic one.
- The embedding model is swappable behind a small interface; the deterministic layer is independent of the model choice.
- Writes are append-only; updating a memory item produces a new record with a `supersedes` link, never an in-place edit.
