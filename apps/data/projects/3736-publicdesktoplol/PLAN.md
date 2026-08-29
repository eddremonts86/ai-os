---
id: "3736"
slug: publicdesktoplol
title: publicdesktop.lol
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/publicdesktop-lol"
category: product-launch
date: "2026-08-27"
tags: [ProductHunt, Product Launch]
wtp:
  raw: $10 permanent icon slot (purchase); song auction has no quoted reserve in the source
  currency: USD
  period: one-shot
  min: 10
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# publicdesktop.lol

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
