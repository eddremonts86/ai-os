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

## Value Proposition

One keyboard-first Kanban surface that pairs every AI coding task with its own git worktree and its own embedded tmux session, and lets the agent itself drive the card transitions through CLI hooks.

## Target Users

- Multi-agent developers running Claude Code, Gemini CLI, Codex CLI, or OpenCode in parallel on one repo
- Solo founders who keep three or four branches open at once and lose context between them
- Small teams that want a shared Kanban view of agent work without a paid Jira or Linear seat

## Jobs To Be Done

- When I start Claude Code on a new branch, I want a Kanban card and a tmux session to appear automatically so I can track what the agent is doing without leaving the terminal
- When the agent finishes a tool call, I want the card to move columns on its own so I do not have to manually update the board
- When I want to inspect a branch in progress, I want its worktree to be one click away so I can diff, run tests, or open it in my editor

## Success Metrics

- Median time from agent task start to card appearing on the board under 5 seconds
- 80% of card transitions driven by hooks rather than manual drag-and-drop
- Retention of returning weekly-active users above 40% after the second agent-onboarding session

## Pricing & Monetization

_TODO:_ source did not state a price. README shows a Buy Me A Coffee link and AGPL-3.0 prohibits commercial SaaS; likely free + optional support contract.

## Competitive Landscape

- workmux — tmux-only workspace manager; no Kanban, no agent hooks
- vibe-kanban — BloopAI's AI-powered Kanban; no embedded terminal or worktree pairing
- Linear, Jira, Trello — general Kanban, no git worktree integration, no terminal embed
- Plain tmux + git worktree scripts — works but no shared visual layer

## Risks & Open Questions

- Hook schemas drift across CLI providers; one upstream change can break card transitions
- AGPL-3.0 may deter enterprise adoption
- Electron distribution adds a real binary footprint per platform