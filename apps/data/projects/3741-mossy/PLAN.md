---
id: "3741"
slug: mossy
title: Mossy
status: draft
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/mossy-2"
category: product-launch
date: "2026-08-24"
tags: [ProductHunt, Product Launch]
tech: [Vue 3 (animation), TanStack Start entry API, Postgres + Drizzle ORM, Cloudflare R2 image host, Lottie / Rive for the plant rig]
---
# Mossy

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
