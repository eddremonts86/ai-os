---
id: "3654"
slug: conduct-open-source-guardrails-for-llm-and-mcp-tool-cal
title: "Conduct, open-source guardrails for LLM and MCP tool calls"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483173"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python, FastAPI, Pydantic, SQLite, OpenAI Python SDK, MCP Python SDK, Docker]
---
# Conduct, open-source guardrails for LLM and MCP tool calls

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Conduct is an open-source guardrail layer that sits between an LLM (or an MCP tool call) and the action it would otherwise take. Instead of relying on the model to refuse dangerous behavior, the guardrail evaluates every request against an explicit policy and returns allow, deny, redact, or require-human-approval before anything irreversible happens.

The same engine covers both call surfaces. A Python application calling an LLM API can route the response through the guardrail before acting on it. An MCP host can register its tools with the guardrail server and let it sit in front of every tool invocation. A policy is a single config file with rules a reviewer can read; a custom rule is a small Python function; decisions are logged in a structured form an auditor can inspect.

**One-liner:** Conduct sits between an LLM and the side effect it would otherwise take, so every dangerous tool call is decided by a policy a human can read rather than by the model that wants to make it.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Application developers wiring LLMs into side-effectful actions | One chokepoint for policy that runs even if the model itself is compromised or confused. |
| MCP host implementers | A standard place to attach tool-call policy without re-implementing it per host. |
| Security and compliance reviewers | Decisions are logged with the rule that fired, so the audit story is the log itself rather than a trust-the-prompt story. |
| Solo builders running agents | A small, inspectable engine they can read end to end before trusting it in front of an action. |
| Open-source contributors | Custom rules are small Python functions; the policy is one file, so extension is a low-friction PR. |

## Jobs To Be Done

1. **Functional job** — Stop dangerous LLM-driven actions before they execute, using an explicit policy rather than a prompt instruction.
2. **Functional job** — Apply the same policy to MCP tool calls so an MCP host does not need its own ad hoc check.
3. **Functional job** — Route borderline requests to a human who can approve or reject them in a small console, instead of either silently allowing or silently blocking.
4. **Emotional job** — Trust an agent in front of an irreversible action because the guardrail is something a reviewer can read, not a promise the model made.
5. **Social job** — Demonstrate to security-conscious customers that the system has a policy layer independent of the model.

## Success Metrics

- **Rule hit rate** — share of decisions resolved by an explicit rule rather than falling through to a default, since every important call should map to a named policy.
- **False-deny rate** — share of human-reviewed requests the operator ultimately approves, which signals whether the rules are too strict or too loose.
- **Decision latency** — median and tail latency of a guardrail decision in the synchronous tool-call path; a slow guardrail breaks the application behind it.
- **Bypass attempts blocked** — count of requests the guardrail caught where the model tried to override policy in its own output, the headline metric of the chokepoint design.
- **Held-request ageing** — distribution of time-to-resolution for human approvals, with alerts on any held request older than the configured escalation window.
- **Audit log completeness** — share of decisions with a logged rule identifier and verdict, since an incomplete log breaks the compliance story.

## Pricing & Monetization

The capture names no price, no tier and no hosted plan; it is an open-source project shared for review. The architecture fixes only the cost shape: cost scales with the volume of decisions the guardrail evaluates, not with the number of users behind it, and any future hosted offering would have to be priced per evaluated request rather than per seat, because the seat is on the application side and is invisible to the guardrail.

## Competitive Landscape

- **Prompt-level safety and refusals in the model itself** — the obvious alternative and the one the project is explicitly a check against, because prompt-level safety can be bypassed by the model and is opaque to the operator.
- **Hosted guardrail services** — commercial offerings in the same space; not named in the capture, so the comparison is structural rather than named, and the differentiator here is open source and self-hostable.
- **Hand-rolled checks inside each application** — what most teams do today; the cost is duplicated policy logic across services and no central audit trail.

The capture names no competitor, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm whether the first-call surface is direct-LLM, MCP, or both, since the title names both but the capture does not pick a starting point.
- [ ] Decide the policy file format: declarative YAML/JSON rules, Python functions, or both, and document which to reach for.
- [ ] Define the held-request lifecycle: how long a human approval sits before it escalates, and where the escalation goes.
- [ ] Specify what is and is not logged: rule identifier and verdict yes, raw secrets and prompt text probably no, and the line has to be drawn explicitly.
- [ ] Measure decision latency in the synchronous path before claiming the guardrail can sit in front of a tool call without making the tool unusable.
- [ ] Decide how rule updates ship: a policy reload without a restart, a versioned policy file, or a redeploy, since rules will change often.
