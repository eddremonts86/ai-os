---
id: "3797"
slug: ai-harness-that-lets-a-graph-of-codex-and-claude-interc
title: AI Harness that lets a graph of Codex and Claude intercommunicate
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49492155"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Agent fleet orchestration, graph-based agent topologies, budget-constrained loop engine, MCP tunnelling, secret reduction layer, Slack/WhatsApp connectors]
---
# AI Harness that lets a graph of Codex and Claude intercommunicate

## Tech Stack

Chosen for the seven capabilities the post lists; the post names no implementation stack, so these are the capability surfaces.

- **Agent fleet orchestration:** the runtime that spawns and connects Codex/Claude agents into hierarchical graphs.
- **Graph-based agent topologies:** the CEO → managers → workers structure and the 15 Graph Engineering patterns as first-class configuration.
- **Budget-constrained loop engine (Leash):** goal + budget accounting that stops a run at the limit and emits findings for the next run.
- **MCP tunnelling:** endpoints shared between agents without publishing REST APIs.
- **Secret reduction layer:** automatic obscuring so secrets stay local and never reach agent context.
- **Slack/WhatsApp connectors:** the assistant-facing channels for using the harness like an OpenClaw-style assistant.

## Architecture

- **Graph layer:** agent nodes connected by message channels; the user interacts with the CEO node only.
- **Board layer:** a shared, slack-like Agent Board where agents post progress; both humans and the harness read it.
- **Loop layer:** Leash wraps a goal with a budget; runs finish under budget or emit findings and a prepared next run.
- **Transport layer:** MCP tunnelling brokers endpoint access between agents without exposing REST APIs.
- **Trust layer:** the secret-reduction pipeline scrubs credentials before anything reaches an agent.

## Milestones

1. **M0 — Fleet core.** Two-level agent graph with inter-agent messaging and user-to-CEO interaction.
2. **M1 — Visibility.** The Agent Board carries slack-like progress from a fleet of Claude agents.
3. **M2 — Budget loops.** Leash enforces a stated budget (the $5 example) and produces findings + next-run prep on failure.
4. **M3 — Trust and reach.** Secret reduction proven by audit; MCP tunnelling and Slack/WhatsApp access land.

## Risks

- **Secret-leak liability:** the flagship trust feature must be verifiable, not asserted; one leak kills the product's reason to exist.
- **Coordination overhead:** deep hierarchies can burn more tokens coordinating than working; the harness must make depth optional.
- **Budget accounting gaps:** stopping at $5 requires accurate per-action costing across two vendors (Codex and Claude).
- **Unverifiable claims:** the 15 patterns and the white paper are asserted, not linked; the plan must treat them as claims to reproduce.
- **No distribution story:** the post has no URL, repo or install path; everything downstream assumes the project is reachable somewhere.
