---
id: "3742"
slug: seendiff
title: seendiff
status: draft
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/seendiff"
category: product-launch
date: "2026-08-25"
tags: [ProductHunt, Product Launch]
tech: [Vue 3 + Vite, TanStack Start ingestion API, Postgres + Drizzle ORM, Cloudflare R2 for diff raw storage, Monaco editor for the split view]
---
# seendiff

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
