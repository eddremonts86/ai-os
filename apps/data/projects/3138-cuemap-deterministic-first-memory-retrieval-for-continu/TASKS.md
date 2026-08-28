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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3138-cuemap-deterministic-first-memory-retrieval-for-continu/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up SQLite with the `memories`, `tags`, and `supersedes` schema
- [ ] Confirm FastAPI runs locally and the embedding model loads from cache

## Phase 1: Core

- [ ] Write API: append-only with provenance
- [ ] Retrieval orchestrator with deterministic (exact key + tag filter) as the first path
- [ ] Structured path: BM25 over value and tags, with `structured` confidence
- [ ] Fuzzy path: embedding similarity with a swappable encoder, with `fuzzy` confidence
- [ ] `RetrievedHit` returning the confidence tier on every hit
- [ ] CLI for listing, adding, and querying
- [ ] Per-tier hit-rate metric exported for the README
- [ ] Compaction policy that preserves `supersedes` chains

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
