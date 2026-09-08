---
id: "4199"
slug: nos4fun-a-functional-ios-4-recreation-in-the-browser
title: Nos4.fun – A functional iOS 4 recreation in the browser
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509167"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Nos4.fun – A functional iOS 4 recreation in the browser

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4199-nos4fun-a-functional-ios-4-recreation-in-the-browser/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the sixteen-framework hierarchy with the strict "nothing imported upward" rule (Foundation → CoreGraphics → UIKit → SpringBoard → apps), with a CI check that refuses an upward import.
- [ ] Implement the twenty-three apps (Safari, Mail, Messages, Phone, Maps, iPod, Photos, Camera, Notes, Weather, Stocks, Clock, Calculator, Compass, Voice Memos, Contacts, Settings, App Store, iTunes, Game Center, and two games) on top of the framework hierarchy.
- [ ] Build the SpringBoard surface: home, multitasking, folders, lock screen, dock, pages.
- [ ] Wire the third-party service integrations: OpenStreetMap tiles, Nominatim geocoding, OSRM routing, Open-Meteo weather, iTunes Search and iTunes RSS, Inter and Helvetica Neue typography.
- [ ] Build the optional Game Center: the Postgres backend, the schema, `pnpm service`, the leaderboards, with `DATABASE_URL` as the opt-in.
- [ ] Wire the pnpm scripts (`pnpm -C apps/Phone dev`, `pnpm dev`, `pnpm build`, `pnpm typecheck`, `pnpm banner`) and enforce `strict` typecheck as the CI gate.
- [ ] Add the per-asset attribution to The OldOS Project by Zane, the iPhone / iOS / Apple trademark notice on every surface, and the README's explicit "no shared code" statement.
- [ ] Run an end-to-end test: `pnpm install`, `pnpm -C apps/Phone dev` starts the phone, `pnpm typecheck` passes under strict, the framework-import-direction CI check passes, all twenty-three apps render, the third-party services respond, the trademark notice is on every surface, and (opt-in) Game Center connects to a Postgres backend and the leaderboards work.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy the production bundle at nos4.fun
- [ ] Document the strict-typecheck CI gate, the framework-import-direction CI check, and the asset / trademark notice enforcement in the README
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
