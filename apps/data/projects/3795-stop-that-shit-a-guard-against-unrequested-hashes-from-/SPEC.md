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

## Problem

The Show HN post is URL-only, pointing at the Stop That Shit repository. The project's opening example is the failure mode it exists to stop: "You ask an agent to export one result file. It also generates a SHA-256 checksum that no later command will ever read. Stop That Shit." The README generalizes this as AI coding agents adding defensive work and task-scope creep on their own initiative — unrequested hashes and checksums being the flagship case. The answer is a multi-platform Hook + Skill Guard for Codex, Claude Code, OpenCode and Hermes Agent CLI: hooks block explicit boundary violations before a tool runs (writing files in review/answer/monitor modes, adding dependencies without approval, spawning subagents beyond budget, adding recognizable hash operations, writing outside the file lock), while a skill layer handles semantic judgment with four questions — did the user ask for it, is it needed for the current result, what reachable code/data/deployment state proves it, and would the acceptance fail without it. The guard is careful about its own limits: it only sees supported hook events, it never claims the host actually stopped an action (host effects are recorded as `unobserved`), and safety isolation remains the host sandbox's job. The repo is MIT, bilingual (Chinese/English), and at capture time had 369 stars and 15 forks.

## Objective

Ship a guard that intercepts scope creep at the boundary and teaches the rest: hooks stop the mechanical violations (unrequested hashes, unapproved deps, budget-busting subagents, out-of-lockfile writes), and the skill makes the semantic call before work happens. The MVP is the hook guard plus the advisory skill across the supported harnesses.

## Target Users

- Developers who run Codex, Claude Code, OpenCode or Hermes and keep finding unrequested artifacts (checksums, extra files) in agent output.
- Teams with AGENTS.md-style rule files who want the rules enforced mechanically instead of re-negotiated per session.
- People burned by task-scope creep who want budget and dependency boundaries without watching every agent turn.

## MVP Scope

- Hook guard covering the documented paths: writes in review/answer/monitor → stop; adding dependencies → ask; spawning subagents over budget → stop; recognizable hash operations → stop; writes outside the file lock → stop.
- Advisory skill with the four semantic questions, usable without enabling hooks (skill-only install path).
- Host adapters translating Codex, Claude Code, OpenCode and Hermes events into one decision interface.
- A local runtime that stores metadata only and distinguishes checked actions, context responses, permission denies and `hostEffect: unobserved`.
- A case library (bad case / good case) driving which rules make it into the guard.

## Constraints

- The guard authorizes scope, it does not provide security isolation — the host sandbox owns safety, and the project says so.
- Honesty about coverage: `permission_deny_returned` does not prove the host stopped the action; host effects are always recorded as `unobserved`.
- Only high-confidence, reproducible cases enter the guard; the skill handles semantic judgment the hooks cannot see.
- Supported harnesses are Codex, Claude Code, OpenCode and Hermes Agent CLI; other harnesses need equivalent before-action events per the adapter contract.
- MIT-licensed; the project accepts paired cases (report → counter-example → reproduce → enforcement) as its contribution loop.

## Design Direction

See `DESIGN.md` for this project's design tokens.
