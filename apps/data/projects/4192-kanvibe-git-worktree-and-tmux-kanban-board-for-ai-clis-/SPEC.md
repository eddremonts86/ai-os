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

## Problem

AI coding agents — Claude Code, Gemini CLI, Codex CLI, OpenCode — scatter their work across multiple terminal tabs. A user running three agents on three branches loses track of which session is editing which file, which branch is uncommitted, and which task is still pending. The poster's own tooling, KanVibe, attaches each Kanban task to a real git worktree and a tmux or zellij session, then drives task transitions from the CLI agent's own hooks (not from a human at the keyboard). Source repository: rookedsysc/kanvibe. README: "Keyboard-first desktop Kanban workspace for AI coding agents with embedded terminals, git worktrees, and hook-driven task tracking." Existing installers are workmux (tmux workspace manager) and vibe-kanban (BloopAI's AI-powered Kanban); KanVibe fuses both into a single Electron desktop + browser surface, with AGPL-3.0 licensing.

## Objective

Give a developer running multiple AI coding agents on the same repository one place to see every branch, every task, and every embedded terminal, and let each agent's hook events advance the Kanban card instead of forcing the developer to context-switch.

## Target Users

Software developers running Claude Code, Gemini CLI, Codex CLI, or OpenCode on real repositories, who already use git worktrees for parallel branches, and who want keyboard-first control without leaving the terminal pane.

## MVP Scope

- Desktop (Electron) and browser hosts sharing one React + TanStack Start stack
- Real-time Kanban board whose columns reflect branch state (To Do / Doing / Review / Done)
- Embedded tmux / zellij pane per task, opened inline in the task detail view
- Hook-driven task transition: Claude Code PreToolUse, PostToolUse, and Stop events move cards
- Git worktree creation per card with one-click checkout and cleanup
- AI usage panel that surfaces per-account Claude / Codex / Gemini quota remaining
- Keyboard shortcuts for project filter, task search, notifications, panel toggles

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- AGPL-3.0 license — commercial SaaS redistribution is forbidden; self-hosting and forks for open-source use are permitted
- The server must run self-hosted; the README expects Coolify deployment
- Hook contracts must be stable across Claude Code, Gemini CLI, Codex CLI, and OpenCode (four separate hook schemas)
- No lock-in to one agent provider; the same board must work when a user switches primary CLI