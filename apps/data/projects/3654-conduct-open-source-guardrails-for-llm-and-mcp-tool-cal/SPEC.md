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

## Problem

The capture for this plan is a link to a GitHub repository (https://github.com/sseshachala/conductai) and a title; there is no prose body in the capture, so the implementation details are unstated and have to be scoped honestly from the title alone.

The title fixes the boundary the project lives at: guardrails for LLM and MCP tool calls. That is the same problem space from two angles. On the direct-LLM side, applications that call a language model API and then act on the response need a check before the response turns into a write, a payment, an outbound message, or anything else irreversible. On the MCP side, the host that exposes tools to a model has to decide, for each tool invocation, whether the call is allowed by policy and whether the arguments are sane. The two share a structure: a request comes in, a decision is made against a policy, and either the call proceeds or it is rejected, redacted, or routed to a human. The capture does not say which side the project started on, which language it is written in, or how policy is authored, so this plan is scoped around the common shape and leaves room for either or both.

## Objective

Ship an open-source guardrail layer that any application or MCP host can put between an LLM (or an MCP tool call) and the action it would otherwise take, so that policy violations, dangerous arguments, and irreversible side effects are stopped or routed to a human instead of being executed silently.

## Target Users

- Application developers calling an LLM API whose response drives side effects (writes, payments, outbound messages) and who need a single chokepoint for policy.
- MCP host implementers who want a standard place to attach a tool-call policy without re-implementing it per host.
- Security and compliance reviewers who need to inspect and audit the guardrail decisions rather than trust an opaque prompt.
- Solo builders and small teams running agents who cannot afford a dedicated safety team but still need a check before destructive actions.
- Open-source contributors who want a small, inspectable policy engine they can extend with their own rules.

## MVP Scope

- A request schema that captures the inputs the policy engine sees: the prompt or model output (for direct-LLM use) and the tool name plus arguments (for MCP use).
- A pluggable rule engine that evaluates a request against a policy file and returns one of: allow, deny, redact, or require-human-approval.
- A built-in starter rule set covering the common cases: outbound network calls, filesystem writes outside an allowlist, secret exfiltration patterns, and shell invocation.
- Both call surfaces supported behind one engine: a thin FastAPI shim that an application calls before acting on a model response, and an MCP server shim a host can register tools against.
- A human-in-the-loop path that holds a deny/approval decision until an operator resolves it, surfaced through a small operator endpoint.
- Structured decision logs that record the rule that fired, the request that triggered it, and the verdict, in a format an auditor can read.
- A clear extension story: writing a custom rule is a small Python function, and the policy is a single config file.
- A minimal web console that lists recent decisions, lets an operator approve or reject held requests, and points at the rule that fired.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The capture is a URL plus a title with no implementation details, so anything not stated in the title (language, store, UI surface, exact rule syntax) is scoped as a plausible default and called out as a design choice rather than a fact.
- The guardrail must be a chokepoint, not a prompt instruction: a model cannot bypass it by writing the policy in its own output, and the rule engine must not accept free-form model text as policy.
- Decision latency has to be low enough to sit in a synchronous tool call path; a slow guardrail turns into a denial-of-service against the application that uses it.
- Human-approval holds must expire or escalate; an unanswered approval cannot block a tool call forever or the system silently degrades.
- Audit logs must record what was decided and why, but must not capture the raw secrets a request might touch; logging the request body verbatim can leak what the guardrail was supposed to protect.
- The MCP and direct-LLM surfaces must share the same rule definitions so a policy is written once and used in both places, rather than drifting into two engines.
- The project is open source and early, so the rule format has to be changeable without a data migration and the engine has to be readable by someone reviewing it for the first time.
