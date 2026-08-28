---
id: "3117"
slug: i-built-a-tool-that-finds-people-asking-for-what-you-se
title: I built a tool that finds people asking for what you sell
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450777"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Next.js, TypeScript, PostgreSQL, OpenAI API, BullMQ + Redis, Reddit API, X API, LinkedIn API, Facebook API]
---
# I built a tool that finds people asking for what you sell

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3117-i-built-a-tool-that-finds-people-asking-for-what-you-se/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] URL ingestion across SaaS site, Etsy, App Store / Google Play, Fiverr, Skool
- [ ] Product-understanding step: page content → structured target-customer profile via LLM (no manual keywords)
- [ ] BullMQ workers for Reddit, X, LinkedIn and Facebook search windows
- [ ] Per-platform rate-limit tokens and quota accounting
- [ ] Judging-round LLM that ranks posts by likely-customer fit
- [ ] Pipeline view with dead / reached / closed states
- [ ] Daily cron: 24-hour refresh scan appended to existing leads
- [ ] Per-product cost guardrail so the $8 initial-scan ceiling is visible in the dashboard

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
