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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

**One-liner:** An MCP memory server that recalls what an agent has stored using BM25 + filters, with zero LLM calls on the read path — so recall is fast, cheap, and reproducible.

The product is a developer tool. An agent builder wires the server into their MCP-compatible client, stores memories with `memory.store`, and recalls them with `memory.recall`. The retrieval ranking is computed by a classical pipeline, so the same query against the same index always returns the same ordered list. That property is what makes the server useful as a baseline: a developer can debug agent memory by inspecting the deterministic recall path instead of chasing a non-reproducible model output.

## Target Users

| Stakeholder | Why they care |
|---|---|
| MCP-compatible agent developers | Want a memory layer without paying a second-model retrieval cost on every recall |
| Agent builders who need reproducible recall | Want deterministic behavior so debugging and regression tests are possible |
| Researchers studying agent memory | Want a baseline classical-retrieval server to compare against embedding-based or model-based layers |

## Jobs To Be Done

1. **Functional job** — Wire the server into an MCP-compatible client, store and recall memories across sessions, and have recall behave the same way every time.
2. **Emotional job** — Trust the recall output because the path that produced it is inspectable and reproducible, not opaque.
3. **Social job** — Be able to point at a baseline classical-retrieval memory server in a write-up without hand-rolling one.

## Success Metrics

- **Recall latency:** Median `memory.recall` returns in under 50 ms on a 10,000-memory index on commodity hardware.
- **Determinism:** Two consecutive calls to `memory.recall` with the same index and query return identical ranked lists (verified by a CI test).
- **MCP spec compliance:** The server passes the official MCP conformance test suite for the four memory tools.
- **Adoption in a reference client:** The shipped Claude Code example config works on a fresh install without manual fixes.
- **Honesty metric:** The README's "no LLM on the read path" claim is verified by an audit script that greps the read-path code for model calls.

## Pricing & Monetization

Free in v1. The server is a self-hosted developer tool. No hosted offering is assumed.

## Competitive Landscape

Source gives no competitive signal. Other memory layers for agents exist (Letta, mem0, Zep), but the source post itself does not name a comparable product, and naming one without warrant would be invention.

## Risks & Open Questions

- **BM25 ceiling.** Classical retrieval will not match a well-tuned embedding model on semantic recall for some queries. Mitigation: be explicit in the README that the server is a baseline, not a state-of-the-art recall engine.
- **MCP spec drift.** If the spec changes, the server must follow. Mitigation: pin a spec version in the README; ship a conformance test that runs on every release.
- **Index bloat.** A long-running agent's memory index grows. Mitigation: a simple `memory.forget` path and a documented compaction story.
- **The "no LLM on the read path" promise is easy to break.** Mitigation: the audit script in CI that fails the build if a model import appears on the read path.

---

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49339547) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
