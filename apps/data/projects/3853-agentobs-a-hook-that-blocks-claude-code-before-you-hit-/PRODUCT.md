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

## Value Proposition

Stop your agent before it overspends or runs rm -rf. AgentObs sits between Claude Code and the actions it is about to take: it enforces token budgets, rolling rate limits, command policy and scoped approvals before a call runs, blocks on your spend limit and 5-hour window, forecasts when you will run out, and shows it all in a local dashboard with desktop alerts — no account, nothing leaves the machine.

**One-liner:** A hook that blocks Claude Code before you hit your limit — spend, window or dangerous command.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Claude Code subscribers | Stop surprise limit hits mid-session with pre-execution blocks. |
| Teams with guardrail needs | Command policy blocks dangerous commands before they run. |
| Privacy-conscious developers | Local-first cost tracking with no account or cloud upload. |
| MCP tooling users | An MCP server exposes budget and usage state to other tools. |

## Jobs To Be Done

1. **Functional job** — Enforce token budgets and block Claude Code before the limit is reached.
2. **Functional job** — Enforce command policy and scoped approvals before a command executes.
3. **Functional job** — Forecast when limits will run out during the current session.
4. **Functional job** — Review cost, calls, errors and blocked actions in a local dashboard with alerts.

## Success Metrics

- **Blocks before overspend:** sessions where AgentObs prevented a budget overrun that would otherwise have happened.
- **Dangerous-command blocks:** pre-execution blocks of policy-violating commands.
- **Forecast accuracy:** predicted limit-exhaustion time versus actual.
- **Local adoption:** installs on npm and active hook configurations, per the project's own distribution.

## Pricing & Monetization

None stated. Free and open source (MIT) on npm; the README advertises a related cost-tracking tool (ccusage) for reporting-only use.

## Competitive Landscape

The post does not name competitors by name, but the README positions AgentObs against two categories it tables explicitly: cost-reporting tools (read-only, they tell you after) and security hooks (they block commands but not spend). AgentObs's claim is the union — it blocks on spend, windows and dangerous commands, before execution.

## Risks & Open Questions

- [ ] Hook surface dependence: Claude Code's hook semantics define what can actually be intercepted; gaps there are product gaps.
- [ ] Brand-new codebase (days old): edge cases in limit arithmetic or policy matching are unproven.
- [ ] Local-only means no cross-machine budgets; team-wide enforcement is not addressed.
- [ ] Enforcing spend limits requires accurate token pricing; pricing-model changes upstream can break forecasts.
- [ ] Over-blocking can frustrate legitimate workflows; policy defaults will decide adoption.
