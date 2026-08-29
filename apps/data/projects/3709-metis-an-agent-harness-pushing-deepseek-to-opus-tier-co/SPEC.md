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

## Problem

The pitch is in the title: an open-weights coding model (DeepSeek V4 Flash) reaches 82.02% on the same benchmark where Claude Fable 5 XHigh scores 83.8% — "effectively giving a 'Flash' model the capabilities of a flagship model" — and the harness is the engineering that closes the gap. The HN post is the claim; the GitHub README is the proof.

The repo description reads "Metis is a coding agent that boosts AI/LLM coding performance by 50%". The README lists six features in order: "Plan & Build Dual Workflows — Safely investigate in read-only Plan mode, then execute approved plans with a live-updating checklist in Build mode. Dual Interface for Terminal & Desktop — Work directly in your terminal via the rich interactive TUI, or use the dedicated React/Vite Desktop workspace on macOS and Windows. Recursive Multi-Agent System — Native named agents (`coordinator`, `planner`, `implementer`, `reviewer`, `verifier`) with L0→L4 recursive delegation and Git Worktree isolation. Durable Memory & Resumable Sessions — Project knowledge and decisions persist in SQLite across restarts, context compactions, and session forks. Extensible & Model-Agnostic — Use any LLM provider (OpenAI, Anthropic, DeepSeek, OrcaRouter, Gemini, Groq, Ollama, vLLM) and extend with TypeScript plugins, Agent Skills, and MCP. Benchmark-Grade Reliability — Automated verification gates, video evidence inspection, and full Terminal-Bench & Harbor evaluation readiness."

The repo is MIT-licensed, 56 stars, 8 forks, 128 commits, and ships the Node.js SDK as `@wholiver_hu/metis` plus an RPC entry point at `@wholiver_hu/metis/rpc-entry`. The HN comments note the comparison with Pi (one of the more popular recursive-agent harnesses) is the obvious next question — and one the post does not address.

## Objective

Make DeepSeek (and any other open or commercial model) a competitive coding agent by wrapping it in a recursive multi-agent harness, with Plan / Build separation, durable sessions, and benchmark-grade verification.

## Target Users

1. **Solo developers running coding agents** — anyone already running Codex, Claude Code, or a comparable agent who wants Plan / Build separation and durable sessions without writing a harness themselves.
2. **Teams that need an auditable agent** — anyone whose compliance posture requires read-only Plan mode before any file changes, and a verification gate after.
3. **Model-hosting providers and OSS LLM maintainers** — anyone who wants to benchmark a small open model against a flagship and show the gap closes with the right harness.

## MVP Scope

- Plan / Build dual mode: read-only investigation in Plan mode, write access in Build mode with a live-updating checklist.
- Dual interface: rich TUI in the terminal + React/Vite desktop workspace (macOS, Windows).
- Recursive multi-agent: `coordinator`, `planner`, `implementer`, `reviewer`, `verifier` with L0→L4 delegation and Git Worktree isolation.
- Durable sessions in SQLite across restarts, context compactions, and forks.
- Model-agnostic: OpenAI, Anthropic, DeepSeek, OrcaRouter, Gemini, Groq, Ollama, vLLM.
- Extensibility: TypeScript plugins, Agent Skills, MCP.
- Verification: automated gates, video evidence inspection, Terminal-Bench / Harbor readiness.
- Out of scope for MVP: a hosted SaaS, billing, multi-tenant cloud.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- MIT-licensed; no proprietary fork, no enterprise-only feature.
- The 82% benchmark number is the public claim. Any change to the verification pipeline that changes the number has to be disclosed or the claim becomes a lie.
- Multi-provider support is part of the value; locking to one model breaks the promise.
- The HN comments ask about Pi parity — the project has to answer that comparison or the audience assumes "almost Pi".
