---
id: "3633"
slug: contextswitch-make-your-llm-chats-provider-agnostic
title: ContextSwitch – Make your LLM chats provider agnostic
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481375"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Manifest V3, TypeScript, Vite, chrome.storage.local, Playwright (dev-time selectors), Vitest]
---
# ContextSwitch – Make your LLM chats provider agnostic

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3633-contextswitch-make-your-llm-chats-provider-agnostic/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Scaffold the Manifest V3 extension with TypeScript and a Vite build that emits a valid unpacked extension
- [ ] Implement the service-worker click handler and the popup stub with the slice-size and destination controls
- [ ] Add the source-side content script for ChatGPT with the selector module and the message-shape contract
- [ ] Add the destination-side content script for ChatGPT that locates the composer and inserts the chosen slice
- [ ] Repeat the source and destination content scripts for Claude
- [ ] Repeat the source and destination content scripts for Gemini
- [ ] Implement the slice-counting logic for full conversation, last 10 messages and last 20 messages, with edge cases for hidden and grouped messages
- [ ] Persist the most-recent-transfer metadata in chrome.storage.local, containing no conversation text
- [ ] Add the Playwright selector harness that runs on a schedule against the three live providers
- [ ] Add CI that asserts no remote endpoints are contacted at runtime and that host permissions stay at the three providers
- [ ] Add Vitest unit tests for the slice-counting and the message-shape logic, isolated from the live providers
- [ ] Package the extension for the Chrome Web Store and Edge Add-ons submissions and wire the contact path the source page already describes

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
