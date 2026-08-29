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

## Tech Stack

- **Python with FastAPI** for the guardrail service itself, because the policy rules are most naturally small Python functions and the type of a request (prompt + tool call + metadata) maps cleanly onto Pydantic.
- **Pydantic** for the request and decision schemas, so the boundary between caller and engine is typed and a malformed request fails before a rule runs.
- **SQLite** for the audit log and held-request store in the default single-instance deployment, so the smallest useful install is one binary and one file.
- **OpenAI Python SDK and MCP Python SDK** on the call surface side, so a caller can either invoke the guardrail directly or register tools through an MCP shim without writing a new integration.
- **Docker** for the published image and reproducible deploys, since the project will be installed by other people and an install story is part of being open source.
- **A small static-site operator console** for approvals and decision history, served by the same FastAPI process so the deploy story is one container rather than three.

## Architecture

A request enters the engine with three parts: an identifier for the call surface (direct-LLM or MCP), the prompt or model output to evaluate (for the direct-LLM path), and the tool name and arguments (for the MCP path). Pydantic validates the shape up front, so a malformed request fails before a rule runs and the caller gets a structured error back rather than a stack trace.

The rule engine loads a policy file at startup and optionally re-reads it on a signal, so a policy update is a config change rather than a redeploy. Each rule is a small function that takes the validated request and returns one of allow, deny, redact, or require-human-approval, with a rule identifier attached so the decision log can record which rule fired. The starter rule set covers the common cases: outbound network calls, filesystem writes outside an allowlist, secret patterns in arguments, and shell invocation. Custom rules are user-defined Python functions the engine imports, which keeps the extension surface narrow.

Decisions that come back as require-human-approval are held in the SQLite store with an expiry timestamp and surfaced through the operator console. An operator sees the held request, the rule that triggered it, and the arguments; they approve or deny; the verdict and the operator identity are written to the log. Expired holds escalate (the capture does not specify where, so the plan keeps this as an open question and ships with a configurable action: drop, allow-default, or page a webhook).

Decision logs are written for every call, including allowed ones, so the audit story is a single readable stream. The log records the call surface, the rule identifiers that ran, the verdict, the operator who resolved a held request (if any), and a redacted form of the arguments so secrets are not persisted. Latency is dominated by rule execution, which is intentionally cheap; the engine is designed to sit in a synchronous tool-call path and returns in milliseconds for the built-in rule set.

## Milestones

1. **M1 — Schemas and rule engine** — Pydantic request/decision models, a rule loader, and the four-verb verdict (allow, deny, redact, hold), with unit tests per verdict.
2. **M2 — Starter rule set** — outbound network, filesystem writes, secret patterns, and shell invocation, each as one small function with a test fixture.
3. **M3 — FastAPI service** — one endpoint per call surface, Pydantic-validated input, structured error responses, and structured decision logs to SQLite.
4. **M4 — MCP shim** — an MCP server that registers tools and routes every invocation through the guardrail, using the same rule definitions.
5. **M5 — Operator console** — a minimal UI served by the same process that lists recent decisions, lets an operator resolve held requests, and exposes the rule that fired.
6. **M6 — Held-request lifecycle** — configurable expiry, escalation action, and an audit log entry for the resolution path.
7. **M7 — Distribution** — a Docker image, a one-line install, and docs covering policy authoring, custom rules, and the human-in-the-loop path.

## Risks

- **Guardrail bypass via model output** — a model that writes its own policy in a free-form field would be a direct defeat of the chokepoint, so the engine must treat prompt text as data and never as policy.
- **Latency in the synchronous path** — a slow guardrail turns into a denial-of-service against the caller, so rule execution time has to be measured and bounded before claims about sitting in front of a tool call.
- **Held-request pile-up** — unanswered approvals block real work, so expiry and escalation have to be configurable and observable rather than left as defaults.
- **Secret leakage in logs** — logging the raw request verbatim captures what the guardrail was supposed to protect, so the log format has to redact secrets by construction rather than by convention.
- **Rule drift across call surfaces** — a rule that exists for the direct-LLM path but not the MCP path is a hole, so both surfaces have to share the same registry and the same tests.
- **Policy reload correctness** — reloading a policy mid-flight changes what a held request was decided against, so reload semantics (which rules apply to a request already in flight) have to be defined.
