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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3199-llmcanvaschat-tree-based-llm-chat-on-an-infinite-canvas/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up the TanStack Start skeleton with a Drizzle + SQLite connection

## Phase 1: Core

- [ ] Integrate the node-graph canvas (React Flow or equivalent) with the project skeleton
- [ ] Define the canvas graph data model (nodes for prompt/response, edges for "came after")
- [ ] Implement the linear-thread rendering first, so the canvas can fall back to it later
- [ ] Implement the Anthropic adapter behind the shared provider interface, with BYOK key handling
- [ ] Add server-sent-event streaming so the user sees tokens as they arrive
- [ ] Add branching: a node can fork into a new prompt and response without losing the old branch
- [ ] Implement multi-provider regenerate that fans out the same prompt to the selected providers and places results side-by-side
- [ ] Wire OpenAI, Gemini, and OpenRouter adapters behind the same interface
- [ ] Persist the canvas graph to SQLite so sessions survive a reload
- [ ] Write tests for each provider adapter (mocked responses), the branching logic, and the BYOK key path

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Smoke-test: open a session with two providers' BYOK keys, branch a conversation, regenerate against both, and confirm both responses stream into side-by-side canvas nodes

---

_Generated automatically by Lúa on 2026-08-26_
