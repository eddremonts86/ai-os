---
id: "3709"
slug: metis-an-agent-harness-pushing-deepseek-to-opus-tier-co
title: "Metis – An agent harness pushing DeepSeek to Opus-tier coding (82%)"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49486374"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [TypeScript, TUI, Electron desktop, recursive multi-agent, MIT]
---
# Metis – An agent harness pushing DeepSeek to Opus-tier coding (82%)

## Phase 0: Scaffold

- [x] Core harness in TypeScript with recursive multi-agent (`coordinator`, `planner`, `implementer`, `reviewer`, `verifier`).
- [x] SQLite-backed durable sessions with context compaction and session forks.
- [x] TUI for in-terminal workflow.
- [x] Desktop workspace (Electron + React/Vite) for macOS and Windows.
- [x] Provider adapters for OpenAI, Anthropic, DeepSeek, OrcaRouter, Gemini, Groq, Ollama, vLLM.
- [x] SDK published at `@wholiver_hu/metis`; RPC at `@wholiver_hu/metis/rpc-entry`.
- [x] MIT-licensed repo at `github.com/Wholiver/metis`; 56 stars, 8 forks, 128 commits.
- [ ] Reproducible benchmark script + public eval log for the 82% claim.
- [ ] Head-to-head Terminal-Bench / Harbor runs against Pi, published in the repo.

## Phase 1: Core

- [ ] Plan / Build dual workflow polish: live-updating checklist in Build mode, reviewer/verifier checkpoints.
- [ ] Video evidence inspection tool: capture the agent's terminal session, allow the user to scrub and rewind.
- [ ] TypeScript plugin API surface: documented extension points for Agent Skills and MCP servers.
- [ ] L4 stress test: fork four agents deep on a real repo, assert every worktree resolves cleanly.
- [ ] Provider CI: every named provider runs through a smoke test on every PR (rate-limit handling, tool-call format, context-window edge).
- [ ] Tests:
 - Benchmark regression: the published 82% number is reproduced by the eval script on every release.
 - Worktree isolation regression: a four-deep fork creates four isolated worktrees and cleans them up at session end.
 - Provider regression: every adapter passes the same canonical coding-task prompt set.

## Phase 2: Deploy

- [ ] npm publish: `@wholiver_hu/metis` and `@wholiver_hu/metis/rpc-entry` on a tagged-release cadence.
- [ ] GitHub Releases: signed macOS and Windows binaries, plus the eval log as a release artifact.
- [ ] Documentation site: Quickstart, TUI usage, SDK reference, RPC reference, video tool guide.
- [ ] Smoke test in production: install via npm, run a fresh Plan / Build session, resume it after a process restart, confirm the durable-session ledger matches.
