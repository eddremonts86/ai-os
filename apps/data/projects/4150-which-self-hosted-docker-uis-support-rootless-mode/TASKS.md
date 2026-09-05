---
id: "4150"
slug: which-self-hosted-docker-uis-support-rootless-mode
title: Which self-hosted Docker UIs support rootless mode?
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508552"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Which self-hosted Docker UIs support rootless mode?

## Phase 0: Scaffold

- [ ] Set up the static page in the existing TanStack Start app
- [ ] Pick the markdown source path
- [ ] Minimal styling consistent with design tokens
- [ ] README with a link back to the HN thread

## Phase 1: Core

Walk the ten UIs (Portainer, Dockge, Dockhand, Arcane, Dokploy, Coolify, Komodo, Runtipi, Rancher, Stacker), capture each UI's documented rootless story with a link to the doc or release note, populate the table, and write a short header that names the snapshot date and the scope (the ten UIs in the post, no more).

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production