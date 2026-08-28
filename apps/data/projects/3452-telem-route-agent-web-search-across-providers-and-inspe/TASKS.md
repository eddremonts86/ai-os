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

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Define the homogeneous request/response JSON contract (fields stable across providers)
- [ ] Pick the run-store schema (runs, traces, evaluator scores, secret-stripping rules)
- [ ] Stand up the TypeScript + Fastify gateway skeleton with one health-check route
- [ ] Keep the `curl docs.telem.ai/alpha_install.sh | sh` command working end-to-end after each release
- [ ] Document the per-provider key onboarding (one key per upstream; never logged)

## Phase 1: Core

- [ ] Provider adapters, one per named upstream: Exa, Parallel, Tavily, Brave, Ceramic, Linkup, Seltz, You, SerpAPI
- [ ] Shape-conformance test suite: round-trip each provider through the homogeneous contract, fail CI on drift
- [ ] Single-provider routing path with circuit breaking and graceful degradation per upstream
- [ ] Fan-out mode: concurrent queries to N providers, merged and ranked into the homogeneous response
- [ ] OpenTelemetry spans emitted per gateway call; spans written to the run store with timestamps and run id
- [ ] Trace evaluator: relevance and diversity score per span; thresholds per query type configurable
- [ ] Run inspector web app: per-run trace table, failure markers for low-relevance / low-diversity, deep-link from run URL
- [ ] Per-provider circuit breakers: open on consecutive failures, half-open on schedule; status surfaced in the inspector
- [ ] Secret-stripping pass on every span payload before persistence (API keys, query args with secrets)
- [ ] Cost cap per run: configurable maximum provider spend, exceeded runs flagged in the trace inspector

## Phase 2: Deploy

- [ ] Public docs at `docs.telem.ai` covering the install script, the contract, and the run inspector
- [ ] Onboarding for the first ten alpha teams using the agent-operated install
- [ ] Public changelog entry per upstream provider-shape drift caught by the conformance suite
- [ ] Post-mortem at week 12: provider-coverage chart, fan-out cost trend, evaluator precision trend
