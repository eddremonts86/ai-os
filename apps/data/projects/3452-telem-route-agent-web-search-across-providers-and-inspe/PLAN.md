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

## Tech Stack

- **Gateway:** TypeScript + Node.js (Fastify) — single gateway process that fronts all upstream providers.
- **Provider adapter layer:** per-provider modules that map the homogeneous request/response onto each upstream's API; one module per named provider (Exa, Parallel, Tavily, Brave, Ceramic, Linkup, Seltz, You, SerpAPI).
- **Tracing:** OpenTelemetry-compatible spans emitted by the gateway, persisted into the run store.
- **Run store:** Postgres for runs, traces, and evaluator scores; object storage for any cached payloads the trace inspector replays.
- **Install path:** the `curl docs.telem.ai/alpha_install.sh | sh` script the post shows — wraps a one-shot setup into a single shell command.

## Architecture

The gateway is a thin router: it accepts a homogeneous request (query, optional filters, fan-out flag, run id), dispatches to one provider or many in parallel, normalizes responses into the same JSON shape, and emits an OpenTelemetry span per call. The evaluator runs on each completed span and writes a relevance and diversity score back to the run store.

The run inspector is a small TypeScript web app that reads the run store and renders, for any run, the chain of traces, their scores, and the failure markers (low-relevance, low-diversity). The whole stack is reachable from a single install script and a single API key per upstream provider.

## Milestones

1. **M0 — Single-provider router.** One provider behind the homogeneous contract, end-to-end against a real query; install script still works.
2. **M1 — All named providers.** Exa, Parallel, Tavily, Brave, Ceramic, Linkup, Seltz, You, SerpAPI — each with an adapter and a passing shape-conformance test.
3. **M2 — Fan-out mode.** Multi-provider concurrent query with merged, ranked results.
4. **M3 — Tracing + evaluator.** OpenTelemetry spans per call; relevance and diversity score per span written to the run store.
5. **M4 — Run inspector web app.** Per-run trace table; failure markers; one-click from a run URL to the trace that failed the bar.

## Risks

- **Provider-shape drift** — upstream providers ship breaking changes; an adapter that returns the homogeneous shape today can break tomorrow. Conformance tests must run on every CI build against live upstreams.
- **Tracing overhead** — per-call spans for hundreds of searches per run can dominate cost if the sampling and storage are not bounded; budget the per-trace cost before promising "free tracing."
- **Fan-out cost amplification** — concurrent queries to multiple providers multiply spend on a single run; cap fan-out by default and surface the cost in the inspector.
- **Secret leakage in traces** — provider API keys, query arguments, and result snippets can carry secrets; secret-stripping in the trace pipeline is mandatory.
