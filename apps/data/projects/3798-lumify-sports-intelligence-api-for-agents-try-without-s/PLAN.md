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

## Tech Stack

Stated on the docs page itself — this plan restates the page's own inventory.

- **Sports data REST API:** the underlying service, exposed with an OpenAPI schema at /openapi.json.
- **MCP server (23 tools):** hosted at lumify.ai/mcp, with one-click installs for Cursor/VS Code and a stdio bridge via npm.
- **OpenAPI schema:** the single source of truth clients and validators compile against (~64.7k tokens measured).
- **llms.txt agent artifacts:** graduated context sizes — llms.txt (~5.4k), llms-full.txt (~11.7k), docs/llms-full.txt (~81k) — plus a cheat sheet and agent cookbook.
- **npm/pypi SDKs:** @lumifyai/sdk (npm), lumify-sdk (PyPI), and the @lumifyai/mcp bridge for stdio clients.
- **Player-props catalog:** market keys for NFL/NCAAF/NBA/NCAAB/NHL/MLB, settleable vs. returned-not-graded, plus the forecastable 1:1 subset.

## Architecture

- **Data layer:** live sports intelligence (slates, player props, line movement) behind the API.
- **Schema layer:** the OpenAPI definition generates docs, SDKs and validator schemas — one source, many artifacts.
- **Agent layer:** the MCP server exposes 23 tools; an agent manifest (/.well-known/agent.json) declares transport and endpoint; llms.txt artifacts right-size context per task.
- **Client layer:** Cursor, Claude Desktop, VS Code/Copilot and any Bearer-header MCP client; npm/PyPI SDKs for typed REST.

## Milestones

1. **M0 — Try-without-signup.** MCP connect with a key and a first successful tool call, no account required.
2. **M1 — Context discipline.** Every artifact re-measured after regeneration; the cheat sheet stays ~1 page.
3. **M2 — SDK parity.** npm and PyPI SDKs cover the OpenAPI schema without drift.
4. **M3 — OAuth web connectors.** The explicitly-unimplemented path (ChatGPT, Claude.ai) lands or is formally deferred with the same honesty.

## Risks

- **Agent traffic patterns:** agents retry and mis-parse; the API must be built for hostile-but-well-meaning clients, which the docs do not discuss.
- **Context bloat:** the 81k-token dump is a footgun for agents that load everything; guidance must be enforced, not suggested.
- **OAuth gap:** web-connector users are excluded today; the market of ChatGPT/Claude.ai users stays out of reach until OAuth lands.
- **Schema drift:** MCP tools, docs and SDKs diverging would recreate the hallucinated-endpoint problem Lumify exists to solve.
- **Thin source:** one URL means pricing, coverage depth and compliance posture are all outside the capture.
