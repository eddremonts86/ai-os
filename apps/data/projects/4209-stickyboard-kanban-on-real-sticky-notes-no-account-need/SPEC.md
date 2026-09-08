---
id: "4209"
slug: stickyboard-kanban-on-real-sticky-notes-no-account-need
title: "Stickyboard – Kanban on real sticky notes, no account needed"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508721"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Stickyboard – Kanban on real sticky notes, no account needed

## Problem

Most Kanban tools require an account, a sync round-trip, and a learning curve before you can move your first sticky note. The poster's site (stickyboard.dev) opens with "your projects, on real sticky notes" and shows three columns — To Do, Doing, Done — populated with three example notes ("drag me to done", "click me to edit", "press n for a new note"). The visible keyboard shortcuts are `n` for a new note, `b` for a new board, `1`–`9` to switch board, and `Cmd-Z` for undo. The footer note says "your notes live only in this browser, for now. sign up free to keep them everywhere." Notes hold checklists, colours, and sketches.

## Objective

Make the simplest possible Kanban: real sticky notes, drag them between columns, no signup, no install, just the keyboard.

## Target Users

- People who want to try a Kanban before committing to an account
- Students and hobbyists running personal project boards
- Anyone who prefers the keyboard to the mouse
- Casual teams who already use Notion or Linear and want a side Kanban for scratch work

## MVP Scope

- Drag-and-drop sticky notes between To Do / Doing / Done columns
- New note (`n`), new board (`b`), switch board (`1`–`9`), undo (`Cmd-Z`)
- Notes with checklists, colours, and sketches
- Browser-local persistence; signup optional for sync across devices

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- No account required for the core experience
- Browser-local persistence by default
- Keyboard-first interaction
- Signup is optional and free