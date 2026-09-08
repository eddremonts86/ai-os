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

## Tech Stack

- **Node.js with TypeScript** as the runtime, matching the source's npm package `@cheppulabs/sonde`.
- **SQLite** as the symbol-level graph store, matching the source's "indexes a TypeScript, Python, or Swift repository into a symbol-level graph in SQLite".
- **Tree-sitter** as the parser family for TypeScript, Python, and Swift, matching the source's topics (`code-analysis`, `static-analysis`, `tree-sitter`).
- **MCP (Model Context Protocol)** as the tool surface, matching the source's three tools (`find_symbols`, `query_graph`, `get_impact_radius`).
- **npm** for distribution, matching the source's npm badge.
- **Apache-2.0** for the license, matching the source's LICENSE.
- **GitHub Actions** for CI, matching the source's `ci.yml` badge.
- **Vitest** or the test runner the source uses (the source's npm scripts declare the test command).

## Architecture

The library has one entry point (`sonde init`) and one runtime (the MCP server). The entry point indexes the repository and registers the server in `.mcp.json`; the runtime exposes three tools the agent can call.

The indexer walks the repository, parses each file with the language-appropriate tree-sitter parser, and extracts the symbols (functions, classes, methods, interfaces, types) into a SQLite database. The database holds the symbol-level graph: each symbol has a name, a kind, a location, and references to the symbols it calls and the symbols that call it. The graph is the source of truth; the tool responses are projections of the graph.

The MCP server reads the SQLite database and exposes three tools. `find_symbols` takes a query (a name, a pattern, a kind) and returns the symbols that match, truncated to the caller's token budget by the packer. `query_graph` takes a symbol and a relation (calls, called-by, references, defined-in) and returns the symbols related by that relation, truncated to the budget. `get_impact_radius` takes a symbol and returns the symbols affected by a change to it, truncated to the budget.

The packer is the budget contract. Every tool response is truncated to the caller's token budget by construction; the agent never receives a response that exceeds the budget. The packer is the structural reason Sonde never breaches the budget on the benchmark, where the agentic loop breached 3 of 6 runs.

The honesty clause is structural. The design doc (§2.2) names the queries Sonde loses on (behavioural queries with no shared vocabulary) and the design decision (local semantic retrieval was built and measured and does not fix it). The library does not claim the capability; if the agent's questions are mostly behavioural, an agentic search loop is the better tool today.

`sonde init` is the on-ramp. It indexes the repository, registers Sonde as an MCP server in `.mcp.json`, and refuses to write an `.mcp.json` it cannot safely merge into. The `--yes` flag skips the prompt; the default is to ask. The merge logic is the only piece of the entry point that touches a file outside the Sonde install directory.

## Milestones

1. **M1 — Tree-sitter language parsers** — the TypeScript, Python, and Swift parser bindings, the per-language symbol extractor.
2. **M2 — Symbol-level graph in SQLite** — the schema, the per-file ingest, the cross-file reference builder, the graph query layer.
3. **M3 — `find_symbols` MCP tool** — the query matcher, the projection, the packer.
4. **M4 — `query_graph` MCP tool** — the relation walker, the projection, the packer.
5. **M5 — `get_impact_radius` MCP tool** — the impact walker, the projection, the packer.
6. **M6 — Packer and the budget contract** — the truncation logic, the per-tool budget model, the budget-breach guard.
7. **M7 — `sonde init` entry point** — the indexer invocation, the `.mcp.json` safe-merge logic, the `--yes` flag, the prompt the user sees by default.
8. **M8 — Benchmark and design doc** — `npm run bench:fixture && npm run bench:large`, the `BENCHMARK.md` and `BENCHMARK-LARGE.md` write-up, the design doc §2.2 honesty clause.
9. **M9 — Apache-2.0 distribution** — the LICENSE file, the npm metadata, the README that names the trade where Sonde loses.

## Risks

- **Language parser drift** — a TypeScript, Python, or Swift version upgrade breaks the parser and the symbol extractor misses symbols. Mitigation: the parser bindings are pinned to the source's tested versions; the symbol extractor emits a per-file coverage report so the user can see what was missed.
- **Packer truncation hides the answer** — the packer truncates to the budget and the agent receives a response that does not contain the symbol it asked about. Mitigation: the packer's truncation is deterministic and the agent can re-query with a narrower pattern; the budget breach is the user's choice, not Sonde's.
- **`.mcp.json` safe-merge edge case** — a project with a non-trivial MCP config (multiple servers, comment syntax, JSONC) breaks the safe-merge logic and Sonde refuses to write. Mitigation: the safe-merge logic is conservative; the user can hand-edit the `.mcp.json` and run `sonde init --yes` to skip the prompt.
- **Behavioural-query silent failure** — the agent asks a behavioural query Sonde cannot answer, and the tool returns an empty result the agent treats as "no such symbol". Mitigation: the design doc names the known loss; the tool response can include an "out of scope" message for queries the design doc lists as known losses.
- **Symbol graph growth** — the SQLite database grows beyond a single file and the query layer slows. Mitigation: the schema supports sharding by directory; the benchmark on a 19,409-line repo is the floor, not the ceiling.
- **Benchmark fixture drift** — the fixture set's symbols change and the benchmark rerun diverges from the published numbers. Mitigation: the fixture set is byte-pinned; the bench harness fails on drift.
- **Honesty-clause pressure** — a user asks for a behavioural-query capability and the design doc's honesty clause is the friction. Mitigation: the design doc is explicit; the capability is not claimed; a future Sonde release can add the capability when the design decision changes.
