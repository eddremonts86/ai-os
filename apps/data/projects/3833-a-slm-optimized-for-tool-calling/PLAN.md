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

## Tech Stack

Chosen for a single-purpose model whose product is schema-valid tool calls at metered cost.

- **Small language model tuned for tool calling:** a compact model specialized for intent-to-tool-call.
- **JSON schema decoding:** constrained output conforming to call schemas.
- **TrustedRouter hosting:** the stated serving and billing path.
- **Tool-call pipeline harness:** the fine-tuning and evaluation rig for tool-call quality.
- **Per-token metered API:** $0.01/$0.10 per million token pricing.
- **Router-side integration:** point tool-calling traffic at the model without rearchitecting.

## Architecture

- **Model:** the tuned SLM behind an inference endpoint.
- **Constrained decoder:** guarantees schema-valid tool calls.
- **TrustedRouter:** hosting, metering and access.
- **Harness:** evaluation against tool-call benchmarks and schema conformance suites.
- **Integration docs:** swap instructions for router users.

## Milestones

1. **M0 — Endpoint.** The SLM is live on TrustedRouter with schema-bound output.
2. **M1 — Pricing.** Metered at $0.01/$0.10 per million, per the post.
3. **M2 — Comparison.** Users can A/B the SLM against their current path on their own workloads.
4. **M3 — Evidence.** Published benchmark numbers that back the cost and latency claims.

## Risks

- **Claim risk:** no independent benchmark exists in the capture for the 70-90% savings.
- **Niche fit:** a one-task model needs a router that knows when to use it.
- **Channel dependence:** TrustedRouter is the only stated distribution.
- **Schema generality:** adherence on unseen schemas is the open test.
- **Commodity pressure:** frontier models keep getting cheaper, narrowing the cost gap.
