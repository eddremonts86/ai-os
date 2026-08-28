---
id: "3158"
slug: typebase-a-single-folder-back-end-you-write-in-typescri
title: Typebase – A single-folder back end you write in TypeScript
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447178"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [TypeScript, oRPC, Drizzle, better-auth, Neon, Vercel, Cloudflare Workers, Deno Deploy]
---
# Typebase – A single-folder back end you write in TypeScript

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3158-typebase-a-single-folder-back-end-you-write-in-typescri/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Define the `typebase/` folder convention: `schema.ts` for tables and exported server functions as TS.
- [ ] Wire oRPC as the wire layer between server functions and client calls.
- [ ] Wire Drizzle as the database layer against a Neon Postgres instance.
- [ ] Wire better-auth as the built-in auth surface.
- [ ] Confirm a client TS file can call a server function with full end-to-end typing (no manual casts).
- [ ] Stub the CLI surface that targets Vercel, Cloudflare Workers, and Deno Deploy.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
