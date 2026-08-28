---
id: "3199"
slug: llmcanvaschat-tree-based-llm-chat-on-an-infinite-canvas
title: Llmcanvas.chat Tree-based LLM chat on an infinite canvas
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49451733"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Llmcanvas.chat Tree-based LLM chat on an infinite canvas

## Tech Stack

- **Frontend:** React + TypeScript with TanStack Start for the SSR shell. The canvas itself uses a proven library (React Flow or a similar node-graph renderer) so the drag / connect / branch interactions are not built from scratch.
- **Provider adapters:** TypeScript modules per provider (Anthropic, OpenAI, Gemini, OpenRouter) that share a common interface so a regenerate-against-multiple-models action can fan out without rewriting request code.
- **Streaming:** server-sent events from the TanStack Start API so the user sees tokens as they arrive instead of waiting for the full response.
- **BYOK key storage:** keys live in the browser's encrypted local storage (the user owns them); the API never sees them in a way that persists past the request.
- **DB:** SQLite with Drizzle ORM to persist the canvas graph (nodes + edges), per-node provider/model metadata, and per-user settings.
- **Deployment:** Coolify + Docker for the API + web host.

## Architecture

```
Canvas (React + node-graph lib)
    │
    ▼
Local API (TanStack Start)
    │
    ├──▶ Anthropic adapter ──▶ Anthropic API  (BYOK)
    ├──▶ OpenAI adapter    ──▶ OpenAI API     (BYOK)
    ├──▶ Gemini adapter    ──▶ Gemini API     (BYOK)
    └──▶ OpenRouter ad.    ──▶ OpenRouter API (BYOK)
    │
    ▼
SQLite (canvas graph + per-node metadata)
```

- The canvas graph is the source of truth: nodes are prompt or response, edges are "this came after that". Branching is just adding a new edge.
- A regenerate action duplicates the prompt node, fans out a request per selected provider, and writes the results as parallel response nodes the user can place side-by-side.
- The "linear chat" mode is a rendering of the same graph laid out vertically; it is not a separate data model.

## Milestones

1. **M0 — Spec + design tokens + canvas shell.** Existing SPEC.md and DESIGN.md approved; the node-graph canvas renders a single linear thread end-to-end.
2. **M1 — One-provider BYOK.** A single provider (e.g. Anthropic) works with the user's API key, and the canvas streams responses.
3. **M2 — Branching.** Any node can fork into a new prompt and response without losing the old branch.
4. **M3 — Multi-provider regenerate.** Regenerate sends the same prompt to multiple selected providers and places the responses side-by-side.
5. **M4 — Linear-mode fallback.** The canvas can be flattened into a vertical chat view for users who do not want the graph UI right now.
6. **M5 — Remaining providers + persistence.** OpenAI, Gemini, and OpenRouter wired up; canvas graph persists to SQLite between sessions.

## Risks

- Provider drift: each provider's API changes; the adapter layer has to detect breakage early so a "regenerate against all four" action does not half-fail silently.
- BYOK key safety: any path that ships a key to the server is a leak; the audit needs to cover logs, error reports, and proxy hops.
- Canvas performance: live-streaming into a node while the user drags the canvas around will reveal any over-rendering. The MVP needs to virtualize and only render nodes in the viewport.
- Linear-mode UX: a half-finished linear mode will be the loudest complaint if the canvas is the headline; treat it as a first-class view, not a hidden mode.
