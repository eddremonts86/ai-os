---
id: "3389"
slug: rook-a-multi-agent-harness-that-lives-100-in-a-browser-
title: "Rook – A multi-Agent harness that lives 100% in a browser extension"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49456492"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [JavaScript, Chrome MV3 extension APIs, OPFS, Web Workers with embedded SQLite (wa-sqlite), Chrome extension sandbox API, optional companion PWA]
---

# Rook – A multi-Agent harness that lives 100% in a browser extension

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3389-rook-a-multi-agent-harness-that-lives-100-in-a-browser-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the MV3 manifest with the service worker, sandbox declaration, OPFS permission, alarms permission, and WebSocket host permissions for Slack and Discord
- [ ] Implement the Web Worker host that creates one worker per agent address and re-spawns on service-worker kill
- [ ] Integrate wa-sqlite into each worker as the agent's durable store and address-indexed memory
- [ ] Build the execute tool: the model emits JS, it runs inside the Chrome extension sandbox API, and the result is returned to the model
- [ ] Build the bash tool: the model emits shell, executed over OPFS via a JS shell layer
- [ ] Wire OPFS as the per-extension private filesystem and add File System Access directory mounts for user folders
- [ ] Add the OpenAI API key path and the ChatGPT subscription path with model-side tool selection
- [ ] Add the Playwright/WebMCP browser-use path that runs model-authored scripts inside the same sandbox
- [ ] Implement Slack and Discord WebSocket adapters that translate inbound messages into tool calls
- [ ] Add the alarms API integration for recurring routines the user schedules inside the extension
- [ ] Build the React popup and options UI for managing agents, providers, mounts and routines
- [ ] Build the optional companion PWA that connects over WebSocket to the extension and relays captchas

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-27_