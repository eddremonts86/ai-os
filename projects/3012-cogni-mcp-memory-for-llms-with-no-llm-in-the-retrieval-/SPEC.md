---
id: "3012"
slug: cogni-mcp-memory-for-llms-with-no-llm-in-the-retrieval-
title: "Cogni: MCP memory for LLMs, with no LLM in the retrieval path"
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49339547"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
---
# Cogni: MCP memory for LLMs, with no LLM in the retrieval path

## Problem

The captured post is a Show HN submission pointing only at `https://getcogni.io/`. The title describes an MCP (Model Context Protocol) memory server that lets an LLM agent store and recall memories, but with a non-LLM retrieval path — meaning memory lookup does not depend on a second model call. The post contains no narrative about a problem the author personally hit, no benchmark, no user count, and no architecture detail. The product idea is concrete though: an MCP-compatible memory layer whose retrieval is a deterministic classical search rather than another model invocation, which matters for latency, cost, and reproducibility.

## Objective

Build a reference / companion MCP memory server whose retrieval path uses a classical information-retrieval pipeline (tokenization, BM25 or a small embedding-free index, exact-match filters) and exposes the standard MCP memory tools (`store`, `recall`, `forget`, `list`) over a stdio or HTTP transport. The MVP focuses on the property the source title names — no LLM in the retrieval path — and ships a small demo MCP client (a Claude Code session) that exercises the memory tools end-to-end. It is a developer tool, not an end-user product.

## Target Users

- A developer who saw the Show HN post and wants to wire a memory layer into their MCP-compatible agent without paying a second-model retrieval cost.
- An agent builder who wants a memory backend whose recall behavior is reproducible (no temperature, no hidden prompt) and easy to inspect.
- A researcher studying agent memory who needs a baseline "classical retrieval" memory server to compare against embedding-based or model-based memory layers.

## MVP Scope

- An MCP server implementing `memory.store`, `memory.recall`, `memory.forget`, and `memory.list` with a JSON-RPC or stdio transport that matches the MCP spec.
- A deterministic retrieval pipeline: tokenization, BM25 ranking, exact-match and tag filters, no LLM calls anywhere on the read path.
- A small on-disk index persisted between sessions, with a clear migration story.
- A reference MCP client (a Claude Code config example) that demonstrates the four tools working end-to-end on a sample session.
- A benchmark page (static HTML) showing recall latency and recall precision at various corpus sizes, run against a public corpus.
- A README that explicitly documents that the retrieval path is LLM-free and why that matters for cost and reproducibility.

## Design Direction

Design direction for the MVP at `https://getcogni.io/` follows the constraints in `3012-.../SPEC.md`. The visual language is developer-tool: dense, monospace, command-line-friendly.

**Color** — terminal-style neutral background, one accent reserved for the recall hit, one muted accent for tool boundaries.

**Type** — one mono family for code and tool output, one text family for the README and benchmark page.

**Density** — high. The benchmark table is meant to be read like a research result, not a marketing card.

**Motion** — none.

## Constraints

- No LLM call on the retrieval path. If a feature would require one, it goes on the write path (e.g., for summarization at store time) or it is deferred.
- The MVP does not ship a hosted service. It is a self-hosted MCP server that a developer runs locally or on their own infra.
- The retrieval pipeline is deterministic; given the same index and the same query, it always returns the same ranked list.
- The MVP does not implement every MCP tool — only the memory-related surface — and it does not pretend to be a general agent framework.
