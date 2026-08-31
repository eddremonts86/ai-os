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

## Value Proposition

Delegate the Codex and Claude tasks that do not need frontier models to cheaper ones — and see exactly what you saved. The value is budget control without abandoning the frontier loop: routine work runs cheap, hard work stays expensive, and the cost ledger makes the trade-off visible per task. The capture is a bare link, so the mechanism described here is the title's promise, not a verified design.

**One-liner:** Delegate the Codex/Claude tasks that don't need frontier models to cheaper ones — and see what you saved.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Cost-conscious developers | Cut agent bills without abandoning the frontier loop. |
| Agent-heavy teams | Per-task routing policies instead of flat model choices. |
| Infra tinkerers | A pluggable delegation layer for coding agents. |

The capture names no segments; the rows follow from the title's claim.

## Jobs To Be Done

1. **Functional job** — Route a coding-agent task to a cheaper model.
2. **Functional job** — Decide eligibility per task by a stated rule.
3. **Functional job** — Report the cost saved per delegated task.
4. **Emotional job** — Stay on budget without feeling the quality drop.

## Success Metrics

- **Delegation share:** tasks delegated versus kept on the frontier model.
- **Savings:** cost saved per session and per task versus the baseline.
- **Success parity:** delegated tasks that still pass their checks.
- **Escalation rate:** cheap-model tasks that get sent back up to a frontier model.

## Pricing & Monetization

None stated. The capture is a bare repository link with no commercial terms.

## Competitive Landscape

The post names no competitors. The category is LLM routing and cost-tiering middleware for coding agents — model routers that upgrade or downgrade per task. Spewer's claimed angle inside it is delegation specifically out of Codex and Claude agent loops rather than a generic API gateway.

## Risks & Open Questions

- [ ] Bare-link capture: no routing policy or cheaper-model targets are stated.
- [ ] Delegation errors are expensive: a cheaper model breaking a task erases the savings.
- [ ] Codex and Claude surfaces change; integrations need constant upkeep.
- [ ] Quality perception: users may distrust any cheaper-model substitution.
