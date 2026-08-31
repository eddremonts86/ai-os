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

## Value Proposition

An open-source web search that AI agents call for grounded answers, with a hard rule at the end of the pipeline: when retrieved results cannot support an answer, the agent gets a refusal instead of a hallucination. The value is trust — agent outputs backed by real pages or explicitly declined. The capture is title-only, so every claim beyond that sentence is the title's, not a verified feature.

**One-liner:** Open-source web search for AI agents that grounds answers in live results and aborts hallucinations instead of inventing them.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Agent developers | A search tool their agents can call without a hosted-API dependency. |
| Self-hosters | An open-source search layer run on their own infrastructure. |
| Grounded-output teams | An explicit abort path when no search result supports an answer. |

The capture names no segments; the rows follow from the title's claim.

## Jobs To Be Done

1. **Functional job** — Give an AI agent web-search capability through a single tool call.
2. **Functional job** — Abort rather than embellish when retrieved results cannot ground the answer.
3. **Functional job** — Run the whole search stack self-hosted, open source.
4. **Emotional job** — Trust agent answers because they cite real pages or refuse.

## Success Metrics

- **Abort rate:** share of ungrounded answers refused versus emitted.
- **Grounding rate:** share of final answers carrying at least one supporting result.
- **Self-host deployments:** installs running outside the maintainer's own machine.
- **Latency budget:** time per search-plus-answer round trip at the agent boundary.

## Pricing & Monetization

None stated. The capture declares the project open source and names no commercial model.

## Competitive Landscape

The post names no competitors. The category is agent-oriented web search: hosted search APIs and self-hostable metasearch engines that give chat and coding agents a browse-the-web tool. Simurg's claimed angle inside that category is the abort path — refusing instead of fabricating — rather than raw result quality.

## Risks & Open Questions

- [ ] Title-only capture: API shape, latency and index coverage are unknown.
- [ ] "Aborts hallucinations" must hold in practice; a weak abort path is worse than none because it invites false trust.
- [ ] Competing with established hosted search APIs on relevance is hard for a new open-source project.
- [ ] No maintenance or community signal appears anywhere in the capture.
