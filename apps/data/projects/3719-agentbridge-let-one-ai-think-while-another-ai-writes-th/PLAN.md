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

## Tech Stack

Chosen for a single-machine bridge with two protocol surfaces and strict read-only enforcement on one of them.

- **Rust:** the bridge binary and MCP server implementation, published as an MIT-licensed crate.
- **MCP (Model Context Protocol):** the read-only surface for the Brain and the grounded surface for the Executor.
- **OpenCode:** the default local Executor the bridge drives.
- **Gemini / Claude:** the supported web-tier Brain models, reached through their own endpoints.
- **C2C plan format:** the translation target that carries a Brain plan to the Executor.

## Architecture

- **Brain interface (read-only):** list, search, and read files; inspect git diffs; summarise architecture. No write or shell methods are exposed.
- **Translation layer:** converts the Brain's high-level plan into a C2C plan the Executor can apply.
- **Executor interface:** apply edits, run commands, run tests, and report status — always a separate locally-run process.
- **Diff-review loop:** the Brain re-reads the Executor's diffs and approves, requests changes, or rolls back.
- **Plan persistence:** plans are saved to disk so a Brain-side restart loses nothing.

## Milestones

1. **M0 — Read-only MCP surface.** The Brain can inspect a workspace and nothing else.
2. **M1 — Executor integration.** OpenCode applies a C2C plan end to end on a sample repository.
3. **M2 — Review loop.** Approve, request changes, and roll back all work on real diffs.
4. **M3 — Publish.** The crates.io release, README plus README_zh, the MIT licence, and external testers on other repos.

## Risks

- **MCP instability:** protocol method names can change between client versions; pinned versions reduce drift.
- **Read-only enforcement:** any write or shell method accidentally exposed to the Brain breaks the core promise.
- **C2C expressiveness:** non-trivial refactors may not fit the plan format without a natural-language fallback.
- **Privileged-action policy:** whether the Brain can ever request dependency installs needs an explicit user-approval path.
- **Zero-star credibility:** a brand-new repo with no external validation has to earn trust through documentation and tests.
