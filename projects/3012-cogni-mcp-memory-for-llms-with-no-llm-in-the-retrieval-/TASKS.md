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

## Phase 0: Scaffold

- [ ] Create project folder `apps/3012-cogni-mcp-memory/`
- [ ] Initialize TypeScript repo with `@modelcontextprotocol/sdk` installed
- [ ] Wire design tokens from DESIGN.md into the planned static benchmark page
- [ ] Add the README's "no LLM on the read path" promise as the top heading
- [ ] Add a minimal `store` + `recall` round-trip via stdio that returns a fixed memory

## Phase 1: Core

- [ ] Implement the tokenizer (Unicode-aware, language-agnostic)
- [ ] Implement the BM25 index: token frequency map, document frequency map, length normalization
- [ ] Implement persistence: line-delimited JSON for the corpus, serialized BM25 stats file, atomic writes
- [ ] Implement `memory.store` with input validation and optional metadata (tags, source)
- [ ] Implement `memory.recall` with a query, optional tag filter, optional exact-match filter, top-K limit
- [ ] Implement `memory.forget` by id
- [ ] Implement `memory.list` with paging
- [ ] Add incremental index updates so a `store` call does not trigger a full rebuild
- [ ] Author the Claude Code reference config that loads the server and exercises all four tools on a sample session
- [ ] Write a benchmark script that runs recall over a public corpus at sizes 100, 1k, 10k, 100k and emits a JSON results file
- [ ] Build the static benchmark HTML page from the JSON results file
- [ ] Add the CI audit script that fails the build if a model import appears on the read path
- [ ] Add the MCP conformance test suite and run it on every push
- [ ] Verify the reference client works on a fresh install before declaring v1

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Publish the package to npm so other developers can `npm install` the server
- [ ] Wire CI: type-check + audit script + conformance tests + benchmark regression on every push
- [ ] Deploy the static benchmark page to a static host
- [ ] Pin the MCP spec version in the README and document the breaking-change matrix
