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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3654-conduct-open-source-guardrails-for-llm-and-mcp-tool-cal/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Define Pydantic schemas for the request (call surface, prompt/output, tool name and arguments) and the decision (allow/deny/redact/hold with rule identifiers)
- [ ] Implement the rule loader and the four-verb verdict engine with unit tests per verb
- [ ] Author the starter rule set: outbound network, filesystem writes outside an allowlist, secret patterns in arguments, shell invocation
- [ ] Build the FastAPI service with one endpoint per call surface and structured error responses
- [ ] Add SQLite-backed decision log and held-request store with redacted argument recording
- [ ] Wire the MCP server shim so an MCP host can register tools that route through the guardrail
- [ ] Build the operator console: recent decisions list, held-request approve/deny, rule-that-fired display
- [ ] Implement held-request expiry and escalation action, with an audit log entry on resolution
- [ ] Add a policy reload signal so rule updates ship without a redeploy, and document reload semantics for in-flight requests
- [ ] Publish a Docker image, a one-line install, and docs for policy authoring, custom rules, and the human-in-the-loop path
- [ ] Measure decision latency on the starter rule set and publish the number, since latency is a load-bearing claim of the synchronous chokepoint

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
