---
id: "3795"
slug: stop-that-shit-a-guard-against-unrequested-hashes-from-
title: Stop That Shit – a guard against unrequested hashes from coding agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49492705"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Coding-agent hooks, advisory skill layer, host adapters (Codex/Claude Code/OpenCode/Hermes), local runtime metadata store, paired evals]
---
# Stop That Shit – a guard against unrequested hashes from coding agents

## Value Proposition

Enforce the task boundary you meant to set. Hooks stop the mechanical violations — unrequested hashes and checksums, dependency additions, budget-busting subagents, writes outside the agreed files — before the tool runs, while the advisory skill asks four questions that catch the semantic creep hooks cannot see. Works across Codex, Claude Code, OpenCode and Hermes, and stays honest about what it can and cannot know: it authorizes scope, never replaces the host sandbox, and records host effects as unobserved rather than pretending.

**One-liner:** A hook + skill guard that stops AI coding agents from adding unrequested hashes, dependencies and scope creep.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Daily agent users (Codex/Claude/OpenCode/Hermes) | Unrequested artifacts stop appearing; task scope stops drifting. |
| Teams with rule files | The rules finally get enforced mechanically, per run, not per conversation. |
| Guardrail contributors | The paired-case loop (bad case → good case → fixture) gives a path to improve coverage. |

The post does not describe an enterprise product; it is an MIT community tool.

## Jobs To Be Done

1. **Functional job** — Stop recognizable hash/checksum operations nobody asked for.
2. **Functional job** — Gate dependency additions, subagent spawns and out-of-scope writes with default-deny or ask behavior.
3. **Functional job** — Judge semantic cases with the four questions: requested? needed? proven by reachable state? required by acceptance?
4. **Functional job** — Run without hooks as a skill-only advisory, or with hooks for machine enforcement.
5. **Emotional job** — Stop cleaning up after agents: the guard says "stop that shit" so the user doesn't have to.

## Success Metrics

- **Interception rate:** recognizable hash ops and out-of-scope writes are blocked on covered paths.
- **False-positive discipline:** necessary work survives (the good-case library protects it).
- **Harness coverage:** Codex, Claude Code, OpenCode and Hermes all translate events through the same decision interface.
- **Adoption signal:** stars/forks (369/15 at capture) and paired-case contributions.
- **The source names no revenue target.**

## Pricing & Monetization

None. Stop That Shit is MIT-licensed and open source, with an install path as plugin or skill per harness. Monetization is out of scope.

## Competitive Landscape

The README does not name competing products. The space is guardrail tooling for coding agents — permission prompts, sandboxes and policy layers — where Stop That Shit's differentiator is the specific target (defensive scope creep and unrequested artifacts, not just dangerous commands) plus the honesty contract about what hooks can observe. The FAQ-style comparison is internal: hooks enforce, the skill judges, the sandbox isolates. No feature or price comparison appears in the source.

## Risks & Open Questions

- [ ] Coverage ceiling: hooks only see supported events and enough input; semantic creep (e.g. extra prose, speculative refactors) passes through unless the skill is active.
- [ ] Trust boundary: a returned permission deny does not prove the host stopped the action; users who assume it does inherit the risk.
- [ ] Over-blocking real work: the guard's value depends on the good-case library keeping necessary actions legal; a bad rule set makes agents useless.
- [ ] Harness churn: four adapters must track four rapidly changing event models; a lagging adapter silently loses coverage.
- [ ] The four-question skill is advisory by nature; its effectiveness depends on model compliance, not machine enforcement.
