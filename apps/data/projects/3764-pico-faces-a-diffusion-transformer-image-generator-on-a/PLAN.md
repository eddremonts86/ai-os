---
id: "3764"
slug: pico-faces-a-diffusion-transformer-image-generator-on-a
title: Pico-Faces – A diffusion transformer image generator on a RP Pico 2 MCU
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49489464"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Pico-Faces – A diffusion transformer image generator on a RP Pico 2 MCU

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
