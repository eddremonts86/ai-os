---
id: "3688"
slug: a2acast-let-ai-agents-on-different-computers-work-toget
title: A2acast – Let AI agents on different computers work together
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484874"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python (stdlib only single-file CLI), ntfy relay transport, asymmetric end-to-end encryption, plugins for Claude Code, Codex CLI, Copilot CLI]
---
# A2acast – Let AI agents on different computers work together

## Problem

AI coding assistants (Claude Code, ChatGPT Codex CLI, GitHub Copilot CLI) each run a single local session and have no built-in way to talk to a peer session on another machine. Users who want to coordinate work between sessions have to copy-paste prompts and outputs manually between machines, run a public server that requires accounts and open ports, or build a custom relay themselves. A2acast (https://github.com/husker/a2acast) ships as one stdlib-only Python file (`mesh.py`) and an `ntfy`-backed relay transport so two machines can exchange messages and A2A tasks with no server, no accounts, and no open network ports, end-to-end encrypted; the README's four advertised use cases are (1) coordinating tasks between coding assistants on separate machines, (2) waking one session from another to run a task and report results, (3) delegating coding tasks to a pool of worker machines each in an isolated Git worktree, and (4) connecting Claude Code + Codex CLI + Copilot CLI sessions into one collaborative mesh.

## Objective

Ship a self-hosting, zero-infrastructure mesh that lets any two AI coding assistants on any two machines exchange messages and delegate tasks end-to-end without a server, accounts, or open ports, with a setup time of roughly five minutes and plugins for Claude Code, Codex CLI, and Copilot CLI so that sessions auto-arm presence at session start and wake on inbound messages without manual relay.

## Target Users

- Primary: developers who run Claude Code on one machine and Codex CLI or Copilot CLI on another and want the two sessions to delegate tasks to each other without manual copy-paste.
- Secondary: solo developers or small teams that want to spread parallel coding work across a pool of worker machines, each running an isolated Git worktree, coordinated by a single "controller" session.
- Tertiary: AI-coding enthusiasts who want to mix and match CLIs (Claude + ChatGPT desktop + Copilot) into one mesh and experiment with cross-vendor collaboration.

## MVP Scope

- One stdlib-only Python file (`mesh.py`) implementing `init`, `join`, `send`, `ping`, `ask --wait N`, and the watcher for inbound messages.
- Join-code-based mesh creation: `mesh init home` on machine A prints a curl/paste block to run on machine B; B downloads `mesh.py` and joins with `python3 mesh.py join mesh1-XXXX...` and picks its name from the hostname.
- End-to-end encrypted transport over an `ntfy` topic so neither side needs an open inbound port, accounts, or a self-hosted server.
- Plugins for Claude Code (asynchronous Stop + asyncRewake), Codex CLI (Stop hook), and Copilot CLI (MCP-server watcher wired per project in `.github/mcp.json`).
- One-time setup commands per CLI (`mesh claude-setup` per project; `mesh codex-setup` per machine; `mesh copilot-setup` per project) that arm presence at session start.
- `MESH_NODE_JOINED` print when a peer joins, `MESH_PONG node=NODE rtt=~400ms` on `mesh ping NODE`, and `mesh ask NODE "..." --wait 300` for delegated task execution with a result reply.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Must remain a single stdlib-only Python file (`mesh.py`) so it can be `curl | python3 mesh.py join ...` on a fresh machine with no `pip install`.
- Must not require a custom server, an account, or an open inbound port on either peer; transport rides on the `ntfy` relay.
- Messages must be end-to-end encrypted with the join code as the shared secret — no plaintext on the relay.
- Setup must take roughly five minutes from `pipx install git+https://github.com/husker/a2acast` to a first `mesh send all "hello mesh"` round-trip; no per-CLI plugin should add more than a single one-time setup command.
