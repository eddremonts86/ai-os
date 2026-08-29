---
id: "3740"
slug: "1752vc-pitch-deck-analyzer"
title: "1752vc Pitch Deck Analyzer"
status: draft
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/1752vc-pitch-deck-analysis"
category: product-launch
date: "2026-07-13"
tags: [ProductHunt, Product Launch]
tech: [TypeScript (Next.js), TanStack Start analysis API, Vercel AI SDK, GitHub Actions for static checks, Postgres + Drizzle ORM]
---
# 1752vc Pitch Deck Analyzer

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
