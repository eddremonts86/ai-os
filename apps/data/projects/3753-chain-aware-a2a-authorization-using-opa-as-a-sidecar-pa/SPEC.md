---
id: "3753"
slug: chain-aware-a2a-authorization-using-opa-as-a-sidecar-pa
title: Chain-aware (A2A) authorization using OPA as a sidecar pattern
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488952"
category: ask-hn
date: "2026-08-29"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Chain-aware (A2A) authorization using OPA as a sidecar pattern

## Problem

I keep getting queries about A2A authorization and where should it sit, whether it should be done by AI Gateway and what is a better pattern.
We at Leanroute, think that OPA as a sidecar pattern is suitable for this chain-aware of authorization. Thoughts?
https://leanroute.dev/blog/chain-aware-authorization-opa-sidecar-mcp

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
