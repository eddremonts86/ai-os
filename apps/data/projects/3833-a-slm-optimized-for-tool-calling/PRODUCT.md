---
id: "3833"
slug: a-slm-optimized-for-tool-calling
title: A SLM Optimized for Tool Calling
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493085"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Small language model tuned for tool calling, JSON schema decoding, TrustedRouter hosting, tool-call pipeline harness, per-token metered API, router-side integration]
---
# A SLM Optimized for Tool Calling

## Value Proposition

Stop paying frontier prices for a narrow task. Neurometric's SLM turns intent into valid, schema-bound tool calls and nothing else — priced at $0.01 per million input and $0.10 per million output tokens on TrustedRouter. The pitch: context accumulation is 80-90% of agent spend, and moving tool selection onto a small tuned model drops cost per turn by 70-90% while cutting the latency of multi-step agents.

**One-liner:** A cheap SLM that turns intent into valid, schema-bound tool calls — $0.01/M input, $0.10/M output on TrustedRouter.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Agent builders | Frontier-priced tool selection replaced by a model that costs cents. |
| TrustedRouter users | A drop-in route for tool-calling traffic. |
| Latency-sensitive teams | Shorter time-to-first-token on every orchestration hop. |

The post's audience is teams whose agent loops re-send tool definitions and outputs every turn.

## Jobs To Be Done

1. **Functional job** — Convert natural-language intent into valid, schema-bound tool calls.
2. **Functional job** — Cut the biggest cost line in agent loops: context accumulation on every turn.
3. **Functional job** — Reduce inter-call latency in multi-step agents.
4. **Functional job** — Produce fewer malformed calls, avoiding retry overhead.

## Success Metrics

- **Cost per turn:** down 70-90% versus the frontier path (the vendor's stated claim).
- **Schema adherence:** fewer malformed or hallucinated-parameter calls than general models.
- **Latency:** faster time-to-first-token per tool-selection hop.
- **Adopted routes:** share of a customer's tool-calling traffic pointed at the SLM.

## Pricing & Monetization

Stated by the linked post: $0.01 per million input tokens, $0.10 per million output tokens, served through TrustedRouter. The capture itself names no price.

## Competitive Landscape

The post does not name competitors, but positions against "frontier-model prices" for tool selection. The product sits in the specialized small-model category — task-specific SLMs for structured sub-tasks inside agent loops — where the claimed differentiators are schema-bound output, metered cents-level pricing and single-purpose tuning.

## Risks & Open Questions

- [ ] All performance figures (80-90% spend, 70-90% savings) are vendor claims with no independent benchmark in the capture.
- [ ] A tool-calling-only model cannot handle ambiguity the way a frontier model can; routing logic decides when it applies.
- [ ] The model depends on TrustedRouter as its only stated distribution channel.
- [ ] Schema adherence claims need real workload evidence across schemas, not just fine-tuning intent.
- [ ] Small models compress general knowledge; tool selection on out-of-domain intents may degrade.
