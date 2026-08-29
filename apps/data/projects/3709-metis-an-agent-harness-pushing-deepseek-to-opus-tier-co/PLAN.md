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

## Tech Stack

- **Core:** TypeScript, Node.js. The repo publishes `@wholiver_hu/metis` as the SDK and `@wholiver_hu/metis/rpc-entry` as the RPC entry point.
- **TUI:** Rich interactive terminal UI for the in-terminal workflow.
- **Desktop:** React + Vite + Electron desktop workspace for macOS and Windows. Dev entry: `npm --prefix desktop run dev`. Build: `npm --prefix desktop run build`.
- **Persistence:** SQLite for durable session memory across restarts, context compactions, and session forks.
- **Recursion:** L0→L4 agent delegation with Git Worktree isolation per branch of the recursion tree.
- **Model layer:** Adapter pattern over OpenAI, Anthropic, DeepSeek, OrcaRouter, Gemini, Groq, Ollama, vLLM.
- **Extensibility:** TypeScript plugins, Agent Skills, MCP servers.
- **Verification:** Terminal-Bench and Harbor readiness, plus a video-evidence inspection tool.

The legacy AI-OS default stack (TanStack Start, Drizzle ORM, Coolify, Docker) is not used. The product is a TypeScript SDK + TUI + Electron desktop + per-model adapters; the build target is npm-published packages and signed desktop binaries, not a self-hosted web service.

## Architecture

```
                    ┌────────────────────────┐
                    │  Metis Desktop         │
                    │  (Electron, React/Vite)│
                    │  - Plan / Build modes  │
                    │  - session browser     │
                    │  - video inspector     │
                    └──────────┬─────────────┘
                               │ IPC
                               ▼
                    ┌────────────────────────┐
                    │  Metis core (Node)     │
                    │  - L0 coordinator      │
                    │  - planner / implementer│
                    │  - reviewer / verifier │
                    │  - SQLite sessions     │
                    │  - Git Worktree iso    │
                    └──────────┬─────────────┘
                               │ adapters
                               ▼
                    ┌────────────────────────┐
                    │  Model providers       │
                    │  OpenAI / Anthropic /   │
                    │  DeepSeek / OrcaRouter /│
                    │  Gemini / Groq / Ollama │
                    │  / vLLM                │
                    └────────────────────────┘

                    ┌────────────────────────┐
                    │  @wholiver_hu/metis    │
                    │  Node SDK              │
                    │  - programmatic use    │
                    └────────────────────────┘
```

Two surfaces (TUI and Desktop) share the same core. The SDK is a third surface for embedding Metis in another tool. Recursion is bounded by worktree isolation, so a four-deep fork has its own git state per branch.

## Milestones

1. **M0 — Core harness and SQLite sessions** (already shipped at 128 commits) — recursive multi-agent, durable sessions, Git Worktree isolation.
2. **M1 — TUI** (already shipped) — terminal workflow with Plan / Build dual modes.
3. **M2 — Desktop workspace** (already shipped, Electron + React/Vite) — macOS and Windows builds.
4. **M3 — Provider matrix** (already shipped at eight adapters) — OpenAI, Anthropic, DeepSeek, OrcaRouter, Gemini, Groq, Ollama, vLLM.
5. **M4 — Benchmark and verification** — Terminal-Bench and Harbor eval readiness, video evidence inspection tool, reproducible 82% claim on a public eval log.

## Risks

- **Benchmark number is the public claim.** The MVP needs a reproducible eval script and a public log so the 82% number survives an external audit. A silent change to the verification pipeline makes the claim a lie.
- **Pi parity is the open question.** The HN thread asks for a head-to-head. The MVP needs Terminal-Bench / Harbor runs for both Metis and Pi published in the repo, with the same prompt set and the same verifier.
- **Multi-provider test matrix.** Eight providers each have quirks; each needs a CI run that exercises its tool-call format and rate-limit handling.
- **L4 worktree isolation.** The README promises four-deep delegation with worktree isolation per branch. The MVP needs a stress test that forks four deep on a real repo and asserts every worktree resolves cleanly when the parent session ends.
- **Funding model unstated.** MIT, no SaaS, no sponsor link named. The MVP has to decide whether the funding shape is sponsorship, consulting, or a hosted cloud offering — and if the last, when.
