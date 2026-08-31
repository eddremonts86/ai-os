---
id: "3818"
slug: memnest-local-first-memory-shared-by-pi-claude-code-and
title: "Memnest, local-first memory shared by pi, Claude Code and Codex"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495320"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Rust service, MCP server, hybrid BM25 + vector search, SQLite storage, ONNX embedding model, encrypted vault]
---
# Memnest, local-first memory shared by pi, Claude Code and Codex

## Tech Stack

Stated by the linked repository.

- **Rust service:** the single engine in core/, exposing HTTP and MCP.
- **SQLite:** memory.db for facts, metadata and the index queue.
- **HNSW vector index:** on-disk vectors for embedding search.
- **ONNX Runtime:** runs the embedding model, fetched on first encode.
- **BM25 + RRF + MMR:** keyword search fused with vector results and diversity-ranked.
- **npm pi-extension:** the pi-facing tools and autocontext bridge.

## Architecture

- **Server core:** HTTP and MCP endpoints for remember, recall and watch operations.
- **Search engine:** BM25 keyword scoring and vector similarity fused via RRF, then MMR-diversified.
- **Vault:** encrypted value storage gated by master.key, fail-closed on startup.
- **Bridges:** pi-extension for pi, the memnest hook for prompt-time recall (Claude Code, Codex), watch for transcript capture, and a generic HTTP adapter for other clients.
- **Storage:** memory.db plus text and vector indexes on disk.

## Milestones

1. **M0 — Single-client loop.** The service remembers and recalls over MCP on one machine with the vault keyed.
2. **M1 — Hybrid recall.** BM25 and vector fusion with RRF and MMR passes the repo's retrieval fixtures and ablations.
3. **M2 — Multi-agent.** pi, Claude Code and Codex each recall the same memory via their bridges, with watch transcripts searchable.
4. **M3 — Hardening.** Fail-closed key behavior, archive semantics and the generic HTTP adapter documented and release-gated at v0.1.0.

## Risks

- **Key scoping:** cwd-basename project keys make unrelated directories collide in one bucket.
- **Plaintext archive:** deleted memories persist in plaintext in the archive unless explicitly disabled.
- **First-encode network:** offline machines hit a wall when the embedding model has not been fetched yet.
- **Solo project:** one maintainer against three fast-moving agent CLIs (pi, Claude Code, Codex) whose interfaces drift.
