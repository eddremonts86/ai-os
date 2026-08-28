---
id: "3204"
slug: ancestree-give-your-family-members-biographies
title: Ancestree – Give your family members biographies
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49451007"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Ancestree – Give your family members biographies

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3204-ancestree-give-your-family-members-biographies/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up the TanStack Start skeleton with a static-export build so the app is self-hostable

## Phase 1: Core

- [ ] Define the typed Person, Relationship, and Chapter data models
- [ ] Wire IndexedDB as the only persistence layer; no network writes for user content
- [ ] Build the tree editor: add people, link them as parent/child or partner
- [ ] Build the per-person "book" view that lists the chapters written for that person and lets the user add new ones
- [ ] Implement the normal tree export (a clean printable view of the family tree)
- [ ] Implement the detailed tree export (the same tree plus the per-person metadata and chapter summaries)
- [ ] Implement the per-person biography export that turns one person's chapters into a single long-form document with paragraph breaks and an optional lead paragraph
- [ ] Add a first-run banner that makes the browser-local-only storage model explicit
- [ ] Add a post-edit export prompt so users do not lose work to a browser-data clear
- [ ] Add a network-call audit step in CI that fails the build if any code path ships user content off the device
- [ ] Write tests for the data model, the tree-editor link logic, and the three export serializers

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy the static site to Coolify
- [ ] Verify in production
- [ ] Smoke-test: build a small tree with three generations, write two chapters per person, run each of the three exports, and confirm the per-person export reads as a real biography

---

_Generated automatically by Lúa on 2026-08-26_
