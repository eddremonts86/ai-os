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

## Problem

The poster works in venture capital, previously in information retrieval. When agents went viral, they built a due-diligence agent for their day job; the first vibe-coded version was bad. Their first reaction was to blame the model — trying Fable, "GPT 5.5," DeepSeek, Kimi, Qwen, and prompt changes — none of it worked.

Then they started reading the trajectories, not just the answers: what did the agent search for, what came back, what pages did it read, where did it derail. The taxonomy of failure that came out of that exercise is concrete:

- The agent is stuck because the information returned is irrelevant or wrong.
- The agent iterates the same query ("XXX lab UCB CS PhD founder 2026", "2026 XXX lab machine learning systems students startup") because the web-search provider is not up-to-date.
- Sub-agents give up early because the model's intelligence is insufficient or over-guardrailed.
- Everything is slow: a run jeopardized at minute 1 ran for another ten minutes before returning nonsense — because of bad searches, but nothing in the existing toolchain revealed it.

The fix they built has two halves. (1) A **Web Search / Fetch router**: one gateway exposing Exa, Parallel, Tavily, Brave, Ceramic, Linkup, Seltz, You, SerpAPI, and others; pick one or query several concurrently; responses come back in a homogeneous format. (2) **Web Search Observability**: trace every search the agent (and its sub-agents) make; an evaluator scores relevance, diversity, and other qualities; the goal is to answer one question — "is your pipeline broken because the web search is bad, and if so, where?".

Installation is agent-operated: `curl docs.telem.ai/alpha_install.sh | sh` is the public on-ramp.

## Objective

Ship Telem as the layer between agents and the long tail of web-search providers, with a unified request/response shape and a tracing pipeline that scores each search on relevance and diversity. The MVP must let a user (or an agent) pick one provider or query several concurrently, and let a developer open a run and tell, trace-by-trace, whether a bad agent outcome is a search-side problem, a reasoning-side problem, or a latency problem.

## Target Users

- Agent builders whose debugging time is dominated by "the answer is wrong, somewhere in the trajectory."
- Venture / research analysts (the poster's own use case) running due-diligence or people-search agents on third-party LLMs.
- Engineers integrating multiple web-search providers who want one caller and one observable shape, not N independent clients.

## MVP Scope

- A web-search / fetch router exposing the providers the poster named (Exa, Parallel, Tavily, Brave, Ceramic, Linkup, Seltz, You, SerpAPI), with a provider-agnostic request and a homogeneous response shape.
- Single-provider and fan-out (query-many-concurrently) modes returning merged, ranked results.
- A tracing layer that records every search (and sub-agent search) per run, with timestamps and per-trace metadata.
- A quality evaluator scoring each trace on relevance and diversity (the two metrics the poster names explicitly).
- A run inspector that surfaces, per agent run, which traces failed the quality bar and at what step the run derailed.
- The `curl docs.telem.ai/alpha_install.sh | sh` on-ramp kept working end-to-end after each release.
- Out of scope: a hosted SaaS tier, billing/quotas beyond a per-key free tier, and ingestion of non-search tool calls (the post is explicit that search is the scope).

## Design Direction

Design direction for the MVP at `https://news.ycombinator.com/item?id=49469804` follows the constraints in `3452-.../SPEC.md` and the chosen stack (TypeScript, Node.js, Fastify, OpenTelemetry). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the engineering reader who is debugging a runaway agent run.

For show-hn category, the defaults lean toward a documentation-first surface: cURL snippets are first-class, the trace inspector is reachable in two clicks from the landing, and no third-party tracking is added to the docs.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for traces that fail the relevance/diversity bar, one muted accent for healthy traces. No gradients in v1.

**Type** — one display family for run titles, one text family for body, one mono for trace JSON and curl snippets. Type scale is small (4 steps) so the run-inspector grid stays compact.

**Density** — tight, table-driven for the trace table; generous spacing for the install docs and the persona write-up.

**Motion** — minimal: explicit click-to-load on the trace inspector, no autoplay anywhere.

## Constraints

- Homogeneous response shape is a hard promise: every provider router call must return the same JSON contract regardless of upstream.
- Tracing must be cheap enough that an agent making hundreds of searches in one run does not blow the cost budget; per-trace overhead is a tracked number, not a vibe.
- The install path (`curl … | sh`) must remain a single command; multi-step installers are a launch blocker.
- Upstream provider outages must not take Telem down; per-provider circuit breaking and graceful degradation are required from day one.
- Provider API keys are sensitive; secret storage must not appear in trace payloads.
