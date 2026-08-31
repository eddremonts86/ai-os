---
id: "3797"
slug: ai-harness-that-lets-a-graph-of-codex-and-claude-interc
title: AI Harness that lets a graph of Codex and Claude intercommunicate
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49492155"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Agent fleet orchestration, graph-based agent topologies, budget-constrained loop engine, MCP tunnelling, secret reduction layer, Slack/WhatsApp connectors]
---
# AI Harness that lets a graph of Codex and Claude intercommunicate

## Value Proposition

Stop babysitting agents one at a time. Rysh coordinates a graph of them — the poster's example is a CEO agent talking to 5 managers who each run workers — with a visible Agent Board, budget-bounded loops (a $5 goal that either finishes or hands back findings for the next run), MCP tunnelling to share endpoints safely, and automatic secret reduction so credentials never reach the agents. It doubles as an assistant you can reach from Slack or WhatsApp, and the 15 Graph Engineering patterns from the author's white paper are all runnable in it.

**One-liner:** A harness where fleets of Codex and Claude agents coordinate on a graph, work within budgets, and never see your secrets.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Multi-agent orchestrators | Hierarchy (CEO → managers → workers) instead of manual agent juggling. |
| Teams watching agent progress | The Agent Board shows slack-like messages of what agents are doing. |
| Budget-minded builders | Leash caps a goal at a stated budget (e.g. $5) and reports back instead of burning money. |
| Assistant users on chat platforms | Slack/WhatsApp access to the harness like an OpenClaw-style assistant. |

The post names no enterprise segment; it is an Apache-2.0 open-source tool seeking feedback.

## Jobs To Be Done

1. **Functional job** — Build a fleet where agents talk to each other and the user talks only to the CEO agent.
2. **Functional job** — Watch progress on the Agent Board as slack-like messages.
3. **Functional job** — Run a goal under a budget with Leash: finish, or produce findings and prepare the next run.
4. **Functional job** — Share agent endpoints through MCP tunnelling without publishing REST APIs.
5. **Emotional job** — Trust the harness with secrets: they stay local and obscured, never reaching the agents.

## Success Metrics

- **Fleet completion:** a CEO → 5 managers → 20 workers task completes with the user talking only to the CEO.
- **Budget adherence:** Leash loops stop at the stated budget and deliver findings for the next run instead of overrunning.
- **Secret zero-leak:** secrets never appear in agent context — testable by audit of agent traffic.
- **Board usefulness:** progress is visible on the Agent Board without asking each agent.
- **The post names no revenue target; distribution and monetization are unstated.**

## Pricing & Monetization

The post does not state pricing or a hosting model. Rysh is Apache 2.0 and self-hosted by implication. Monetization is out of scope for the MVP.

## Competitive Landscape

The post names one reference point: OpenClaw, by way of "you can use it as an Assistant like OpenClaw, and access it through Slack, WhatsApp etc." The broader landscape is agent harnesses and orchestration frameworks; Rysh's differentiation is the combination of graph topologies, the published 15-pattern methodology, budget-bounded loops and secret reduction. No feature or price comparison beyond the OpenClaw mention appears.

## Risks & Open Questions

- [ ] Secret reduction is a hard claim; any path where secrets reach agent context breaks trust in exactly the way the feature advertises against.
- [ ] The CEO → 5 → 20 topology is an example, not proof; coordination overhead at that depth can exceed the task value.
- [ ] Budget enforcement is only as good as the accounting; a $5 loop that overruns silently invalidates the Leash pitch.
- [ ] The white paper's 15 patterns are stated but not enumerated in the post; whether they are real engineering patterns or aspirational is unverifiable from the source.
- [ ] The post gives no URL, no release state and no install instructions — the project's distribution story is unknown from the capture alone.
