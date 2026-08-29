---
id: "3649"
slug: consequence-gate-agent-governance-based-on-what-being-w
title: Consequence Gate – agent governance based on what being wrong costs
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483616"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python, FastAPI, Pydantic, SQLite, PostgreSQL, Anthropic API, OpenAI API, Docker]
---
# Consequence Gate – agent governance based on what being wrong costs

## Tech Stack

- **Python with FastAPI** as the reference implementation and the reviewer service, because the agent ecosystem is heavily Python and the reviewer surface is a small HTTP service.
- **Pydantic** for the consequence schema and the action envelope, because the cost is a typed contract and the policy must operate on typed data.
- **SQLite** as the default audit store, so the smallest deployment is one process and one file.
- **PostgreSQL** for multi-instance deployments where the reviewer queue is shared.
- **Anthropic API and OpenAI API** as pluggable second-model providers, because the second-model escalation is a stated budgeted call rather than a hard-coded model.
- **Docker** for the reviewer service image, because the service is stateless apart from the audit store and is the natural unit of deployment.
- **No deploy target beyond the reviewer service** — the library itself is consumed in-process by the host agent code.

## Architecture

An agent action is wrapped at the call site. The wrapper takes the action's name, its payload, and a stated consequence object — reversibility, blast radius, target and side effects — and passes it to the gate. The gate computes a cost from the consequence and the policy, and returns one of: allow, log, escalate to reviewer, escalate to second model, block.

The reviewer is an HTTP service. When the gate escalates, it writes a pending record carrying the cost and the proposed payload, and surfaces it to the operator through a small web UI. The operator approves or rejects, and the gate returns the decision to the waiting agent. The second-model escalation calls a pluggable model provider with a budgeted token cost, returns the model's approve-or-reject, and logs the call.

The audit store is a write-once log of every gated action. Each row carries the consequence, the policy decision, the escalation path, the resolution and the time-to-decision. The store is the library's evidence that the gate is doing what it claims, and is what the reviewer replays.

Fail-closed is enforced in the gate itself. If the consequence cannot be computed, the gate escalates. If the reviewer service is unreachable on an action that requires a reviewer, the gate blocks. An action with unknown cost is not an action with implicit permission.

## Milestones

1. **M1 — Consequence schema** — a typed consequence object and a cost function over reversibility, blast radius, target and side effects.
2. **M2 — Gate** — a wrapper that returns one of allow, log, escalate-to-reviewer, escalate-to-second-model, block.
3. **M3 — Reviewer service** — pending queue with the cost, the payload and an approve-or-reject control.
4. **M4 — Second-model escalation** — pluggable provider with a budgeted token cost.
5. **M5 — Audit store** — SQLite by default, PostgreSQL for multi-instance, with a replay view.
6. **M6 — Fail-closed tests** — a test suite that proves the gate escalates or blocks on every failure path, not allows.

## Risks

- **Cost miscalibration** — a cost function that over-escalates defeats the library and a cost function that under-escalates defeats the purpose; calibration is a real product-quality problem.
- **Unknown consequence** — actions whose consequence cannot be computed must fail closed, and a gate that silently allows them is the worst possible failure mode.
- **Reviewer fatigue** — a reviewer queue that grows unbounded will be ignored; the gate must surface the important ones, not all of them.
- **Second-model collusion** — a second model trained on the same surface as the agent can agree with the agent's bad idea; the escalation is a budgeted call, not a guarantee.
- **Audit-store tampering** — an audit log that the agent can edit is not an audit log; the store must be write-once from the agent's perspective.
- **Embedding friction** — a library that requires a fork of the host agent framework will not be adopted; the embedding surface must be a decorator or a wrapper, not a re-architecture.
