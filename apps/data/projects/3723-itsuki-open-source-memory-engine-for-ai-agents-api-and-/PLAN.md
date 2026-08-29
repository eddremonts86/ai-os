---
id: "3723"
slug: itsuki-open-source-memory-engine-for-ai-agents-api-and-
title: Itsuki – open-source memory engine for AI agents (API and MCP)
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487838"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Node.js, PostgreSQL, vector search, MCP, HTTP API]
---
# Itsuki – open-source memory engine for AI agents (API and MCP)

## Tech Stack

- **Service runtime:** Node.js + TypeScript — chosen because both HTTP and MCP server stacks are first-class in the Node ecosystem and the project's public surface (itsuki.app) signals a JS/TS codebase.
- **HTTP transport:** a typed HTTP API (REST or RPC-style) exposing memory write / read / search / delete operations.
- **MCP transport:** an MCP server endpoint that speaks the same memory model as the HTTP API, so MCP clients (Claude Desktop, Cursor, custom agents) integrate without code changes.
- **Storage:** a persistent database for memories — the choice (PostgreSQL with `pgvector`, SQLite with an extension, or another store) is a repo-level decision and should be picked for the operator's deploy story.
- **Retrieval:** embedding-based search so an agent can ask for "what did we discuss about X?" and get relevant memories back.
- **Auth:** API keys (or per-agent tokens) supplied by the operator; no third-party identity provider.

## Architecture

```
┌────────────┐    ┌────────────┐    ┌────────────┐    ┌────────────┐
│ HTTP       │───▶│ Memory     │───▶│ Storage +  │    │ Embedding  │
│ API        │    │ core       │    │ vector     │◀──▶│ provider   │
└────────────┘    │ (shared)   │    │ index      │    │ (API key)  │
┌────────────┐    │            │    └────────────┘    └────────────┘
│ MCP        │───▶│            │
│ server     │    │            │
└────────────┘    └────────────┘
```

Both transports fan into one memory core so writes over HTTP are readable over MCP and vice versa. The embedding provider is pluggable; the storage layer is whatever the operator chooses at deploy time.

## Milestones

1. **M0 — Transport & storage agreement.** Lock the HTTP API contract, the MCP server surface, and the storage choice (DB + embedding provider). These are repo-level decisions, not product features.
2. **M1 — Working core + HTTP API.** Write / read / search / delete over HTTP, with embedding-based search wired up against a chosen store.
3. **M2 — MCP server.** Same operations over MCP, with a smoke test against at least one MCP-speaking client.
4. **M3 — Docs & deploy.** A README that documents HTTP + MCP setup, an example agent integration, and a one-command local run.

## Risks

- **MCP spec drift.** MCP is still evolving; the server must track spec changes so existing integrations do not silently break.
- **Embedding lock-in.** Picking one hosted embedder makes the service easier to demo but ties retrieval quality to that vendor's pricing and uptime.
- **Cross-agent privacy.** Without per-agent or per-user namespaces, two agents pointed at the same instance will read each other's memories. The MVP must address this honestly.
- **"Memory" is overloaded.** Raw transcripts, summaries, structured facts, and embeddings all qualify; the MVP must publish its data model so integrators do not assume a richer schema than the service offers.
- **Operator ops burden.** A self-hosted memory service still needs backups, upgrades, and key rotation; the README must call this out, not paper over it.
