---
id: "3883"
slug: "podiom-durable-sessions-scheduling-and-goals-for-local-"
title: "Podiom – durable sessions, scheduling and goals for local Claude/Codex"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49498323"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Local agent orchestration layer, Durable session storage, Scheduler, MCP tool integration, CLI agent integration, Goal tracking]
---
# Podiom – durable sessions, scheduling and goals for local Claude/Codex

## Value Proposition

A thin orchestration layer for the local agents you already run: durable sessions that survive restarts, scheduling so agent work happens without you at the terminal, goals that persist across runs, and native integration with MCP servers, tools and skills. Podiom wraps Claude and Codex rather than replacing them.

**One-liner:** A thin orchestration layer for local Claude and Codex: durable sessions, scheduling, goals and native MCP and skill integration.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Local Claude and Codex users | Sessions that survive restarts and reboots instead of evaporating with the process. |
| Solo builders running scheduled agent work | Plan and trigger agent runs without babysitting the terminal. |
| MCP and skill integrators | One layer that wires MCP servers, tools and skills into their local agents. |

The capture names the two supported agents (Claude and Codex) and no other audience.

## Jobs To Be Done

1. **Functional job** — Keep an agent session durable across restarts and machine reboots.

2. **Functional job** — Schedule agent runs so work happens without manual supervision.

3. **Functional job** — Track named goals across sessions.

4. **Functional job** — Integrate MCP servers, tools and skills through one native layer.

## Success Metrics

- **Session durability:** a session resumes correctly after the agent process and the machine restart.
- **Schedule reliability:** scheduled runs fire and report without manual intervention.
- **Goal continuity:** objectives survive across sessions and reflect completed work.
- **Thinness:** orchestration overhead stays low enough that local agents remain local and fast.

## Pricing & Monetization

None stated. The capture is a title plus a repository description with no pricing information.

## Competitive Landscape

The post names no competitors. The category is local agent orchestration and session tooling — CLI agent wrappers, session managers and scheduling layers around Claude Code and Codex. The stated differentiator is the combination: durable sessions plus profiles plus scheduling plus native MCP and skill integration in one thin layer.

## Risks & Open Questions

- [ ] Ultra-thin capture: title plus repository description; every claim is unverified beyond those two lines.
- [ ] Claude and Codex are fast-moving CLIs; session persistence depends on their internals staying compatible.
- [ ] Thinness is the promise and the risk: too little abstraction and it adds nothing; too much and it stops being thin.
- [ ] No usage numbers, no roadmap, no community evidence in the capture.
- [ ] Session durability for agent CLIs is notoriously leaky (environment, working tree, credentials); the repo does not say how it is achieved.
