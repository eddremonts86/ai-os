---
id: "4192"
slug: kanvibe-git-worktree-and-tmux-kanban-board-for-ai-clis-
title: "KanVibe – Git worktree and tmux Kanban board for AI CLIs, now Electron"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509626"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# KanVibe – Git worktree and tmux Kanban board for AI CLIs, now Electron

## Tech Stack

- React + TypeScript single-page app (Vite, pnpm workspaces)
- TanStack Start for the Node.js API layer
- Electron host that wraps the same React bundle (electron-builder for packaging)
- SQLite with Drizzle ORM for task, worktree, and session state
- tmux and zellij as the embedded terminal multiplexer (CLI invocation over local socket)
- Coolify + Docker for self-hosted distribution
- Git CLI for worktree create, checkout, and cleanup

## Architecture

The Electron and browser hosts share one React + TanStack Start app. The Kanban board is a real-time view that subscribes to a server-sent event stream from the TanStack Start API. The API persists card state, worktree metadata, and AI quota snapshots in SQLite. The CLI integration runs as small hook scripts inside Claude Code, Gemini CLI, Codex CLI, and OpenCode installations; each script POSTs a structured event to the API on tool use, tool result, and stop. The terminal embed is an xterm.js pane that attaches to a tmux or zellij session that the server has spawned per task, with the working directory set to the matching git worktree.

## Milestones

1. Monorepo skeleton with shared React bundle, TanStack Start routes, and SQLite schema
2. Browser-only Kanban board with manual drag-and-drop transitions and git worktree creation per card
3. Embedded xterm.js pane bound to a per-card tmux session
4. CLI hook scripts for Claude Code, Gemini CLI, Codex CLI, and OpenCode that POST transition events
5. AI usage panel showing remaining quota per account and per model
6. Electron host wrapping the same app with native menu and notifications
7. Coolify + Docker deployment recipe and AGPL-3.0 distribution packaging

## Risks

- Four divergent CLI hook schemas mean ongoing maintenance as each provider ships changes
- tmux session lifecycle on the desktop is brittle when the app quits unexpectedly; needs a watchdog
- AGPL-3.0 may limit paid distribution; plan for a separate commercial offering if traction appears
- SQLite writes from concurrent agent hooks need careful transaction design