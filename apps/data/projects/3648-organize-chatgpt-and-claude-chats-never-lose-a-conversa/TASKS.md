---
id: "3648"
slug: organize-chatgpt-and-claude-chats-never-lose-a-conversa
title: Organize ChatGPT and Claude chats. Never lose a conversation
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483647"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Next.js, TypeScript, PostgreSQL, OpenAI API, Playwright (chatgpt/claude scrapers), BullMQ, Tailwind CSS]
---
# Organize ChatGPT and Claude chats. Never lose a conversation

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3648-organize-chatgpt-and-claude-chats-never-lose-a-conversa/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Implement paste, capture and official-export imports for ChatGPT and Claude into a common envelope
- [ ] Persist conversations in PostgreSQL with the folder, tag, provider and full message log
- [ ] Build the full-text search index and a list-and-detail UI with a provider filter
- [ ] Ship the folder and tag model with bulk operations
- [ ] Add per-conversation export that produces a self-contained file the user can store elsewhere
- [ ] Implement the source-drift check with a visible flag on the list and a re-import path
- [ ] Make the read-only nature of the product obvious in the UI
- [ ] Document the retention and deletion posture per conversation and per account
- [ ] Capture attachments as bytes during import, not as URLs, so provider-side URL rot does not break the stored record
- [ ] Verify the search index covers every stored conversation, not only the most recent

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
