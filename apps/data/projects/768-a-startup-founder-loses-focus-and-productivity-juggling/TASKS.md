---
id: "768"
slug: a-startup-founder-loses-focus-and-productivity-juggling
title: "A startup founder loses focus and productivity juggling 5-7 tools for a single project. Existing «all-in-one» platforms don't provide the feel of a unified workspace."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/nglbafr5o1-a-startup-founder-loses-focus-and-produc"
category: productivity
date: "2026-02-09"
tags: [Productivity, Startups, Other]
country: India
tech: [Tauri, Rust, TypeScript, Solid.js, SQLite, CRDT (Automerge), Local-first sync]
---
# A startup founder loses focus and productivity juggling 5-7 tools for a single project. Existing «all-in-one» platforms don't provide the feel of a unified workspace.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/768-a-startup-founder-loses-focus-and-productivity-juggling/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up Tauri (Rust) + Solid.js + TypeScript with SQLite as the local store
- [ ] Build the unified cross-reference table with bi-directional query materialisation
- [ ] Implement the five modules: tasks, notes, docs, calendar events, and contacts
- [ ] Build the keyboard-first command palette that opens any entity and creates a new one without leaving the keyboard
- [ ] Add live cross-reference rendering in both directions in every entity view
- [ ] Implement the workspace-wide search index with relevance ranking that prefers founder intent
- [ ] Wire Automerge CRDT sync for sync-across-devices with conflict-free merge
- [ ] Add the import paths for CSV (tasks, contacts) and Markdown (notes, docs)
- [ ] Build the viewer-only share link for any doc without inviting the recipient to the workspace
- [ ] Implement the week view combining calendar events with tasks-due-today
- [ ] Add the quick-capture keystroke that opens a task or note without a modal
- [ ] Write an integration test that exercises a CRDT merge across two devices after offline edits on each

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
