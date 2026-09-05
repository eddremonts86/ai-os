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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4192-kanvibe-git-worktree-and-tmux-kanban-board-for-ai-clis-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Monorepo skeleton with pnpm workspaces and shared React + TypeScript build
- [ ] TanStack Start API with SQLite + Drizzle schema for tasks, worktrees, sessions, and AI quota
- [ ] Kanban board UI with manual drag-and-drop and per-card git worktree creation
- [ ] Embedded xterm.js pane bound to a per-card tmux or zellij session
- [ ] Hook scripts for Claude Code, Gemini CLI, Codex CLI, and OpenCode that POST transition events to the API
- [ ] AI usage panel showing per-account and per-model remaining quota
- [ ] Keyboard shortcut layer (project filter, task search, notifications, panel toggle)

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Electron host packaging with electron-builder for macOS, Linux, Windows
- [ ] Document the AGPL-3.0 obligations and a sample self-hosted Coolify recipe