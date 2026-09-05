---
id: "3883"
slug: podiom-durable-sessions-scheduling-and-goals-for-local-
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

## Tech Stack

- **Local agent orchestration layer:** the thin wrapper around Claude and Codex.
- **Durable session storage:** sessions persist across restarts.
- **Scheduler:** planned and triggered agent runs without manual supervision.
- **MCP tool integration:** native wiring of MCP servers into agent runs.
- **CLI agent integration:** adapters for local Claude and Codex processes.
- **Goal tracking:** named objectives tracked across sessions.

## Architecture

- **Session layer:** captures and restores agent session state across restarts.
- **Profile layer:** per-project or per-agent profiles configure behavior.
- **Schedule layer:** a scheduler triggers agent runs on a plan or timer.
- **Integration layer:** MCP servers, tools and skills attach through the orchestration layer.

## Milestones

1. **M0 — Durable sessions.** A Claude or Codex session survives a restart and resumes.

2. **M1 — Scheduling.** Runs can be planned and triggered without a human at the terminal.

3. **M2 — Goals.** Named objectives persist across sessions and reflect progress.

4. **M3 — Native integrations.** MCP, tools and skills wire in through the layer without glue code.

## Risks

- **CLI drift:** Claude Code and Codex change quickly; adapters need constant upkeep.
- **Session fidelity:** what counts as session state (context, environment, credentials) is easy to get wrong.
- **Thinness creep:** each added feature pushes the layer toward replacing the agents it orchestrates.
- **Solo project risk:** nothing in the capture shows a maintainer community or roadmap.
