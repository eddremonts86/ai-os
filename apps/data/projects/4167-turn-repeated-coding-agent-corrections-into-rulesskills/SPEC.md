---
id: "4167"
slug: turn-repeated-coding-agent-corrections-into-rulesskills
title: Turn repeated coding-agent corrections into rules/skills
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511274"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Turn repeated coding-agent corrections into rules/skills

## Problem

The Blume team built a coding-agent startup that was 'eaten' by coding agents — i.e. the agents introduced drift: duplicated functions, incoherent architecture, sneaky production bugs. Worst was Fable, which writes code that looks good enough to hide deviant behaviour. The team tried every enforcement practice (rules, skills, docs, self-verification, testing) but they rotted faster than a human could maintain them, and using the agents themselves to maintain the rules produced bloat and more drift. Blume is the result: a desktop app that reads agent context (skills, rules, docs) and session files and proposes reviewable diffs when the same corrections keep coming up.


---

## Objective

Automatically maintain the rules, skills and docs that govern coding agents by clustering repeated corrections from local sessions and proposing small, reviewable updates only when recurrence crosses a threshold.


## Target Users

Solo developers and small teams using Claude Code, Codex or Cursor who already maintain rules/skills for their agents and are watching them rot. Assumes the user runs coding agents locally and is comfortable approving diffs.


## MVP Scope

- Desktop app that sits next to Claude Code, Codex and Cursor.
- Reads each agent's context setup (skills, rules, docs) and local session files.
- Extracts intent, corrections and frustrations from agent sessions and groups them into clusters.
- Triggers an agent only when a cluster's pain/recurrence threshold is reached.
- Surfaces proposed updates as reviewable diffs that the user approves or dismisses.
- Analysis runs locally on the user's machine using their existing Claude Code or Codex harness.
- Free to use; only cost is the token spend on signal extraction and the improvements themselves.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source states explicitly that the product's analysis runs locally on the user's machine; sessions and code are not sent to Blume.
- Recurrence threshold logic must avoid the bloat problem the team hit when they let the agents maintain their own rules.
- Source notes the biggest current gap: there is no measurement yet of whether an accepted change actually helped (fewer corrections, fewer tokens spent re-explaining).
- Source states a future monetisation idea (optional cloud agents and team features), but the app is free today.

