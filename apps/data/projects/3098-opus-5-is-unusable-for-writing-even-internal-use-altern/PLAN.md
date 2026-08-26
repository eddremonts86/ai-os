---
id: "3098"
slug: opus-5-is-unusable-for-writing-even-internal-use-altern
title: "Opus 5 is unusable for writing, even internal use. Alternatives/fix?"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49446257"
category: ask-hn
date: "2026-08-26"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Opus 5 is unusable for writing, even internal use. Alternatives/fix?

## Tech Stack

- **Frontend:** React + TypeScript
- **Backend:** Node.js API (TanStack Start)
- **DB:** SQLite with Drizzle ORM
- **Deployment:** Coolify + Docker

## Architecture

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Client    │────▶│   API       │────▶│   DB        │
└─────────────┘     └─────────────┘     └─────────────┘
```

## Milestones

1. **M0:** Project setup + SPEC.md + DESIGN.md approved
2. **M1:** Scaffold + auth
3. **M2:** Core feature
4. **M3:** Testing + deployment

## Risks

- Dependency on external APIs
- Ambiguous scope without further detail
