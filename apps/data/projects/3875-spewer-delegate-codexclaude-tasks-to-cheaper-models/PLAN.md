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

## Tech Stack

Chosen for an interceptor that sits inside existing agent loops; the capture names no tooling.

- **Codex and Claude integration hooks:** CLI wrappers or API adapters.
- **Cheaper-model providers:** accessed through their APIs.
- **Routing rules engine:** task classification for delegate versus keep.
- **Cost ledger:** per-task savings recorded and reported.
- **Escalation fallback:** failed cheap runs return to the frontier model.

## Architecture

- **Intercept:** the task leaves the agent loop at a defined hook.
- **Classify:** a rule decides delegate versus keep.
- **Execute:** the cheaper model runs the task; results are verified.
- **Escalate:** failures return to the frontier model with the full context.

## Milestones

1. **M0 — One path.** A working delegation path from Codex or Claude to one cheaper model.
2. **M1 — Rules and ledger.** Per-task eligibility plus the cost ledger.
3. **M2 — Safety net.** Verification with auto-escalation on failure.
4. **M3 — Public release.** Savings benchmarks from real sessions are published.

## Risks

- **Quality regressions** erode trust in routing faster than savings build it.
- **Provider churn:** cheaper-model APIs change often.
- **Attribution:** when a task fails, is it the router's fault or the cheap model's?
