---
id: "354"
slug: the-problem-of-ai-agent-instability-and-regression-on-t
title: The problem of AI agent instability and regression on the path from prototype to stable product
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/bacfrvck91-the-problem-of-ai-agent-instability-and"
category: ai
date: "2025-10-29"
tags: [AI, Dev]
country: USA
tech: [Python (FastAPI) + TypeScript SDK, LangSmith / Langfuse (tracing), Postgres + eval store, GitHub Actions + nightly evals, OpenAI-compatible eval harness]
---
# The problem of AI agent instability and regression on the path from prototype to stable product

## Problem

A US AI team that has shipped a working prototype agent is hitting the same wall: small model or prompt changes cause 5-15% regression on real customer conversations, and the only signal is end-user complaints. The poster is a senior engineer who wants the path from a working prototype to a stable product to look like normal software engineering, not a prayer.

## Objective

Ship an AI-agent stability and regression platform that defines a versioned eval suite, runs it on every prompt / model / tool change, blocks a release on regression beyond a threshold, and produces a production-traffic diff that names the specific query class that regressed.

## Target Users

- US AI / agent startups shipping a working prototype toward a stable product.
- In-house AI platform teams at US enterprises whose internal agent is regressing after every model swap.
- AI consultancies that take a customer's prototype to production and need a regression gate for handoff.

## MVP Scope

- Versioned eval suite: customer-like queries with expected-tool-call graphs and known-good answers.
- CI gate: every prompt / model / tool change triggers the eval suite; regression beyond a threshold blocks merge.
- Production-traffic diff: weekly sampled runs against production traffic, with a per-query-class delta.
- Failure-cluster view: 'which query class regressed +15% this week' is a first-class answer.
- Stability scorecard per release: pass / fail with deltas vs. last green release.
- Hooks for LangChain / LangGraph / LlamaIndex / custom tool agents.
- No model training or fine-tuning in v1 - the platform ships evals only.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/ai/bacfrvck91-the-problem-of-ai-agent-instability-and` follows the constraints in `354-.../SPEC.md` and the chosen stack (Python (FastAPI) + TypeScript SDK, LangSmith / Langfuse (tracing), Postgres + eval store). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Eval suite versioned in git alongside the agent code; no out-of-tree eval definitions.
- Releases blocked at the threshold are unbypassable in CI without an explicit override signed by a senior engineer.
- Eval runs deterministic by default (seeded for stochastic models); nondeterminism flagged.
