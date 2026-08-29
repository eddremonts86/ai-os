---
id: "3719"
slug: agentbridge-let-one-ai-think-while-another-ai-writes-th
title: AgentBridge – Let one AI think while another AI writes the code
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488074"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Open Source, MCP, Agents, Developer Tools]
tech: [Rust, MCP (Model Context Protocol), OpenCode, Gemini, Claude]
---
# AgentBridge – Let one AI think while another AI writes the code

## Problem

AI coding agents today bundle two jobs into a single quota: **reasoning** (understand the codebase, investigate, design solutions, review diffs) and **execution** (edit files, run commands, run tests, apply changes). When the user's web-tier AI has generous usage and stronger reasoning, but their local coding CLI has a tighter subscription quota, the local agent ends up spending its budget on understanding the project before it ever writes a line. The Show HN post links to [https://github.com/IndexFlowing/AgentBridge](https://github.com/IndexFlowing/AgentBridge), an MIT-licensed Rust crate (also published to crates.io as `agentbridge`) that splits the workflow into two roles: a **Brain** (a web-based AI such as Gemini or Claude, talking to the workspace through a read-only MCP interface) and an **Executor** (a local coding agent such as OpenCode, talking through the same MCP server). The Brain inspects, plans and reviews; the Executor edits, runs and tests. AgentBridge is the bridge between them, translating the Brain's plan into an MCP-grounded plan the Executor can apply. The repo is brand-new (created 2026-08-29, zero stars at capture time) but the README is concrete enough to ground a plan.

## Objective

Ship a stable, MIT-licensed MCP bridge that lets a user point their web-tier reasoning AI at a local workspace and have a separate local coding agent execute the plan, with no quota-share loss. The MVP must expose a read-only MCP interface for the Brain, an MCP-grounded executor interface for the local coding agent, and a translation layer that turns Brain plans into C2C (Computer-Computer) plans the Executor can apply.

## Target Users

- Primary: developers who already pay for both a generous web-tier AI (Gemini, Claude web) and a more limited coding-agent subscription (Cursor, OpenCode, Cody) and want to use each where it is best.
- Secondary: small teams that want a clear audit trail between "this AI thought it should do X" and "the local agent did X", with the Brain's plan and the Executor's diff reviewable side by side.
- Tertiary: open-source contributors building MCP server/tooling who want a reference implementation in Rust.

## MVP Scope

- A Rust binary that runs as an MCP server in the local workspace.
- A read-only MCP interface exposed to the Brain: list files, search code, read files, inspect git diffs, summarise architecture. The Brain cannot edit files or run shell commands directly through this interface.
- An MCP-grounded interface for the Executor (OpenCode first): apply edits, run commands, run tests, and report status back.
- A plan-translation layer that converts the Brain's high-level plan into a C2C plan the Executor understands.
- A diff-review loop: the Brain can re-read the Executor's diffs and either approve, request changes, or roll back.
- A CLI to start/stop the bridge, point it at a workspace, and choose which Brain and Executor models to use.
- MIT licence, README in English plus a Chinese README (the upstream ships `README_zh.md`).

## Design Direction

See `DESIGN.md` for this project's design tokens. The CLI is a single primary surface: pick a workspace, pick a Brain, pick an Executor, start. Logs are minimal by default; verbose mode shows the C2C plan and the Executor's diffs. The README already includes an ASCII diagram (Brain → MCP → AgentBridge → C2C PLAN → Executor → Workspace) that should be preserved verbatim in the docs. No telemetry, no auto-update, no login.

## Constraints

- Brain surface must be strictly read-only: no write or shell MCP methods exposed to the Brain.
- Executor must always be a separate, locally-run process; the bridge itself never edits files.
- The bridge must work with OpenCode as the default Executor; supporting additional Executors (Cursor, Cody) is post-MVP.
- Plans must be persistable to disk so a Brain's plan survives a Brain-side restart.
- No telemetry leaves the local machine; nothing is sent to a third-party server other than the configured Brain/Executor endpoints.
