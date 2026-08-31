---
id: "3875"
slug: spewer-delegate-codexclaude-tasks-to-cheaper-models
title: Spewer – Delegate Codex/Claude tasks to cheaper models
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499265"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Model routing, Codex CLI integration, Claude Code integration, Task classification rules, Cost ledger, Escalation fallback]
---
# Spewer – Delegate Codex/Claude tasks to cheaper models

## Problem

This Show HN capture is a bare link to github.com/modiqo/spewer; the product claim is the title: "Spewer – Delegate Codex/Claude tasks to cheaper models". Spewer is presented as a tool that takes work otherwise sent to expensive coding agents — OpenAI Codex and Claude — and delegates it to cheaper models: the classic cost-cutting move of routing the parts of an agent's workload that do not need frontier reasoning to smaller or lower-priced models. The capture states nothing about how delegation decisions are made, which cheaper models are targeted, or how the agent loop is preserved.

## Objective

Build the claimed router: a delegation layer that intercepts Codex and Claude coding-agent tasks and sends suitable ones to cheaper models, with transparent per-task routing decisions and cost reporting. The MVP is one concrete delegation path working end to end.

## Target Users

- Developers whose Codex and Claude bills are material.
- Teams running many agent sessions where cost per task matters.
- Tooling builders experimenting with model tiering for coding agents.

## MVP Scope

- A delegation path from a Codex or Claude task to a cheaper model.
- A routing rule that decides which tasks are eligible.
- Cost tracking: what was saved per delegated task.
- One CLI or workflow integration users can actually run.

## Constraints

- The capture is a bare repo link; the routing mechanism and cheaper-model targets are unstated.
- Quality is the counterweight: delegation must not silently degrade task outcomes.
- The MVP must name one concrete integration (Codex or Claude) rather than claiming both at once.

## Design Direction

See `DESIGN.md` for this project's design tokens.
