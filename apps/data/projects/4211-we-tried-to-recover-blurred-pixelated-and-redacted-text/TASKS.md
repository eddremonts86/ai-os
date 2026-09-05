---
id: "4211"
slug: we-tried-to-recover-blurred-pixelated-and-redacted-text
title: "We tried to recover blurred, pixelated and redacted text (480 cases)"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508614"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# We tried to recover blurred, pixelated and redacted text (480 cases)

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4211-we-tried-to-recover-blurred-pixelated-and-redacted-text/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Browser-local blur / pixelate / solid-box pipeline
- [ ] Parametric rule check (radius ≥ 0.8 × font size)
- [ ] Default to solid-box redaction with a clear warning on weaker treatments
- [ ] Study blog with methodology, results table, and parametric rule
- [ ] CC-BY dataset and reproduction kit published
- [ ] Optional Tauri / Electron desktop overlay
- [ ] Reference 480-case dataset under CC-BY

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Optional Pro tier for teams and SDK