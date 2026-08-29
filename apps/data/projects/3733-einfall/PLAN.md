---
id: "3733"
slug: einfall
title: Einfall
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/einfall-a-place-for-fugitive-thoughts"
category: product-launch
date: "2026-08-24"
tags: [ProductHunt, Product Launch]
wtp:
  raw: $29.99 one-time for unlimited routing (15 free routing actions)
  currency: USD
  period: one-shot
  min: 29.99
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Einfall

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
