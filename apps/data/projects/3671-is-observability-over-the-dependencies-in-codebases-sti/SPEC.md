---
id: "3671"
slug: is-observability-over-the-dependencies-in-codebases-sti
title: Is observability over the dependencies in codebases still a problem?
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484284"
category: ask-hn
date: "2026-08-28"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Is observability over the dependencies in codebases still a problem?

## Problem

Almost every codebase is calling a REST, gRPC, or a GraphQL API or using SDKs from an external or event internal provider. It gets harder to keep track of everything when the codebase matures and increases in size and from my experience sometimes it gets hard to respond to changes in time or even become aware that a dependency is deprecated and their API has changed completely.
Do developers need better tools that to improve dependency and integration management?

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
