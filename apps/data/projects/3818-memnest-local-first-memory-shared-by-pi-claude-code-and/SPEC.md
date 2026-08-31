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

## Problem

The capture is a URL-only Show HN by blue-b pointing at github.com/Blue-B/memnest; the post text is just the link, and the title names the pitch: local-first memory shared by pi, Claude Code and Codex. The repository fills in the architecture: one Rust service exposing MCP and HTTP, local hybrid search (BM25 plus vectors, combined with RRF and MMR), transcript capture, and an encrypted vault. Storage is SQLite (memory.db) with an HNSW vector index on disk, and embeddings come from a model fetched on first encode through ONNX Runtime rather than at startup. The encryption story is fail-closed: an empty or unreadable master.key aborts startup, and a key that cannot decrypt stored values aborts with a vault validation failure. Bridges exist for the named agents — a pi-extension npm package with tools and autocontext for pi, a memnest hook for prompt-time recall used by Claude Code and Codex, plus a watch mode that captures agent transcripts and a generic HTTP adapter for other MCP clients. The project is MIT-licensed, at v0.1.0, with one contributor.

## Objective

Make agent memory a shared local resource: one self-hosted service that every coding agent on the machine reads and writes, so pi, Claude Code, Codex and others recall the same facts instead of each keeping private, drifting memories.

## Target Users

- Developers running multiple AI coding agents (pi, Claude Code, Codex) on one machine.
- Privacy-focused engineers who want agent memory local-first and encrypted, not in a vendor cloud.
- MCP-tooling tinkerers who want prompt-time recall and transcript capture for their own clients.

## MVP Scope

- One Rust service with MCP and HTTP surfaces.
- Hybrid search: BM25 plus vectors with RRF fusion and MMR diversity.
- Transcript capture (watch mode) and prompt-time recall hook.
- Encrypted vault with fail-closed key handling (master.key).
- pi-extension npm package plus the generic HTTP adapter.
- MIT-licensed v0.1.0 release with SQLite and on-disk vector index.

## Constraints

- Local-first: everything lives on the user's disk; there is no cloud component in the capture.
- Fail-closed encryption: startup aborts on missing or unreadable keys — availability is traded for security by design.
- The embedding model downloads on first encode, which needs network at that moment even though the product is local-first.
- The project key is the working-directory basename, so same-named project directories in different paths share one memory bucket — a stated behavior to plan around.

## Design Direction

See `DESIGN.md` for this project's design tokens.
