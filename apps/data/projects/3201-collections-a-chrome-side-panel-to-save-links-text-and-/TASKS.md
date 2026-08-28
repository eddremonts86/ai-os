---
id: "3201"
slug: collections-a-chrome-side-panel-to-save-links-text-and-
title: "Collections, a Chrome side panel to save links, text and images"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49451455"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Collections, a Chrome side panel to save links, text and images

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3201-collections-a-chrome-side-panel-to-save-links-text-and-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up the Manifest V3 extension scaffold with the side panel registered

## Phase 1: Core

- [ ] Build the side panel UI in React + TypeScript with named collections and a list view per collection
- [ ] Wire chrome.storage.local as the persistence layer (no server)
- [ ] Implement the content script that reads the active tab's selection or image URL on drag
- [ ] Implement drag-and-drop intake for links, selected passages, and images into the side panel
- [ ] Add a per-site fallback when the content script cannot read the page; show a clear "not supported here" message instead of silently failing
- [ ] Implement one-click "save current tab" as a link entry to the active collection
- [ ] Implement the Markdown export that copies the entire collection to the clipboard as a single Markdown document
- [ ] Debounce storage writes so a burst of drags does not hammer chrome.storage
- [ ] Add a "storage full" UI that tells the user what hit the quota and offers eviction
- [ ] Add an optional Google sync toggle behind a feature flag; treat it strictly as a write-only mirror
- [ ] Write tests for the intake pipeline (mocked content scripts), the Markdown serializer, and the chrome.storage quota path

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Submit the extension to the Chrome Web Store
- [ ] Verify in production
- [ ] Smoke-test: install the extension, drag a link and a passage from a real article into a named collection, save the current tab, copy the collection as Markdown, paste it into a notes app, and confirm the format is clean

---

_Generated automatically by Lúa on 2026-08-26_
