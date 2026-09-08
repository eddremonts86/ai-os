---
id: "4152"
slug: what-to-do-when-a-vendor-doesnt-respond-to-security-iss
title: "What to do when a vendor doesn't respond to security issues?"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507259"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# What to do when a vendor doesn't respond to security issues?

## Phase 0: Scaffold

- [ ] Set up the static page in the existing TanStack Start app
- [ ] Pick the markdown source path
- [ ] Minimal styling consistent with design tokens
- [ ] README with a link back to the HN thread

## Phase 1: Core

Write the six-step escalation flow: (1) confirm and minimise the repro, (2) capture timestamped evidence, (3) retry the vendor with a non-weaponised PoC, (4) engage the national CSIRT and ENISA as coordinator, (5) consult a lawyer before any public disclosure, (6) after a defined waiting period consider coordinated public disclosure. Link canonical sources and label any time-bound claim as derived from CVD norms.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production