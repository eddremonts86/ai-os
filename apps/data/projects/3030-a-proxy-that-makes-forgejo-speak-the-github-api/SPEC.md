---
id: "3030"
slug: a-proxy-that-makes-forgejo-speak-the-github-api
title: A proxy that makes Forgejo speak the GitHub API
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49443920"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A proxy that makes Forgejo speak the GitHub API

## Problem

Hello HN,After seeing all of the pushback and negative sentiment regarding GitHub and its poor reliability and everyone trying to move off of it, I decided to build this to make the transition easier.It's the second half of a two-part project. Shotgun (https://github.com/ThatXliner/shotgun) diffs two OpenAPI specs and auto-maps what lines up, which turns out to be 60-80% of endpoints when both APIs are in the same domain. Anvil is the opinionated result of running that on GitHub vs Forgejo and then hand-fixing everything the auto-mapping got wrong or couldn't express.Landing page with a demo: https://bryanhu.com/anvil/

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
