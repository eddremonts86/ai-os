---
id: "4201"
slug: decispher-persistent-engineering-context-and-memory-for
title: Decispher – persistent engineering context and memory for coding agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509142"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Decispher – persistent engineering context and memory for coding agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Decispher is the persistent engineering context and memory layer for coding agents: it combines previous PRs, Jira, Slack, ownership and ADRs into retrievable context, gives every project a memory set, and ships a Worker Agent that asks humans when context is missing — backed by 89% accuracy on LongMemEval oracle split, 81% on LongMemEval-S and 38x median token reduction.

**One-liner:** A persistent context and memory layer so coding agents stop re-deriving the same engineering context.

## Target Users

Engineering organisations using Claude, Codex, Grok Build, Cursor or any MCP-compatible agent who have context scattered across PRs, Jira, Slack and ADRs. Adjacent: platform teams that maintain agent infrastructure and want to standardise context for the whole org.

## Jobs To Be Done

- When an agent works on a feature, I want it to pull previous PRs, Jira and Slack context so it does not re-discover it.
- When an agent hits missing context, I want it to ask a human so I do not get a confident-but-wrong answer.
- When my project has its own conventions, I want a memory set so the agent follows them.
- When an agent session ends, I want a structured handoff on the PR (prompt → plan → actions → result) so reviewers see the trail.

## Success Metrics

- Reported LongMemEval numbers: 89% on oracle, 81% on -S, 38x median token reduction (vs. the model's retrieval without Decispher).
- Engineering organisations onboarded.
- Context units retrieved per task and the share of tasks resolved without re-prompting the human.
- Worker Agent sandbox incidents (target: zero outbound leaks).
- Retention of decrypted sessions: 7 days post-merge / 30 days inactivity.

## Pricing & Monetization

Source does not state pricing, plans, or a free tier. Treat pricing as undefined until the author publishes details.

## Competitive Landscape

Closely related are coding-agent memory tools (Mem0, Letta, agent RAG stacks) and engineering wikis. Decispher's differentiator is the unified Context Engine + Memory Plane + Worker Agent combination with measured LongMemEval numbers (89% / 81% / 38x token reduction) and the explicit security/sandbox posture.

## Risks & Open Questions

- Privacy and security posture is a hard sell; mitigation is the documented sandbox + encryption + purge guarantees.
- Integration churn: GitHub/Jira/Slack APIs change; mitigation is to keep each adapter behind a thin layer.
- LongMemEval results are part of the marketing surface; mitigation is to publish the eval harness so reviewers can reproduce.
- Pricing is undefined; mitigation is to announce plans before scaling sales.
