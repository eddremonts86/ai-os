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

## Tech Stack

- Python (FastAPI) + TypeScript SDK
- LangSmith / Langfuse (tracing)
- Postgres + eval store
- GitHub Actions + nightly evals
- OpenAI-compatible eval harness

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for ai runs as a single backend service on the stack (Python (FastAPI) + TypeScript SDK, LangSmith / Langfuse (tracing), Postgres + eval store) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/ai/bacfrvck91-the-problem-of-ai-agent-instability-and` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in USA, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Python (FastAPI) + TypeScript SDK, LangSmith / Langfuse (tracing), Postgres + eval store) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For USA, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/ai/bacfrvck91-the-problem-of-ai-agent-instability-and`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`354-the-problem-of-ai-agent-instability`), pin dependencies for Python (FastAPI) + TypeScript SDK, LangSmith / Langfuse (tracing), Postgres + eval store, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/ai/bacfrvck91-the-problem-of-ai-agent-instability-and` with no feature creep. A single user from USA can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for USA, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from USA test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Eval-suite authoring cost.** Writing good evals is labour-intensive; a starter eval suite per vertical is mandatory and contractually bounded.
- **Threshold calibration.** An over-tight threshold blocks shipping; an over-loose threshold misses regressions. Threshold tuning per agent is a coaching engagement.
- **Non-determinism.** Stochastic models make run-to-run variance a real confound; the platform reports variance alongside score and gates on deltas, not absolutes.
