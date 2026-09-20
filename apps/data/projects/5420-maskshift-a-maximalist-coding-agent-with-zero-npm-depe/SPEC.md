# SPEC.md — MaskShift – a maximalist coding agent with zero NPM dependencies

## Problem

MaskShift is a local-first coding agent harness. Features:<p>- Works with models that have no tool-calling API. Tool schemas are
 rendered into the system prompt and the model calls them by writing a
  block in its reply, parsed back into a normal tool call.<p>- No npm runtime dependencies. Daemon are Node 22 built-ins only. Install is a file copy and a symlink.<p>- Multi-provider: Ollama, OpenAI, Anthropic, Gemini, OpenRouter, LM Studio, vLLM.<p>- 148 native tools: filesystem, shell, search&#x2F;indexing, Git and
Workspace, LSP, browser&#x2F;CDP, containers, SSH, databases, web fetch.<p>- Lazy MCP loading. Catalog is searched, the relevant server connects on demand, only those tools enter the context window.<p>- 36 bundled skills, plus skills imported from Claude, Codex, and Copilot directories.<p>- Bridges to Claude Code, Codex, OpenCode, Copilot CLI, and Aider when they&#x27;re on PATH.<p>- Scheduled automations, plugins, persistent memory, parallel agents in isolated worktrees.<p>- Web cockpit with live run telemetry, plan pane, tool traces, source browser, and a host terminal.<p>Permissive by default. No per-command approval. Recovery is pre-run checkpoints, Git stash refs, and an append-only audit log. Keep it on loopback or in the container.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49591238)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T21:39:11Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
