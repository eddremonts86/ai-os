---
id: "3798"
slug: lumify-sports-intelligence-api-for-agents-try-without-s
title: Lumify – sports intelligence API for agents (try without signup)
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49491991"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Sports data REST API, MCP server (23 tools), OpenAPI schema, llms.txt agent artifacts, npm/pypi SDKs, player-props catalog]
---
# Lumify – sports intelligence API for agents (try without signup)

## Phase 0: Scaffold

- [x] Read lumify.ai/docs/ai to inventory the MCP tools, doc artifacts and stated gaps
- [x] Write SPEC.md (this document)
- [x] Verify the try-without-signup path: MCP connect with Bearer key, first tool call
- [x] Confirm token budgets are measured (UTF-8 bytes / 4), not estimated

## Phase 1: Core

- [ ] Verify schema single-sourcing: MCP tools, OpenAPI, SDKs and docs agree
- [ ] Keep the player-props catalog current across NFL/NCAAF/NBA/NCAAB/NHL/MLB with settleable semantics
- [ ] Re-measure llms.txt/OpenAPI token budgets after each regeneration
- [ ] Add the copy-paste context block and starter prompts to every supported client path

## Phase 2: Deploy

- [ ] Implement OAuth web connectors for ChatGPT/Claude.ai, or document a formal deferral
- [ ] Publish the pollable changelog for agents
- [ ] Expand SDK parity (npm/PyPI) and rate-limit ergonomics for agent traffic

---

_Generated automatically by Lúa on 2026-08-29_
