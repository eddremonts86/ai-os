---
id: "3014"
slug: particle-extract-and-save-articles-in-a-clean-self-host
title: "Particle – Extract and save articles in a clean, self-hosted reader"
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49339175"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Particle – Extract and save articles in a clean, self-hosted reader

## Phase 0: Scaffold

- [ ] Create project folder `apps/3014-particle/`
- [ ] Initialize Node + TypeScript repo with Svelte for the front end
- [ ] Wire design tokens from DESIGN.md into the global stylesheet
- [ ] Author the SQLite schema: `articles` (URL, extracted HTML, source domain, saved-at, read state)
- [ ] Add a minimal README documenting the self-host assumption and the export-to-HTML path
- [ ] Add a one-page install guide plus a single docker-compose file

## Phase 1: Core

- [ ] Wrap `@mozilla/readability` in a Node adapter that fetches a URL and returns clean HTML
- [ ] Build the extraction endpoint `POST /api/extract`
- [ ] Build the reader view: render extracted HTML with adjustable typography (font size, line height, light/dark theme), "mark as read" action
- [ ] Build the library view: list saved articles by date and by source domain, click into reader
- [ ] Implement the save-to-SQLite path on the extraction endpoint
- [ ] Add the PWA service worker (Workbox or hand-rolled) plus the web manifest
- [ ] Add the install button in the UI and a custom install page
- [ ] Implement export-to-HTML: a folder of static files the user can download
- [ ] Add the mobile share-sheet target where the platform supports it
- [ ] Build the 100-URL regression test set covering major publications and run it in CI
- [ ] Add the "report bad extraction" link in the reader view
- [ ] Dogfood for two weeks as the primary reading tool before declaring v1

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Publish a single docker-compose file plus the one-page install guide
- [ ] Deploy a reference instance behind HTTPS to verify the PWA install path end-to-end
- [ ] Wire CI: type-check + extractor regression test set on every push
- [ ] Document the "vacuum" admin endpoint and the export-to-HTML recovery path in the README
