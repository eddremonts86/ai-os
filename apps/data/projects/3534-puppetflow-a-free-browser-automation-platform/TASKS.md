---
id: "3534"
slug: puppetflow-a-free-browser-automation-platform
title: Puppetflow a free browser automation platform
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49476246"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Node.js, Puppeteer, React, InertiaJS, Laravel, SQLite, Docker]
---

# Puppetflow a free browser automation platform

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3534-puppetflow-a-free-browser-automation-platform/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Laravel backend with workflow storage in SQLite, the run/execution-history schema, and the API surface the React + InertiaJS frontend will call.
- [ ] Implement the Node.js + TypeScript runner wrapping Puppeteer, producing per-step traces (DOM, console, network) and persisting runs to the backend.
- [ ] Build the live runner view: a real-time UI that mirrors a running workflow and accepts mouse/keyboard emulation, with a documented sync strategy for the runner state.
- [ ] Implement per-run replay: replay any past run step by step with the same DOM, console, and network state at each step.
- [ ] Add the Blueprint format, the in-app browser, and the PR-based publishing flow that targets github.com/puppetflow/library.
- [ ] Add the AI hook as an opt-in: "talk to the model" and "hand it control of the browser", with step-level logging that matches the deterministic trace format.
- [ ] Integrate the anti-bot layer (start with fingerprint-chromium) and document the supported detection surfaces honestly.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
