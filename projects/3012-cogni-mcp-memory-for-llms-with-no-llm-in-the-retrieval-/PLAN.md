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

## Tech Stack

- **Server:** Node.js with TypeScript. Matches the MCP reference SDK and keeps the read path inspectable.
- **MCP transport:** `@modelcontextprotocol/sdk` over stdio for local use, with an HTTP transport for remote deployments as a stretch.
- **Retrieval:** `bm25-ts` (or hand-rolled BM25 if licensing is unclear) for ranking, plus exact-match and tag filters. No embedding model, no vector database on the read path.
- **Index persistence:** A small on-disk format (line-delimited JSON for the corpus, plus a serialized BM25 stats file). No Postgres, no SQLite for the read path; SQLite is acceptable for metadata.
- **Reference client:** A documented Claude Code config that exercises the four tools end-to-end.
- **Benchmark page:** Static HTML generated from a JSON results file by a small build script.

## Architecture

The MCP server exposes four tools. `store` accepts a memory payload, tokenizes it, and appends it to the index. `recall` accepts a query plus optional filters, runs BM25 ranking, and returns the top-K ranked memories. `forget` removes a memory by id. `list` returns the memory corpus in id order.

```
MCP client (e.g. Claude Code)
   |  memory.store / recall / forget / list
   v
MCP server (Node, stdio)
   |
   |--- tokenize + BM25 ranking  (no model calls)
   |
   v
On-disk index (line-delimited JSON + BM25 stats)
```

No vector DB, no embedding API call, no second model. The read path is one synchronous BM25 lookup.

## Milestones

1. **M0 — Scaffold:** TypeScript repo, MCP SDK wired in, a single end-to-end `store` + `recall` round-trip via stdio.
2. **M1 — Retrieval pipeline:** Tokenizer, BM25 index, deterministic ranking, persistence to disk.
3. **M2 — The four tools:** `store`, `recall`, `forget`, `list` over the MCP JSON-RPC interface with input validation.
4. **M3 — Reference client:** A Claude Code config that loads the server and exercises the four tools on a sample session.
5. **M4 — Benchmark page:** Run the recall pipeline against a public corpus at multiple sizes, emit a static HTML results page.
6. **M5 — Audit and conformance:** Audit script that fails the build if a model import appears on the read path; MCP conformance tests pass.

## Risks

- **MCP spec drift.** Mitigation: pin a spec version, run conformance tests on every release.
- **Index rebuild cost.** Adding many memories at once triggers a full re-tokenization. Mitigation: incremental index updates with a flush threshold.
- **Reference client rot.** A Claude Code config can break with a client update. Mitigation: pin the client version in the example; document the breaking-change matrix.
- **The "no LLM on the read path" promise is fragile.** Mitigation: the CI audit script is non-negotiable.
