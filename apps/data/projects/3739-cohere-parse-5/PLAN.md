---
id: "3739"
slug: cohere-parse-5
title: Cohere Parse 5
status: draft
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/cohere-2"
category: product-launch
date: "2026-08-28"
tags: [ProductHunt, Product Launch]
tech: [TypeScript (Next.js), TanStack Start ingestion API, PostgreSQL with pgvector, Tesseract for image text layer, BentoML model orchestration]
---
# Cohere Parse 5

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
