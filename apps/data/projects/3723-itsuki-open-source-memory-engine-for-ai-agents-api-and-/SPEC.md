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

## Problem

The Show HN post is URL-only: it points at [itsuki.app](https://itsuki.app/) with the title "Itsuki – open-source memory engine for AI agents (API and MCP)" as the only inline content. Reading the title literally, the project is an open-source memory layer that AI agents can talk to over HTTP or via MCP, and it is positioned as a standalone service rather than a per-agent library.

The underlying problem this responds to is the recurring memory-shape question every agent builder hits: an LLM's context window is finite, but a useful agent needs to remember prior interactions, user preferences, prior task outcomes, and domain knowledge across sessions. Builders end up gluing together one of three things — a vector store, a relational database, or a notes file — and writing the same retrieval-and-write code on top of it, in every agent. The MCP angle implies the author wants this memory to be reusable across agent runtimes, not tied to one framework's memory class.

The source does not name the storage backend, the embedding model, the retrieval semantics, or the API surface. Those choices live on the project page, not in the post.

## Objective

Ship an open-source memory service that an AI agent can read from and write to over HTTP or MCP, independently of the agent framework. The MVP targets the "any agent, any runtime, any stack" promise. It does not target a hosted SaaS, a paid tier, or an enterprise control plane.

## Target Users

- Agent builders who maintain multiple agents across frameworks and want one shared memory backend instead of per-agent stores.
- Solo developers and indie hackers prototyping long-running agents (coding assistants, research bots, personal assistants) who need cross-session memory without standing up their own retrieval stack.
- Framework authors and plugin authors who want a vendor-neutral memory API to integrate rather than ship their own memory class.

The post does not name enterprise or team use; the "open source" framing and the URL-only submission both signal a single-developer audience.

## MVP Scope

- An HTTP API that exposes memory operations (write, read, search, delete) to any client.
- An MCP server endpoint so MCP-speaking agents (Claude Desktop, Cursor, custom MCP clients) can use the same memory surface through the standard MCP protocol.
- A persistent store: a database of the agent's choosing. The post does not state which one.
- Embedding-based retrieval so the agent can ask "what did we discuss about X?" and get relevant prior memories back.
- Documentation that covers how to point an agent at the service (HTTP or MCP transport), how to authenticate, and how to inspect / clear the memory.

The MVP does not include a hosted multi-tenant cloud product, billing, team workspaces, or a web UI for end users.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Open source: the codebase is the product surface. No proprietary retrieval logic hidden behind a login.
- Two transports, one memory model: HTTP and MCP must read and write the same store; behavior must not fork by transport.
- Framework-agnostic: the service must not assume the agent is built with LangChain, LlamaIndex, or any specific SDK. Plain HTTP + MCP are the integration points.
- Self-hostable: the service runs on the user's own infrastructure or a single VM; no hard dependency on a vendor cloud.
- Honest about retrieval: the MVP does not promise "perfect recall" or "infinite memory." It exposes retrieval with whatever recall the chosen embedder and store give.
