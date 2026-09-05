---
id: "4196"
slug: i-built-a-social-web-experiment-where-anyone-can-hijack
title: "I built a social web experiment where anyone can hijack my domain"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509486"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I built a social web experiment where anyone can hijack my domain

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4196-i-built-a-social-web-experiment-where-anyone-can-hijack/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] React landing page with $5 button, live counters, and recent activity feed
- [ ] TanStack Start API for webhook ingestion, leaderboard, and redirect control
- [ ] SQLite + Drizzle schema for buyers, cumulative spend, and activity log
- [ ] Whop webhook integration with payment signature verification
- [ ] Apex domain DNS update via Cloudflare API
- [ ] "Report this destination" button with operator override
- [ ] Rate limiting on the $5 endpoint and abuse heuristics

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Optional: independent abuse-monitoring endpoint with on-call rotation