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

## Value Proposition

Sports intelligence that agents can actually use. A 23-tool MCP server, docs with measured token budgets (not estimates), an OpenAPI schema, typed SDKs on npm and PyPI, and a player-props catalog across NFL, NCAAF, NBA, NCAAB, NHL and MLB — engineered so a coding agent stops guessing endpoints and starts building. You can try it without signup, and the docs say plainly what works (Bearer MCP clients) and what does not yet (OAuth web connectors).

**One-liner:** The agent-ready sports intelligence layer — structured, real-time, explainable, try-without-signup.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Agent builders needing sports data | MCP tools and measured docs remove the hallucinated-endpoint failure mode. |
| Cursor/VS Code/Claude Desktop users | One-click MCP install with a Bearer key, no account wall first. |
| Typed-client developers | npm/PyPI SDKs instead of hand-rolled REST calls. |

The post does not describe sportsbooks or consumers as customers; the audience is developers and autonomous systems.

## Jobs To Be Done

1. **Functional job** — Connect an agent to sports intelligence via MCP with one-click install.
2. **Functional job** — Load exactly the right amount of context: cheat sheet (~1 page), llms.txt (~5.4k tokens), or the full dump (~81k), each measured.
3. **Functional job** — Query player props across the six covered leagues with settleable vs. returned-not-graded semantics clear.
4. **Functional job** — Build typed REST clients from the OpenAPI schema via the SDKs.
5. **Emotional job** — Trust the numbers: token sizes are measured and re-measured, changelog entries are pollable.

## Success Metrics

- **Zero-friction onboarding:** MCP connect + first successful tool call without signup.
- **Agent success rate:** agents building against Lumify make correct calls (no hallucinated endpoints) using the shipped context blocks.
- **Doc-size honesty:** token budgets match re-measurement after regeneration — the page's own stated discipline.
- **Coverage breadth:** live slates and player props across NFL/NCAAF/NBA/NCAAB/NHL/MLB.
- **The source names no revenue target; pricing is referenced but not quoted in the capture.**

## Pricing & Monetization

The docs page references pricing ("FAQ, pricing, coverage" in llms-full.txt) without stating numbers in the captured text; the Show HN title's hook is "try without signup". Pricing specifics are out of scope for this plan.

## Competitive Landscape

The capture does not name competitors. The landscape is sports-data APIs, where the usual developer experience is sprawling REST docs and no agent story; Lumify's differentiation is the agent-first surface — MCP, llms.txt artifacts, measured token budgets, SDKs and an agent manifest — rather than any single dataset. No named alternatives or price comparisons appear.

## Risks & Open Questions

- [ ] OAuth web connectors are unimplemented; ChatGPT and Claude.ai users are locked out for now, and the page says so — the honesty is good, the gap is real.
- [ ] An 81k-token docs dump risks context bloat; the measured-size discipline must guide which artifact an agent loads.
- [ ] Agent-facing APIs get hammered by agent misbehavior (retries, malformed calls); rate limits and error ergonomics are unstated.
- [ ] Sports data licensing and odds-provisioning are regulated in some jurisdictions; the capture says nothing about compliance.
- [ ] The URL-only post means the product surface beyond the docs page (pricing, uptime, coverage depth) is inferred.
