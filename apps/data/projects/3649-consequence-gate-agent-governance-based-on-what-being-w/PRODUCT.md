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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Consequence Gate is an agent-governance library that gates an agent's actions by the cost of being wrong rather than by a fixed permission list. An action that is cheap to reverse is allowed cheaply, and an action that is expensive or irreversible is escalated to a more expensive approval calibrated to its consequence. The cost is the gate itself.

The point of the design is that the consequence is a first-class input. A permission list does not say "this is allowed because it is cheap"; Consequence Gate does. The library records every decision with the consequence, the policy and the resolution so a reviewer can replay it later.

**One-liner:** Consequence Gate gates agent actions by the cost of being wrong — cheap actions pass cheaply, expensive actions escalate to a reviewer or a second model, and the consequence is logged on every decision.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Agent developers | They do not want a brittle allowlist and want the gate to track consequence, not name. |
| Safety-conscious production teams | They want a single library that says why an action was escalated, not only that it was. |
| Solo developers with coding agents | They want the cheap actions to pass and the expensive ones to come to them. |
| Multi-agent teams | They want one consistent escalation policy across every agent they run. |
| Researchers | They want a typed cost model that is inspectable and replayable, not a hidden prompt. |

## Jobs To Be Done

1. **Functional job** — Allow a cheap reversible action without an approval, in one line of code.
2. **Functional job** — Escalate an expensive action to a reviewer with the cost, the payload and an approve-or-reject control.
3. **Functional job** — Escalate to a second model with a budgeted token cost when a reviewer is the wrong escalation.
4. **Functional job** — Audit every gated action with the consequence, the policy and the resolution.
5. **Emotional job** — Stop wondering whether a permission list is actually catching the dangerous actions.
6. **Social job** — Demonstrate that an agent's autonomy can be calibrated by consequence rather than by fear.

## Success Metrics

- **Escalation precision** — share of escalated actions that the operator agrees should have been escalated; over-escalation defeats the library, under-escalation defeats the purpose.
- **Decision latency** — time from an action being proposed to the gate returning its decision, since a slow gate stalls the agent.
- **Audit completeness** — share of gated actions that have a logged consequence, policy decision and resolution.
- **Fail-closed behaviour** — share of actions with unknown consequence that escalate rather than allow.
- **Reviewer throughput** — pending actions per reviewer per hour, since a reviewer queue that grows unbounded is a UX failure.
- **Library footprint** — number of agent frameworks the library can be embedded in without a fork, since the value is the policy, not the host.

## Pricing & Monetization

The post names no price, no tier and no business model. The architecture fixes a specific cost shape regardless: the second-model escalation is per-call and per-token, the reviewer service is per-host, and the audit store scales with action volume. Any future monetisation would therefore be either a hosted reviewer service with per-action usage or an enterprise license for on-prem, never a per-developer seat fee, because the seat count is not what consumes cost.

## Competitive Landscape

- **Permission-list agent sandboxes** — gate by name rather than by consequence; the title positions explicitly against this category.
- **Approval-workflow products** — gate at the action level but treat every action as requiring review rather than calibrating the review to the cost of being wrong.
- **Hosted agent platforms with built-in policies** — provide a default policy but do not expose the cost as a first-class input the operator can reason about.
- **Open-source agent harnesses** — flexible but require the operator to write the governance layer themselves; the post names none specifically, and no competitor is named in the capture, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Calibrate the cost function against a representative sample of agent actions before claiming the gate is doing useful work.
- [ ] Establish the failure path for an action whose consequence cannot be computed, because the gate must escalate rather than allow.
- [ ] Decide the reviewer queue's bound, because a queue that grows unbounded will be ignored.
- [ ] Verify the second-model escalation is budgeted and logged, so the call cannot be hidden inside the policy.
- [ ] Document the embedding surface so the library drops into common agent frameworks as a decorator, not a re-architecture.
- [ ] Confirm the audit store is write-once from the agent's perspective, because an editable audit log is not an audit log.
