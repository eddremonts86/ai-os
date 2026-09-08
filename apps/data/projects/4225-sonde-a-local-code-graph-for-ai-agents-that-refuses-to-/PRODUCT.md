---
id: "4225"
slug: sonde-a-local-code-graph-for-ai-agents-that-refuses-to-
title: "Sonde, a local code graph for AI agents that refuses to guess"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507034"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Sonde, a local code graph for AI agents that refuses to guess

## Value Proposition

A local code-context engine that indexes a TypeScript, Python, or Swift repository into a symbol-level graph in SQLite and exposes three MCP tools — `find_symbols`, `query_graph`, `get_impact_radius` — so an AI coding agent can answer structural questions in one call inside the caller's token budget. The packer truncates to the budget by construction, so the agent never receives a response that exceeds the budget.

The benchmark numbers the source publishes are real and reproducible: on a 19,409-line production TypeScript repository, Sonde matches a competent agentic search loop's 1.000 recall on every structural task while using roughly 3x less context (1,262 vs 3,621 tokens), 8x fewer tool calls (1.0 vs 8.0), and roughly 147x less wall-clock time (263 ms vs 38,602 ms). Sonde never exceeds the caller's token budget; the agentic loop breached the budget on 3 of 6 runs.

The library is honest about where it loses. Behavioural queries with no shared vocabulary score 0.00; the design doc (§2.2) names the trade; the capability is not claimed. If the agent's questions are mostly behavioural, an agentic search loop is the better tool today.

**One-liner:** A local code-context engine that exposes three MCP tools — `find_symbols`, `query_graph`, `get_impact_radius` — so an AI coding agent can answer structural questions in one call inside the caller's token budget, with the trade named where it loses.

## Target Users

| Stakeholder | Why they care |
|---|---|
| AI coding agents | Need one-call structural answers inside the caller's token budget, with the packer truncating to the budget by construction. |
| Coding-agent maintainers | Want an MCP server the agent can register as a tool without changing the agent's runtime. |
| Engineering teams running an internal coding agent | Need a local index that does not require a hosted service. |
| Open-source contributors | Want a library they can drop into a TypeScript, Python, or Swift project without changing the project's lockfile. |
| Researchers comparing code-context engines | Want a fixture set whose numbers are reproducible via `npm run bench:fixture` and `npm run bench:large`. |

## Jobs To Be Done

1. **Functional job** — Index a TypeScript, Python, or Swift repository into a symbol-level graph in SQLite and expose `find_symbols`, `query_graph`, and `get_impact_radius` as MCP tools the agent can call.
2. **Functional job** — Truncate every tool response to the caller's token budget by construction, so the agent never receives a response that exceeds the budget.
3. **Functional job** — Reproduce the benchmark on a real 19,409-line production TypeScript repository via `npm run bench:fixture && npm run bench:large`, with results in `BENCHMARK-LARGE.md` and `BENCHMARK.md`.
4. **Emotional job** — Stop the feeling that the agent is going to breach the token budget on the third query and the rest of the session is wasted.
5. **Social job** — Be the team whose coding agent answers structural questions in one call inside the budget, with the trade named where the agent loses.

## Success Metrics

- **Recall parity** — share of structural tasks where Sonde matches the agentic search loop's 1.000 recall. The source publishes 1.00; the metric is the floor, not the ceiling.
- **Context-token ratio** — share of structural queries where Sonde uses fewer context tokens than the agentic loop. The source publishes ~3x; the metric is the compression ratio.
- **Tool-call ratio** — share of structural queries where Sonde uses fewer tool calls than the agentic loop. The source publishes ~8x; the metric is the call efficiency.
- **Latency ratio** — share of structural queries where Sonde returns faster than the agentic loop. The source publishes ~147x; the metric is the wall-clock efficiency.
- **Budget-breach rate** — share of runs where Sonde exceeds the caller's token budget. The source publishes 0 of 6; a non-zero rate is a packer failure.
- **Language coverage** — share of supported languages (TypeScript, Python, Swift) whose symbols Sonde indexes correctly. A symbol missing from the index is a coverage gap.
- **Honest-loss declaration** — share of queries where Sonde scores 0.00 that the design doc names as a known loss. The metric is the honesty clause, not the coverage.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The library is published to npm under Apache-2.0. The source is explicit that Sonde is a local library, not a hosted service; there is no API key, no account, no network call at runtime. Any future monetization has to be measured against the recall parity and the budget-breach rate, because those are the metrics the source ties to the library's value proposition.

## Competitive Landscape

- **Agentic search loops (the names the source does not provide)** — match Sonde's recall on structural tasks but use more tokens, more tool calls, more wall-clock time, and breach the budget on a non-trivial share of runs.
- **Grep + regex** — finds text, not symbols, and does not answer "who calls this" or "what breaks if I change it" without a follow-up loop.
- **Hosted code-graph services (the names the source does not provide)** — answer structural questions, but require a hosted service, an API key, and a network call at runtime; Sonde is local.
- **LSP-based tooling** — answers structural questions for the developer, not for the agent; the tool surface is not an MCP server.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the language parser coverage is enough for the repositories Sonde is used on. The source lists TypeScript, Python, and Swift; the open question is how the parser handles a multi-language repository, a polyglot monorepo, or a generated-code directory.
- [ ] Validate the packer's truncation logic is correct under the caller's token budget model. The packer truncates to the budget by construction; the open question is whether the agent's budget model is per-turn, per-session, or per-tool-call, and whether Sonde's packer matches.
- [ ] Decide how Sonde handles a repository whose symbol-level graph grows beyond a single SQLite database. The benchmark is on a 19,409-line repository; the open question is whether Sonde scales to a 10M-line monorepo with the same tool-call ratio.
- [ ] Establish a documented upgrade path when a new tool is added to the MCP surface. The source exposes exactly three tools; the open question is whether a fourth tool (e.g. `find_tests`) is a scope expansion or a separate library.
- [ ] Confirm the `.mcp.json` merge logic is safe under a project that already has an MCP server registered. `sonde init` refuses to write an `.mcp.json` it cannot safely merge into; the open question is what counts as "safely merge" in a project with a non-trivial MCP config.
- [ ] Define the policy on a behavioural query the design doc names as a known loss. Sonde scores 0.00 on behavioural queries; the open question is whether the library should refuse the query, return a "behavioural query is out of scope" message, or return an empty result.
- [ ] Decide the policy on a benchmark rerun that diverges from the published numbers. The benchmark is reproducible; the open question is whether a divergence is a library regression, a fixture drift, or a benchmark harness drift, and which one the CI catches first.
