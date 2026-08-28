---
id: "3128"
slug: getting-more-users-for-my-projects
title: Getting more users for my projects
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450064"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Marketing, Indie]
tech: [TypeScript, React, Node.js, SQLite, Cloudflare Workers]
---
# Getting more users for my projects

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3128-getting-more-users-for-my-projects/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up the SQLite schema for projects, pairs, and the impression ledger
- [ ] Provision the Cloudflare Worker project for the impression redirect

## Phase 1: Core

- [ ] Submission form: project name, one-line description, audience description, target URL
- [ ] Moderation queue page behind staff login
- [ ] Keyword-overlap matcher that scores two audience descriptions
- [ ] Daily scheduled job that emits a pair schedule into the queue
- [ ] Impression Worker: `/_i/{id}` redirect with IP-day dedupe and click logging
- [ ] Maker dashboard: served count, received count, balance, click-through rate
- [ ] Fairness floor: cap on consecutive pairings with the same counterparty
- [ ] Public changelog so makers can see what changed in the matching rule

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
