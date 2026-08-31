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

## Tech Stack

Chosen for the title's three promises — open source, web search, hallucination aborts; the capture names no libraries.

- **Search backend:** result fetching and merging from web indexes.
- **Agent tool-call API:** a JSON tool interface agent runtimes can call.
- **Grounding layer:** links candidate answers to retrieved snippets.
- **Abort logic:** refuses when retrieved support falls below the threshold.
- **Self-host packaging:** container or single-binary distribution.

## Architecture

- **Query intake:** the agent's search request enters at one tool-call boundary.
- **Retrieval:** parallel index queries merge into ranked results.
- **Grounding:** answer construction is allowed only from retrieved passages.
- **Abort gate:** no supported evidence produces an explicit refusal message, logged with its reason.
- **Agent boundary:** the internals stay behind the single tool contract.

## Milestones

1. **M0 — Searchable core.** A search endpoint returns ranked web results; the open-source repo skeleton exists.
2. **M1 — Agent interface.** The tool-call API with snippet grounding works from a real agent runtime.
3. **M2 — Abort path.** Refusals fire with logged reasons when evidence is absent.
4. **M3 — Self-host release.** Container or package ships with run instructions; integration tests run against a real agent.

## Risks

- **Relevance gap:** established hosted search APIs set a high quality bar.
- **Abort threshold tuning:** too strict makes the tool useless; too loose lets hallucinations leak through.
- **Single-maintainer risk:** one repo exists in the capture and nothing else is known.
