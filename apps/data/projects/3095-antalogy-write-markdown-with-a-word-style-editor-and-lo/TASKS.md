---
id: "3095"
slug: antalogy-write-markdown-with-a-word-style-editor-and-lo
title: Antalogy – Write Markdown with a Word-style editor and local LLM
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/antalogy?utm_campaign=startup-184321&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Antalogy – Write Markdown with a Word-style editor and local LLM

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3095-antalogy-write-markdown-with-a-word-style-editor-and-lo/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Desktop shell (Electron or Tauri) hosting the React editor with local file IO
- [ ] Markdown editor core + Word-style ribbon (bold / italic / headings / lists / tables / links)
- [ ] `.docx` open with formatting preserved + save back to clean `.md` (round-trip fidelity tests against 50 real `.docx` files)
- [ ] AI Assistant pane: chat UI + selection-aware actions (rewrite / summarize / expand)
- [ ] OpenAI-compatible endpoint config (base URL + API key + model) for local / on-prem / cloud
- [ ] CI gate: app runs end-to-end with network unplugged, no outbound calls (no-telemetry proof)
- [ ] Cross-platform installers: macOS / Windows / Linux
- [ ] Settings screen + endpoint onboarding flow

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
