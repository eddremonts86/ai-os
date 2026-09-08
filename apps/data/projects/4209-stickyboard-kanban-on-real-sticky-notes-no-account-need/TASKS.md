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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4209-stickyboard-kanban-on-real-sticky-notes-no-account-need/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Three-column board with drag-and-drop stickies
- [ ] Keyboard layer: n (new note), b (new board), 1–9 (switch), Cmd-Z (undo)
- [ ] Notes with checklists, colours, sketches
- [ ] Browser-local persistence in IndexedDB / localStorage
- [ ] Mobile-friendly long-press to start drag
- [ ] Optional free signup with cross-device sync
- [ ] Optional real-time collaboration via WebSocket / CRDT

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Optional Pro tier (collaboration, history, integrations)