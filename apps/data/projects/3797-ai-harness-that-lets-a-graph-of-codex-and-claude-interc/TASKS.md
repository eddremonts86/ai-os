---
id: "3797"
slug: ai-harness-that-lets-a-graph-of-codex-and-claude-interc
title: AI Harness that lets a graph of Codex and Claude intercommunicate
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49492155"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Agent fleet orchestration, graph-based agent topologies, budget-constrained loop engine, MCP tunnelling, secret reduction layer, Slack/WhatsApp connectors]
---
# AI Harness that lets a graph of Codex and Claude intercommunicate

## Phase 0: Scaffold

- [x] Read the Show HN post to confirm the seven capabilities, the example topology and the Leash budget example
- [x] Write SPEC.md (this document)
- [x] Implement the fleet core: agent nodes, inter-agent messaging, user-to-CEO interaction
- [x] Define the Graph Engineering pattern format matching the white paper's 15 patterns

## Phase 1: Core

- [ ] Implement the Agent Board with slack-like progress messages
- [ ] Implement Leash: goal + budget accounting, findings and next-run prep on budget exhaustion
- [ ] Implement secret reduction with an audit path proving secrets never reach agents
- [ ] Implement MCP tunnelling for agent-to-agent endpoint sharing

## Phase 2: Deploy

- [ ] Add Slack and WhatsApp connectors for assistant-style access
- [ ] Publish the repo and the white paper; recruit feedback per the post's ask
- [ ] Verify budget adherence and secret zero-leak on real multi-agent tasks

---

_Generated automatically by Lúa on 2026-08-29_
