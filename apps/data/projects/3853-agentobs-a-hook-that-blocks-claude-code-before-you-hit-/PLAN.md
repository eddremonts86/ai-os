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

## Tech Stack

- **Claude Code hook integration:** intercepts calls before execution via Claude Code's hook mechanism.
- **Token budget enforcement:** daily and per-session budgets with block-on-limit behavior.
- **Rolling rate-limit windows:** time-window counters that block before limits are hit.
- **Command policy engine:** declarative policies (like no-recursive-force-delete) with a policy test command.
- **Local cost tracking with no account:** usage, spend, calls, errors and blocked totals stored on disk.
- **MCP server and desktop alerts:** budget state exposed to MCP clients with desktop notifications.

## Architecture

- **Hook layer:** Claude Code hooks call the AgentObs CLI pre-execution.
- **Policy engine:** evaluates command, budget and window rules; returns allow or block decisions.
- **Local store:** session usage, spend and limits in a local database.
- **Dashboard:** web UI for weekly spend, call and error rates, and activity charts.
- **Notifications:** desktop alerts plus an MCP server exposing budget state.

## Milestones

1. **M0 — Budget blocking.** The hook wired into Claude Code; a daily token budget blocks pre-execution.
2. **M1 — Policy engine.** Command policy with the rm -rf example, rolling windows and 5-hour blocking.
3. **M2 — Observability.** Local dashboard, forecasting, status-bar and desktop alerts.
4. **M3 — Ecosystem.** MCP server surface and secret-redaction hardening with unit tests.

## Risks

- **Claude Code hook API changes** can break interception.
- **Token cost models drift:** budget accuracy depends on them.
- **Local-first scope** limits team features competitors may offer.
- **Young project:** no battle-testing on diverse workflows yet.
