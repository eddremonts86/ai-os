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

## Tech Stack

- React + TypeScript single-page app
- TanStack Start as the Node.js API for the optional account / sync layer
- SQLite with Drizzle ORM for boards, notes, and history when the user signs up
- Coolify + Docker for self-hosting
- Browser localStorage / IndexedDB for the no-account experience
- Drag-and-drop library or native HTML5 DnD for the stickies
- Canvas or SVG for in-note sketches
- Optional: WebSocket or CRDT for real-time collaboration later

## Architecture

The client renders a board of columns (To Do, Doing, Done) populated by sticky notes. Notes support checklists, colours, and sketches. Without an account, all state is browser-local (IndexedDB or localStorage); a free signup unlocks cross-device sync via the TanStack Start API. Keyboard shortcuts are global and override default browser behaviour where appropriate.

## Milestones

1. Three-column board with drag-and-drop stickies
2. Keyboard layer (n, b, 1–9, Cmd-Z)
3. Notes with checklists, colours, sketches
4. Browser-local persistence
5. Optional free signup and cross-device sync
6. Optional collaboration via WebSocket or CRDT

## Risks

- Free + browser-local has unclear monetisation
- Mobile drag-and-drop UX is awkward without a long-press hint
- Cross-device sync without account is impossible
- Sketch capture inside a sticky note is hard on touch devices