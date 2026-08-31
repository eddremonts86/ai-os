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

## Tech Stack

Chosen for enforcement inside four existing harnesses; every item comes from the repository.

- **Coding-agent hooks:** the before-action enforcement surface — the only layer that can mechanically block a tool call.
- **Advisory skill layer:** the semantic judge with the four questions, installable alone for harnesses/users that skip hooks.
- **Host adapters (Codex / Claude Code / OpenCode / Hermes):** each harness's events are translated into the shared decision interface, with the documented host-adapter contract.
- **Local runtime metadata store:** records only metadata — checked actions, context responses, permission denies, host effects (always `unobserved`).
- **Paired evals:** bad-case/good-case fixtures (including a real Codex paired run harness) that gate what enters the guard.

## Architecture

- **Boundary layer:** hooks inspect each tool action on covered paths and return stop/ask decisions (hash ops, deps, subagent budget, file-lock writes, mode violations).
- **Judgment layer:** the skill answers the four semantic questions before ambiguous work is attempted; evidence failing means report or defer, not implement.
- **Adapter layer:** per-harness event translation into one decision interface; hosts without equivalent before-action events are documented as unsupported.
- **Evidence layer:** EVIDENCE.md and the paired evals separate what was tested (including a GPT-5.6 run) from maintainer observation, and label host effects honestly.

## Milestones

1. **M0 — Core paths.** Hash ops, deps, subagent budget, file-lock and mode checks land on Codex and Claude Code.
2. **M1 — Skill-only path.** The advisory skill works standalone with the four questions and the case library.
3. **M2 — Harness parity.** OpenCode and Hermes adapters reach the same decision interface; runtime metadata recording is uniform.
4. **M3 — Evidence loop.** Paired evals run on a cadence; new cases enter the guard only when reproducible at high confidence.

## Risks

- **Observation gap:** hooks see events, not the host's final action; users may overtrust a deny signal.
- **Rule-set quality:** the guard is only as good as its cases; blocking necessary work makes agents useless and users uninstall.
- **Adapter drift:** four fast-moving harnesses multiply maintenance; a stale adapter silently loses enforcement.
- **Semantic creep:** the skill path depends on model compliance; it cannot be enforced mechanically by design.
- **Sandbox conflation:** users may expect isolation the guard explicitly does not provide; the boundary must be repeated everywhere.
