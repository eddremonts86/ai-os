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

## Phase 0: Scaffold

- [x] Create the project folder under `apps/`
- [x] Initialise the git repo
- [x] Copiar `edd-app-template` → `apps/3723-itsuki-open-source-memory-engine-for-ai-agents-api-and-/`
- [x] Write SPEC.md (this document)
- [x] Write DESIGN.md (tokens + visual direction)
- [x] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [x] Set up the development environment
- [x] Read itsuki.app to confirm the URL-only framing and check the published surface

## Phase 1: Core

- [ ] Lock the HTTP API contract (write / read / search / delete) and the storage choice
- [ ] Implement the memory core: persistence + embedding-based retrieval
- [ ] Implement the HTTP transport
- [ ] Implement the MCP server transport against the same memory core
- [ ] Write a smoke test that writes over HTTP and reads back over MCP (and vice versa)
- [ ] Document namespace / per-agent isolation rules so integrators do not leak memories across agents

## Phase 2: Deploy

- [ ] Create the public GitHub repo
- [ ] Publish a one-command local run (docker-compose or equivalent)
- [ ] Write the README with: HTTP setup, MCP setup, an example agent integration, and an explicit ops section (backups, upgrades, key rotation)
- [ ] Verify against at least one MCP-speaking client (Claude Desktop or Cursor)

---

_Generated automatically by Lúa on 2026-08-29_
