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

## Problem

The poster built Rysh (Apache 2.0 licence) because running a single agent is no longer the bottleneck — coordinating many of them is. His post lists seven capabilities that answer that problem. Fleets: build a graph of agents that communicate (his example topology is "CEO -> 5 Managers -> 20 Worker Agents"), where the user talks to the CEO agent and it coordinates managers, who coordinate workers. Claude fleets: agents that message each other and write a shared "Agent Board" so progress is visible as slack-like messages. Graph engineering: a published white paper with 15 Graph Engineering patterns, all implementable in Rysh. Loop engineering via "Leash": define a goal and a budget (his example is $5) and the loop tries to finish before consuming it; if it cannot, it writes up findings and prepares the next run to await a new budget. MCP tunnelling hides REST APIs so agents can share endpoints without publishing them. It can be used as an assistant "like OpenClaw" through Slack and WhatsApp. And automatic secret reduction keeps secrets local and obscured so they never reach the AI agents. The post asks for feedback and names no pricing, no hosting model and no specific models beyond Codex and Claude in the title.

## Objective

Ship an agent harness where multi-agent coordination is the default, not the exception: fleets with hierarchical topology, a visible Agent Board, budget-bounded loops, and secret hygiene as a built-in property. The MVP is the fleet + board + Leash budget loop + secret reduction on real tasks.

## Target Users

- Developers orchestrating many coding agents (Codex and Claude named in the title) who need coordination and visibility.
- Teams that want agent work tracked on a shared board instead of hidden in terminals.
- Cost-conscious users who want goals bounded by an explicit budget (the $5 example) before agents run.
- Assistant users who want to reach their agents through Slack or WhatsApp rather than a CLI.

## MVP Scope

- Fleet construction: hierarchical agent graphs (the CEO → managers → workers pattern) with inter-agent messaging.
- Agent Board: slack-like progress messages from a fleet of Claude agents.
- Graph Engineering patterns: the 15 patterns from the white paper runnable in the harness.
- Leash loops: goal + budget; finish or write findings and prepare the next run.
- MCP tunnelling: share agent endpoints without publishing REST APIs.
- Slack/WhatsApp access as an assistant, and automatic secret reduction so secrets stay local and obscured.

## Constraints

- Secret reduction is a hard promise: secrets never reach the AI agents; they stay local and obscured. Any feature that leaks them breaks the product's core claim.
- Budget-bounded loops must actually stop at the budget — the Leash behavior is the differentiator, not a suggestion.
- The white paper's 15 patterns are part of the stated scope; the MVP must support them, not just the fleet topology.
- Apache 2.0 licence; the post names no hosting or pricing, so the MVP assumes self-hosted, unmonetized distribution.
