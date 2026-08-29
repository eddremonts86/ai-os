---
id: "3738"
slug: hy4-preview
title: Hy4 preview
status: draft
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/hunyuan-a13b"
category: product-launch
date: "2026-08-28"
tags: [ProductHunt, Product Launch]
tech: [Vue 3 (chat frontend), TanStack Start API, PostgreSQL with pgvector, Cloudflare Workers inference proxy, "Weights & Biases"]
---
# Hy4 preview

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
