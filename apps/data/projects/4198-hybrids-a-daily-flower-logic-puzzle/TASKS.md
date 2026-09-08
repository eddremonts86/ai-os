---
id: "4198"
slug: hybrids-a-daily-flower-logic-puzzle
title: "Hybrids – a daily flower logic puzzle"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509199"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Hybrids – a daily flower logic puzzle

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4198-hybrids-a-daily-flower-logic-puzzle/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Hand-authored puzzle data format and one example puzzle
- [ ] React + TypeScript single-page app with daily fetch
- [ ] Mobile-first flower grid with tap-to-hybrid interaction
- [ ] Solve detection and shareable emoji grid
- [ ] Cron job for daily puzzle release at midnight
- [ ] Service worker for offline tile rendering
- [ ] Optional archive view gated to logged-in users

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Optional: light analytics for daily active players, no PII