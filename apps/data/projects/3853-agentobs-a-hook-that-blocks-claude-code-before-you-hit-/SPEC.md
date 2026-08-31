---
id: "3853"
slug: agentobs-a-hook-that-blocks-claude-code-before-you-hit-
title: AgentObs – a hook that blocks Claude Code before you hit your limit
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497992"
category: ask-hn
date: "2026-08-30"
tags: [Ask HN, Problem]
tech: [Claude Code hook integration, Token budget enforcement, Rolling rate-limit windows, Command policy engine, Local cost tracking with no account, MCP server and desktop alerts]
---
# AgentObs – a hook that blocks Claude Code before you hit your limit

## Problem

AgentObs is a hook that blocks Claude Code before you hit your limit — budget, window or otherwise. The GitHub repository is explicit: "Your agent is about to run rm -rf /. Every other tool will tell you about it afterwards." It enforces token budgets, rolling rate-limit windows, command policy and scoped approvals before a call runs, tracks cost, blocks on spend limits and on the 5-hour usage window, forecasts when you will run out, and ships an MCP server, a web dashboard, desktop alerts and status-bar integration. It is local-first with no account, published on npm as @klars/agentobs for Node 22.5+ under MIT.

## Objective

Give Claude Code users a control plane instead of an after-the-fact cost report: block dangerous commands and budget-exceeding calls before they execute, forecast when limits will hit, and do it all locally with no account.

## Target Users

- Claude Code users who have burned through subscription limits unexpectedly.
- Teams that want command policy (like blocking rm -rf) enforced before execution, not logged after.
- Local-first tooling fans who will not send usage data to a vendor dashboard.

## MVP Scope

- A Claude Code hook that intercepts calls pre-execution.
- Token budget enforcement with block-on-limit (for example daily budgets with --block).
- Command policy engine (the no-recursive-force-delete example) with policy testing.
- Rolling rate-limit windows and 5-hour usage-window blocking.
- Cost tracking, forecasting and a local web dashboard; MCP server and desktop alerts.

## Constraints

- The capture is a one-line HN post plus the repo; every feature claim comes from the project's own README.
- Claude Code's hook surface is the integration boundary; behavior depends on Claude Code's hook semantics.
- Local-first with no account means no cloud telemetry; everything must work offline on one machine.
- The project is brand new (the repo was created the day before the post); maturity and edge cases are unproven.

## Design Direction

See `DESIGN.md` for this project's design tokens.
