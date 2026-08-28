---
id: "540"
slug: does-this-problem-actually-exist-for-people-using-codin
title: Does this problem actually exist for people using coding agents daily?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voa7mx/does_this_problem_actually_exist_for_people_using/"
category: saas
date: "2026-08-14"
tags: [saas, developer-tools, ai-agents, knowledge-management]
tech: [Node.js, TypeScript, SQLite, FTS5, Model Context Protocol, GitHub API]
---
# Does this problem actually exist for people using coding agents

## Problem

An engineer using Claude Code / Cursor daily keeps hitting the same problem: agents (and new teammates) constantly re-ask or re-discover things like "why did we reject approach X last month?", "what are our actual testing / error-handling conventions?", "why is this function written this way?". Important decisions live in Slack threads, closed PRs, or someone's head; once the context is gone, the agent invents something generic or repeats old mistakes. The poster is thinking of building `repobrain`, a CLI tool that acts as persistent project memory: index git history, PR descriptions/comments, and optionally Slack/Notion; build a living store of decisions, rejected approaches, conventions, and architecture notes; expose queries via CLI, REST, or MCP so both humans and agents can query before acting; suggest new decision entries from recent PRs for human confirmation. The poster asks if the pain is real, whether anyone would install and use a CLI like this, what would make it sticky, and whether they would pay for cloud sync / team sharing vs local-only.

## Objective

Define the MVP scope for a local-first project-memory CLI that indexes the engineering artifacts of a single repository and exposes queries via CLI, REST, and MCP, so that coding agents can call it before acting and humans can confirm or correct the memory.

## Target Users

- **Primary:** engineers using Claude Code / Cursor daily on a single repo with non-trivial history.
- **Secondary:** tech leads onboarding new engineers (human or AI) who want the project's decisions to survive the Slack scrollback.
- **Tertiary:** open-source maintainers who want a public, queryable memory of the project's design decisions.

## MVP Scope

- `repobrain init` walks the current repo: indexes git history, PR descriptions, PR comments, and code comments tagged with a conventional marker (e.g. `@repobrain`).
- `repobrain query "the-question"` returns the top 3-5 relevant decisions, conventions, or rejected approaches with citations to the commit / PR / file.
- MCP server mode so Claude Code / Cursor can call `repobrain` automatically before writing code.
- Suggestion engine: surfaces recent PRs that look like a new decision entry, asks the human to confirm.
- Local-only storage (SQLite) in v1.
- Excluded in v1: cloud sync, Slack / Notion indexing, multi-repo, team workspace, web UI.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single CLI surface — the init wizard in the terminal, the query results as a numbered list with citations, the MCP registration as a one-liner in the agent's config. No marketing-site chrome; the product is the CLI.

## Constraints

- `repobrain init` must finish in under 5 minutes for a 100k-commit repo.
- The MCP server must respond in under 200ms for a query; the index lives in SQLite with FTS5.
- The suggestion engine must never auto-write to the index; every entry is human-confirmed.
