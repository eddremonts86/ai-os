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

## Phase 0: Scaffold

- [x] Read the Show HN post and the GitHub README to confirm the Brain/Executor split, the read-only MCP surface, and the MIT plus crates.io status
- [x] Write SPEC.md (this document)
- [x] Preserve the upstream ASCII diagram (Brain to MCP to AgentBridge to C2C PLAN to Executor to Workspace) in the docs
- [x] Scaffold the Rust crate, the MCP server entry point, and the CLI start/stop surface

## Phase 1: Core

- [ ] Implement the read-only Brain surface: list files, search, read, git diffs, and architecture summaries
- [ ] Implement the plan-translation layer from Brain plan to C2C plan
- [ ] Wire OpenCode as the default Executor: apply edits, run commands and tests, and report status
- [ ] Implement the diff-review loop: approve, request changes, or roll back
- [ ] Persist plans to disk across Brain-side restarts
- [ ] Ship the CLI to pick workspace, Brain, and Executor; keep logs minimal with a verbose mode for the C2C plan and diffs

## Phase 2: Deploy

- [ ] Publish the crate to crates.io and tag a GitHub release with the README plus README_zh
- [ ] Recruit external testers to run a Brain plus Executor pair on their own repositories
- [ ] Decide the privileged-action approval policy before any additional Executor (Cursor, Cody) integrations

---

_Generated automatically by Lúa on 2026-08-29_
