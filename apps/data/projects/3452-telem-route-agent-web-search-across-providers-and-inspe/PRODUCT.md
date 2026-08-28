---
id: "3452"
slug: telem-route-agent-web-search-across-providers-and-inspe
title: Telem – Route agent web search across providers and inspect the traces
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49469804"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Agents, Retrieval, Observability]
tech: [TypeScript, Node.js, Fastify, LiteLLM-style router, OpenTelemetry]
---
# Telem – Route agent web search across providers and inspect the traces

## Value Proposition

Telem is a single web-search gateway for agents, sitting in front of Exa, Parallel, Tavily, Brave, Ceramic, Linkup, Seltz, You, SerpAPI, and others, returning every provider's results in the same shape — pick one or fan out concurrently. On top of the gateway, Telem records every search (and sub-agent search) a run makes, scores each trace on relevance and diversity, and exposes a run-level inspector so the developer can tell whether a bad agent outcome is bad search, bad reasoning, or slow search.

The opener the poster uses is the one most agent-builders want to hear: "your pipeline is broken because the web search is bad, and here is exactly where."

## Target Users

| Stakeholder | Why they care |
|---|---|
| Agent builders debugging wrong answers | Want to see which search in the trajectory failed rather than re-prompting the model. |
| VC / research analysts running due-diligence agents | Need fast, traceable retrieval across many sources; multi-provider fan-out matters. |
| Engineers integrating multiple search providers | Want one client and one JSON contract, not ten. |
| Multi-agent system authors | Need sub-agent traces rolled up to the parent run, not flattened. |

## Jobs To Be Done

1. **Functional job** — Call any supported web-search provider through a single API and inspect every search by run.
2. **Emotional job** — Stop blaming the model when the failure is actually in retrieval; pick the right next experiment.
3. **Social job** — Demo to a peer that a bad run is reproducible from the trace, not the vibes.

## Success Metrics

- **Provider fan-out coverage** — number of named providers (Exa, Parallel, Tavily, Brave, Ceramic, Linkup, Seltz, You, SerpAPI) reachable through the router on day one.
- **Response-shape conformance** — share of provider responses that round-trip through the homogeneous contract without manual mapping.
- **Tracing adoption** — share of agent runs that ship through Telem that have at least one trace recorded; target is 100%.
- **Quality-evaluator precision** — share of traces the evaluator flags as low-relevance / low-diversity that an engineer agrees are bad on inspection (the number is small and tracked from week 1).
- **Failure-localization time** — median time from "this run is bad" to "the bad step is this trace," measured by user session replay or self-report.

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee). The post does not state pricing or a hosted tier; the install-on-ramp language implies an open / self-host posture but stops short of a license or quota claim.

## Competitive Landscape

- **Exa, Parallel, Tavily, Brave, Ceramic, Linkup, Seltz, You, SerpAPI (direct)** — the long tail Telem sits in front of; some of them (e.g. Exa, Tavily) already serve agents directly and have their own tracing, so Telem's pitch has to be one-client-plus-observability rather than better search.
- **LLM-router products (LiteLLM-style)** — analogous shape for LLMs themselves; Telem is the same idea for the search tool, the post argues.
- **Agent-observability tools (Langfuse, Helicone, OpenLLMetry stacks)** — specialize in tracing the LLM call; Telem scopes the search tool call, which is the layer where the poster's failure modes actually live.
- **DIY multi-provider wrappers** — most agent teams will write one of these if Telem does not exist; the competitor is the in-house grep over API docs, not a public product.

## Risks & Open Questions

- [ ] Whether every named upstream provider can be coerced into the same JSON shape without losing provider-specific affordances (filters, recency signals, freshness controls).
- [ ] Whether tracing every search adds latency or cost enough to materially slow an agent run; budget it on day one.
- [ ] How to keep provider API keys out of trace payloads without breaking debuggability.
- [ ] Whether to charge per-trace, per-provider-call, or run a hosted SaaS; the post is silent.
- [ ] Whether the relevance / diversity score the evaluator emits survives independent replication — pick the eval set before the marketing writes itself.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49469804) · **Category:** show-hn · **Tags:** Show HN, Agents, Retrieval, Observability
