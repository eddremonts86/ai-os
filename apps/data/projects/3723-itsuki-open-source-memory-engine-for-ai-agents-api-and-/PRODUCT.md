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

> Product brief for the open-source agent-memory service linked from the Show HN post.

## Value Proposition

A builder running one or more AI agents can point those agents at a single open-source memory service — over HTTP or MCP — and get cross-session recall, user-preference persistence, and prior-task retrieval without rewriting the same memory plumbing inside every agent.

**One-liner:** One open-source memory backend for any AI agent, reachable over HTTP or MCP.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Agent builders | Maintain several agents across frameworks; want one shared memory store instead of per-agent retrieval glue. |
| Solo developers prototyping agents | Need cross-session memory without standing up their own vector DB or writing their own retrieval code. |
| Framework / plugin authors | Want a vendor-neutral memory surface to integrate rather than ship their own memory class. |
| Hackathon builders | Want a turnkey memory endpoint to wire into a weekend agent demo. |

The source frames the user as the builder, not the end user of any single agent.

## Jobs To Be Done

1. **Functional job** — Persist and retrieve memories from any agent without rewriting the storage layer in every agent codebase.
2. **Functional job** — Expose the same memory surface to MCP-speaking agents (Claude Desktop, Cursor, etc.) so they share state with HTTP-speaking agents.
3. **Emotional job** — Stop hand-rolling retrieval glue for every new agent the builder starts.
4. **Social job** — Stand up an open alternative to closed agent-memory SaaS that charges per seat or per token.

## Success Metrics

- **Activation:** clone → install → point an agent at the HTTP endpoint or MCP server, all in under 15 minutes.
- **Interop:** the same memory written over HTTP is readable over MCP and vice versa, with no behavioral split between the two transports.
- **Adoption:** GitHub stars and forks as a proxy for reach; integrations with at least one MCP-speaking client and one HTTP-speaking agent demonstrated in the README.
- **Reliability:** write and search latency stays predictable under a single-user load; no silent data loss when the store restarts.

The post does not state a revenue target. The project is open source and the source does not name a business model.

## Pricing & Monetization

The post frames the project as open source with no hosted tier implied. The only paid dependency the user would incur is the embedding-model API cost (if a hosted embedder is chosen) plus their own infrastructure. Any hosted SaaS or paid tier is post-MVP and out of scope for this plan.

## Competitive Landscape

- **Framework-native memory** (LangChain Memory, LlamaIndex storage, Claude Projects) — convenient inside the framework, but ties the memory to that framework's class hierarchy and makes cross-runtime sharing hard.
- **Hosted agent-memory SaaS** — turnkey but vendor-locked, per-seat, and typically tied to a specific model provider.
- **DIY vector DB + retrieval code** — flexible but every builder writes the same glue.

The project's differentiator is the explicit "open source + HTTP + MCP + framework-agnostic" framing: one memory store that any agent runtime can speak to over a standard transport.

## Risks & Open Questions

- [ ] The post does not name the storage backend, the embedding model, or the retrieval semantics; those choices live on the project page and should be checked against the repo before relying on them.
- [ ] MCP is a moving target; the service must track MCP spec changes so the integration does not silently rot.
- [ ] Cross-agent memory has privacy implications the MVP must handle honestly: per-agent or per-user namespaces are a real product decision, not just a config toggle.
- [ ] "Memory" can mean many things (raw transcripts, summaries, structured facts, embeddings); the MVP must publish its data model so integrators do not assume a richer schema than the service offers.
