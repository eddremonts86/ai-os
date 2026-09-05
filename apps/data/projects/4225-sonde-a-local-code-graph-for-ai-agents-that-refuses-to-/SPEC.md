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

## Problem

AI coding agents answer structural questions about a repository — who calls this, what breaks if I change it, which tests relate to it — by running a search loop that emits multiple tool calls, burns context tokens, and blows the caller's token budget on longer queries. The Sonde library indexes a TypeScript, Python, or Swift repository into a symbol-level graph in SQLite and exposes three MCP tools (`find_symbols`, `query_graph`, `get_impact_radius`) so an agent can answer the same structural questions in one call.

The source is the GitHub repository for `anishmoncivarghese/sonde`, published to npm as `@cheppulabs/sonde` under Apache-2.0. The README publishes a benchmark on a real 19,409-line production TypeScript repository: Sonde matches a competent agentic search loop's 1.000 recall on every structural task while using roughly 3x less context (1,262 vs 3,621 tokens), 8x fewer tool calls (1.0 vs 8.0), and roughly 147x less wall-clock time (263 ms vs 38,602 ms), and never exceeds the caller's token budget, because the packer truncates to it by construction. The benchmark numbers are reproducible via `npm run bench:fixture` and `npm run bench:large`.

The library is honest about where it loses. Behavioural queries with no shared vocabulary ("where is the retry backoff decided?") score 0.00; local semantic retrieval was built and measured and does not fix it (the design doc §2.2 names this), so the capability is not claimed. The trade is structural answers for a fraction of the cost, inside a budget — not "finds what grep cannot", which is the explicit non-claim.

The source names the actor (an AI coding agent answering structural questions about a TypeScript, Python, or Swift repository), the pain (the search loop burns tokens and wall-clock time on questions a symbol-level graph can answer in one call), and the missing thing (a local index that exposes `find_symbols`, `query_graph`, and `get_impact_radius` as MCP tools the agent can call). It does not name a specific agent, a specific repository size, or a specific budget model.

## Objective

Build a local code-context engine that indexes a TypeScript, Python, or Swift repository into a symbol-level graph in SQLite and exposes three MCP tools — `find_symbols`, `query_graph`, `get_impact_radius` — so an AI coding agent can answer structural questions in one call inside the caller's token budget, with the packer truncating to the budget by construction.

## Target Users

- AI coding agents answering structural questions about a TypeScript, Python, or Swift repository and needing one-call answers inside the caller's token budget.
- Coding-agent maintainers who want an MCP server the agent can register as a tool without changing the agent's runtime.
- Engineering teams running an internal coding agent on a large repository and needing a local index that does not require a hosted service.
- Open-source contributors who want a library they can drop into a TypeScript, Python, or Swift project without changing the project's lockfile beyond what the project already accepts.
- Researchers comparing code-context engines on a shared benchmark, who want a fixture set whose numbers are reproducible via `npm run bench:fixture` and `npm run bench:large`.

## MVP Scope

- A Node library `@cheppulabs/sonde` published to npm under Apache-2.0.
- A `sonde init` command that indexes the repository, registers Sonde as an MCP server in the project's `.mcp.json`, and refuses to write an `.mcp.json` it cannot safely merge into (with `--yes` to skip the prompt).
- A symbol-level graph in SQLite that captures the symbols (functions, classes, methods, interfaces, types) in TypeScript, Python, and Swift repositories.
- An MCP server that exposes three tools: `find_symbols`, `query_graph`, `get_impact_radius`.
- A packer that truncates the tool response to the caller's token budget by construction, so the agent never receives a response that exceeds the budget.
- A benchmark on a real 19,409-line production TypeScript repository that measures recall, tool calls, context tokens, latency, and budget breaches against a competent agentic search loop.
- A benchmark entry point (`npm run bench:fixture` and `npm run bench:large`) with results in `BENCHMARK-LARGE.md` and `BENCHMARK.md`.
- A design doc that names the queries Sonde is honest about losing on (behavioural queries with no shared vocabulary) and the design decision (§2.2) the team made about local semantic retrieval.
- An Apache-2.0 license matching the source's LICENSE.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The library supports TypeScript, Python, and Swift repositories. A repository in a language the library does not parse is a setup failure, not a coverage gap.
- The benchmark is reproducible. `npm run bench:fixture && npm run bench:large` produces the same numbers on the same commit, or the bench is broken.
- The packer truncates to the caller's token budget by construction. The agent never receives a response that exceeds the budget.
- The library is honest about where it loses. Behavioural queries with no shared vocabulary score 0.00; the capability is not claimed; the design doc names the trade.
- `sonde init` refuses to write an `.mcp.json` it cannot safely merge into. The `--yes` flag skips the prompt; the default is to ask.
- The MCP server exposes exactly three tools (`find_symbols`, `query_graph`, `get_impact_radius`). A tool outside the three is a scope failure.
- The library is local. No hosted service, no API key, no network call at runtime; the index lives in the project's SQLite database.
