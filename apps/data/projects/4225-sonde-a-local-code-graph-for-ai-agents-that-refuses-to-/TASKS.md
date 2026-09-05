---
id: "4225"
slug: sonde-a-local-code-graph-for-ai-agents-that-refuses-to-
title: "Sonde, a local code graph for AI agents that refuses to guess"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507034"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Sonde, a local code graph for AI agents that refuses to guess

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4225-sonde-a-local-code-graph-for-ai-agents-that-refuses-to-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Bind tree-sitter parsers for TypeScript, Python, and Swift, and implement the per-language symbol extractor that names the symbol, the kind, the location, and the references.
- [ ] Build the symbol-level graph in SQLite: the schema, the per-file ingest, the cross-file reference builder, the graph query layer.
- [ ] Implement the `find_symbols` MCP tool: the query matcher (name, pattern, kind), the projection, and the packer that truncates to the caller's token budget by construction.
- [ ] Implement the `query_graph` MCP tool: the relation walker (calls, called-by, references, defined-in), the projection, and the packer.
- [ ] Implement the `get_impact_radius` MCP tool: the impact walker, the projection, and the packer.
- [ ] Wire the packer's truncation logic so every tool response is truncated to the budget by construction; the agent never receives a response that exceeds the budget.
- [ ] Implement the `sonde init` entry point: index the repository, register Sonde as an MCP server in the project's `.mcp.json`, refuse to write an `.mcp.json` it cannot safely merge into, support `--yes` to skip the prompt.
- [ ] Write the benchmark harness (`npm run bench:fixture && npm run bench:large`) and the `BENCHMARK.md` / `BENCHMARK-LARGE.md` write-up that documents the recall, tool calls, context tokens, latency, and budget-breach rate on the 19,409-line production TypeScript repository.
- [ ] Write the design doc §2.2 honesty clause naming the behavioural queries Sonde loses on and the design decision (local semantic retrieval was built and measured and does not fix it).
- [ ] Run an end-to-end test on the 19,409-line production TypeScript repository: index it via `sonde init`, register the MCP server, call `find_symbols`, `query_graph`, and `get_impact_radius` from a mock agent, confirm the packer truncates to the budget by construction, confirm the benchmark rerun reproduces the published numbers, and confirm a behavioural query scores 0.00 as the design doc names.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Publish `@cheppulabs/sonde` to npm under Apache-2.0 with the README that names the trade where Sonde loses
- [ ] Wire the GitHub Actions CI to run the benchmark on every commit and post the divergence from the published numbers as a CI failure when the bench breaks
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
