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

## Problem

The capture is only the GitHub URL and the title. The title is "Consequence Gate – agent governance based on what being wrong costs", which carries the entire design idea. The repository URL is github.com/zilianglab/consequence-gate and there is no prose body in the capture beyond the title and the URL.

The title's design idea is concrete. Where most agent governance is a fixed permission list — the agent can do X, cannot do Y — Consequence Gate proposes that the agent's actions are gated by the cost of being wrong rather than by a static allowlist. An action that is cheap to reverse (a draft email, a local file write to a scratch directory) is allowed freely. An action that is expensive or irreversible (a public post, a database delete, a wire transfer) requires a more expensive approval — by the operator, by a higher-cost model, or by a stated review step — calibrated to the consequence of being wrong.

The interesting engineering claim is that the consequence is a first-class input to the gate. A permission list does not say "this is allowed because it is cheap"; a consequence gate does. The capture has no further detail: no schema for actions, no cost model, no review flow, no deployment surface, no language binding. Those are honest gaps, and the plan scopes what is knowable from the title and from general engineering knowledge of agent governance, not from anything the author said.

## Objective

Ship an agent-governance library, named Consequence Gate, that gates an agent's actions by the cost of being wrong rather than by a fixed permission list. An action that is cheap to reverse is allowed cheaply, and an action that is expensive or irreversible is escalated to a more expensive approval calibrated to its consequence. The cost is the gate, not a side input.

## Target Users

- Agent developers who do not want a brittle allowlist and who already understand that the cost of an action depends on context, not on its name.
- Safety-conscious teams running agents in production who need a way to say "this action is allowed because it is cheap, that action requires review because it is expensive".
- Solo developers running coding agents who want one library that escalates risky actions to themselves and lets the cheap ones pass.
- Multi-agent teams that need a shared gate with a consistent escalation policy across agents.
- Researchers who want a typed, inspectable cost model rather than a hidden prompt.

## MVP Scope

- A library with a single decorator or wrapper that gates an agent action by a stated consequence level.
- A consequence schema that takes the action's reversibility, blast radius, target and side effects as inputs and returns a stated cost.
- An escalation policy that maps a cost to one of: allow, log, require a stated reviewer, require a second model, or block.
- A reviewer interface that delivers a pending action to the operator with the cost, the proposed payload and an approve-or-reject control.
- A second-model interface that can be called with the same action and a budgeted token cost.
- An audit log that records every gated action with the consequence, the policy decision and the resolution.
- A typed contract so the library can be embedded in Python or TypeScript agent code without string-typed dispatch.
- A test suite that proves the gate fails closed when the consequence cannot be computed, rather than silently allowing the action.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Consequence is the gate, not a side input: the policy decision is a function of the cost of being wrong, and a fixed permission list is not a substitute.
- The library must fail closed when the consequence cannot be computed. An action with an unknown cost is not implicitly allowed; it is escalated.
- The gate must be inspectable: every decision is logged with the consequence, the policy and the resolution, so a reviewer can replay it later.
- A reviewer must see the proposed payload and the cost, not only the action name, since the cost is the unit the policy operates on.
- The capture has no schema, no language binding, no deployment surface and no example, so anything beyond what the title promises is not claimed here.
