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

## Phase 0: Scaffold

- [x] Read the Show HN post and the linked repository README to map the service, bridges and vault
- [x] Write SPEC.md (this document)
- [x] Build the Rust service skeleton with MCP and HTTP endpoints
- [x] Initialize SQLite storage and the vault with a master key on a test machine

## Phase 1: Core

- [ ] Implement remember and recall over MCP with hybrid search (BM25 + vectors, RRF, MMR)
- [ ] Add watch-mode transcript capture with search
- [ ] Wire the pi-extension npm package (tools and autocontext)
- [ ] Verify fail-closed vault behavior: missing or unreadable keys abort startup

## Phase 2: Deploy

- [ ] Connect pi, Claude Code and Codex to the same store and verify shared recall
- [ ] Run the repository's retrieval fixtures, ablations and holdout benchmarks in CI
- [ ] Publish the v0.1.0 release with preflight scripts and documented archive semantics
