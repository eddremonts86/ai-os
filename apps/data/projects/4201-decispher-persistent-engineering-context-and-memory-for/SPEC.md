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

## Problem

Coding agents repeatedly rediscover context that already exists inside an engineering organization. A developer working on a feature can combine information from previous PRs, Jira tickets, Slack discussions, ownership boundaries, architectural decisions, and their own experience; coding agents usually start with a prompt and a repository, then spend tokens searching for that same context — or miss it entirely. Decispher is a context and memory layer for engineering agents.


---

## Objective

Give coding agents a persistent, queryable layer of engineering context and memory so they stop re-deriving the same context from scratch on every task.


## Target Users

Engineering teams using coding agents (Claude, Codex, Grok Build, Cursor, MCP-compatible agents) who have a long tail of context in PRs, Jira, Slack, ownership maps and ADRs. Assumes the team is willing to connect their engineering platforms to a third-party service.


## MVP Scope

- Context Engine: pulls records from engineering platforms and combines related fragments into context units retrievable per task.
- Memory Plane: persistent context at user, team and project levels, including working preferences and engineering conventions; teams can create reusable memory sets (frontend, payments-backend, project-specific) and inject the right set per task.
- Worker Agent: autonomous agent that uses the Context Engine and Memory Plane, takes tasks from Jira or Slack, retrieves relevant context and ownership, and asks humans when context is insufficient instead of guessing.
- Branch Story: turns an AI coding session into a structured handoff on the PR (prompt → plan → actions → result).
- Reported LongMemEval results: 89% on oracle split using GPT-4.1-mini as extractor/reader, 81% on LongMemEval-S (89% with frontier models), 38x median token reduction.
- Setup via `npx decispher init` and `npx decispher link`.
- Integrations with Claude, Codex, Grok Build, Cursor and a VS Code/OpenVSX extension.
- Open-source Decision Guardian project for surfacing ADR context on PRs.
- Security posture: Context Engine does not clone source code (GitHub API only); Worker Agent sandbox is network-isolated with an allowlisted proxy; raw messages/text encrypted at rest, purged 7 days after merge or 30 days after last activity (configurable).


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The Context Engine does not clone source code; integration is via the GitHub API.
- Worker Agent runs in an isolated sandbox with no outbound network except through an allowlisted proxy.
- Worker sandboxes are destroyed after a run.
- Raw messages and text are encrypted at rest and automatically purged (7 days post-merge or 30 days after last activity).
- Retention is configurable.
- Memory and Worker Agent are rolling out gradually; only the Context Engine is generally available today.
- Source does not state pricing or plans.

