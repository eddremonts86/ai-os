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

## Value Proposition

One memory for every agent you run. Memnest is a single Rust service on your machine that pi, Claude Code, Codex and any MCP client share: agents write facts over MCP or HTTP, recall them at prompt time through the hook, and have their conversations captured as searchable transcripts by watch mode. Retrieval is hybrid — BM25 keywords plus embeddings fused with RRF and diversified with MMR — and everything sits in SQLite plus an on-disk HNSW index. The vault is encrypted and deliberately fail-closed: a missing or unreadable master key stops startup instead of silently degrading to plaintext. Local-first means the memory never leaves the machine, which is the privacy answer for engineers who will not let vendor clouds hold their agents' context.

**One-liner:** One local-first, encrypted memory service shared by pi, Claude Code, Codex and any MCP client.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Multi-agent developers | One source of truth instead of per-agent, drifting memory stores. |
| Privacy-focused engineers | Local-first storage with an encrypted, fail-closed vault. |
| pi users | A first-party extension with tools and autocontext. |
| MCP client builders | A generic HTTP adapter to join the shared memory. |

The post describes a developer tool; the market is the AI coding-agent community.

## Jobs To Be Done

1. **Functional job** — Let each agent read and write memories over MCP or HTTP.
2. **Functional job** — Recall relevant memories at prompt time via the hook, ranked by hybrid search.
3. **Functional job** — Capture agent conversations as searchable transcripts (watch mode).
4. **Emotional job** — Trust that memory is private, encrypted and yours — not a vendor's retention table.

## Success Metrics

- **Agent coverage:** pi, Claude Code and Codex all connected and recalling in one setup (the title's claim).
- **Recall quality:** retrieval benchmarks — the repo itself ships fixtures, ablations and per-model holdout results.
- **Transcript recall:** searches over watch-captured transcripts return the expected conversation.
- **Vault integrity:** fail-closed behavior verified — startup aborts on missing or unreadable keys, never falls back to plaintext.
- **Install success:** fresh installs complete from the documented preflight and release archives.

## Pricing & Monetization

None stated. The project is MIT-licensed, self-hosted and open source; the capture names no paid tier.

## Competitive Landscape

The post does not name competitors. The category is memory systems for AI coding agents — from per-agent vendor memory to local context tools; Memnest's stated position is the local-first, cross-agent niche within it: one self-hosted service shared by pi, Claude Code and Codex, where the competing default is each agent keeping its own memory store in its own cloud.

## Risks & Open Questions

- [ ] Local-first still needs network at first encode (the embedding model downloads on demand), a wrinkle in the offline story.
- [ ] Project keys derive from the cwd basename, so same-named directories in different paths silently share one memory bucket.
- [ ] Hard-deleted memories are appended in plaintext to an archive unless disabled — a documented but surprising behavior.
- [ ] One contributor and a v0.1.0 release: maintenance and compatibility across agent updates are unproven.
- [ ] Embedding quality drives recall; the repo's own holdout results are the only stated evidence.
