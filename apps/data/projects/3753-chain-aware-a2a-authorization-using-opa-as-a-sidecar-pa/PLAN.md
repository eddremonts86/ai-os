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
