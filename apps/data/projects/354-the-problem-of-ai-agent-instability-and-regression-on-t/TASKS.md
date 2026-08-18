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

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/ai/bacfrvck91-the-problem-of-ai-agent-instability-and` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/354-the-problem-of-ai-agent-instability-and-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python (FastAPI) + TypeScript SDK, LangSmith / Langfuse (tracing), Postgres + eval store, and confirm versions resolve in CI.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: USA`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for USA.
- [ ] Set up the LLM provider abstraction (rate-limit, fallback model, prompt cache) and the eval harness for the {country}-relevant test cases.
## Phase 1: Core

- [ ] Versioned eval suite in git: 200 customer-like queries per agent with expected tool-call graph
- [ ] CI gate: every prompt / model / tool change runs the eval suite; threshold blocks merge
- [ ] Production-traffic diff: weekly sampled runs with per-query-class delta
- [ ] Failure-cluster view: query class + delta is a first-class answer
- [ ] Stability scorecard per release (pass/fail + deltas vs. last green)
- [ ] Hooks for LangChain / LangGraph / LlamaIndex / custom tool agents
- [ ] Pilot with 8 US AI startups across 90 days; mean time-to-detect tracked

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python (FastAPI) + TypeScript SDK, LangSmith / Langfuse (tracing), Postgres + eval store) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 354-the-problem-of-ai-agent-instability MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python (FastAPI) + TypeScript SDK, LangSmith / Langfuse (tracing), Postgres + eval store errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
