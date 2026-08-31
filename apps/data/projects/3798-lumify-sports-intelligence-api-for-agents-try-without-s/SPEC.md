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

## Problem

The Show HN post is URL-only, pointing at lumify.ai/docs/ai — a documentation surface built specifically for coding agents. The problem Lumify attacks is that agents building on sports data usually fail before they start: they hallucinate endpoints, guess schemas, and burn tokens on wrong calls. Lumify's answer is "built for agents": a hosted MCP server with 23 tools, machine-readable docs with measured token budgets (llms.txt at ~5.4k tokens, the full docs dump at ~81k, an OpenAPI schema at ~64.7k, each size stated as measured UTF-8 bytes divided by 4, "not estimated"), a player-props catalog covering NFL, NCAAF, NBA, NCAAB, NHL and MLB market keys, and copy-paste prompts "that prevent hallucinated endpoints". The title's "try without signup" reflects the design: connect the MCP server or read the docs without an account first. The page names its own gaps honestly: web connectors (ChatGPT, Claude.ai) need OAuth, "which Lumify does not implement yet" — supported clients are Cursor, Claude Desktop, VS Code or any Bearer-header MCP client. SDKs exist for typed REST usage (@lumifyai/sdk on npm, lumify-sdk on PyPI).

## Objective

Make Lumify the default sports-intelligence layer for coding agents: zero-friction onboarding (no signup), agent-first docs with measured sizes, and MCP + REST + SDK paths that all resolve against the same schema. The MVP is the current surface kept honest — agent manifest, cookbook and changelog included — rather than new sports coverage.

## Target Users

- Developers building agents that need live sports intelligence (odds, player props, line movement).
- AI-tooling builders using Cursor, Claude Code, Claude Desktop or VS Code/Copilot who want a drop-in MCP server.
- SDK users who prefer typed REST clients (npm/PyPI) over MCP.

## MVP Scope

- Hosted MCP server with the 23 tools, installable one-click in Cursor/VS Code, with Bearer-key auth.
- Agent docs: llms.txt, llms-full.txt, docs/llms-full.txt, OpenAPI JSON, cheat sheet, agent cookbook — each with measured token sizes.
- Player-props catalog: market keys for NFL/NCAAF/NBA/NCAAB/NHL/MLB, settleable vs. returned-not-graded, plus the forecastable 1:1 subset.
- Forecasts documentation: the player-prop rate model and field catalog.
- SDKs: @lumifyai/sdk (npm) and lumify-sdk (PyPI), plus the MCP bridge package.
- Try-without-signup path and an agent manifest at /.well-known/agent.json.

## Constraints

- Token budgets are measured (UTF-8 bytes / 4), not estimated — the docs must keep re-measuring and the page must keep saying so.
- Honesty about auth coverage: no OAuth yet; Bearer-header MCP clients only for now.
- Schema single-sourcing: MCP tools, REST docs and SDKs must agree with the OpenAPI schema, or the anti-hallucination promise fails.
- The post states no pricing; the docs page references pricing elsewhere without quoting numbers — nothing to scope in.
