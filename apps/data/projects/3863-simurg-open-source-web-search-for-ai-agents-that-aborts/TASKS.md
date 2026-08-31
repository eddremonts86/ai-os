---
id: "3863"
slug: simurg-open-source-web-search-for-ai-agents-that-aborts
title: Simurg open-source web search for AI agents that aborts hallucinations
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49500488"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Open-source search backend, Agent tool-call API, Grounded answer retrieval, Hallucination abort logic, Self-hostable service, Web index querying]
---
# Simurg open-source web search for AI agents that aborts hallucinations

## Phase 0: Scaffold

- [x] Read the capture and confirm it is a bare GitHub link with a title-only product claim
- [x] Write SPEC.md (this document)
- [x] Scaffold the search-service repo with a minimal query endpoint
- [x] Define the agent tool-call contract: input query, ranked results, abort signal

## Phase 1: Core

- [ ] Implement result fetching and merging from one or more web indexes
- [ ] Ground answers in retrieved snippets with source attribution
- [ ] Implement the abort path with logged refusal reasons
- [ ] Record grounding and abort rates per request

## Phase 2: Deploy

- [ ] Package the service for self-hosting (container or single binary) with docs
- [ ] Integrate end to end with at least one real agent runtime
- [ ] Publish the open-source repo with run instructions
