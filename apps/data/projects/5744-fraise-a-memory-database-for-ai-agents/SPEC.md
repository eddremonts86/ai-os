# SPEC.md — Fraise: a memory database for AI agents

## Problem

Fraise is a memory database for AI agents — a single binary that stores facts as a temporal graph of facts, topics and entities, queried in a small language with
two verbs:<p>```
  remember &#x27;acme moved to annual billing&#x27; topic:billing entity:acme
  recall billing entity:acme since:30d top:5
```<p>Two verbs because the caller pays for every token it reads back. A recall is ranked and capped rather than exhaustive, with recent facts outranking older ones.<p>Unlike most memory layers that use existing databases (vector, graph) to index data, Fraise provides a lightweight, no infrastructure layer that is designed to be used directly by agents: hence the simple query language to manage memory.<p>Fraise has a hybrid (graph, text and vector) retrieval engine: text and vector are used to find seeds, which are starting points for the graph search. The Fraise graph is bipartite: facts linked to entities and &#x2F; or topics.<p>It ships an MCP server (that I actually use now with my Claude Code sessions). Which means that memory persists across sessions. 
You can use `claude mcp add fraise -- fraise mcp` to set it up. It also supports Codex (all instructions available in the docs).<p>I benchmarked it against mem0, Letta, Graphiti, EverOS and cognee on LoCoMo, with every system ingesting the same conversations using the same extraction model and the same embedding model, and answering the same questions. Retrieval recall at k=10: 0.893 against a best of 0.897, at 0.18s p50 (twice as fast as the next system) and about a third of the tokens of the highest scorer. Scalability-wise, writes are essentially linear, but reads grow linearly with vertex degree (e.g. a topic with 30K facts attached costs about 55× than one with 500).<p>This is 0.1.0 so plenty of work to do. As mentioned above, scalability with adversarial graph topologies, but also persistency: for now Fraise is in memory with no file storage. This is the first feature for 0.2.0.<p>If this is a topic that is of interest, I&#x27;d love to chat, or if you have any feedback feel free to reach out!<p>Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;FraiseHQ&#x2F;fraise" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;FraiseHQ&#x2F;fraise</a>
Docs: <a href="https:&#x2F;&#x2F;docs.getfraise.dev" rel="nofollow">https:&#x2F;&#x2F;docs.getfraise.dev</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49609014)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T11:49:20Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
