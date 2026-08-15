---
id: "593"
slug: social-media-alerts
title: Social Media Alerts
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voqu49/social_media_alerts/"
category: saas
date: "2026-08-15"
---
# Social Media Alerts

## Tech Stack

- **Frontend:** React + TypeScript
- **Backend:** Node.js API (TanStack Start)
- **DB:** SQLite con Drizzle ORM
- **Despliegue:** Coolify + Docker

## Architecture

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Client    │────▶│   API       │────▶│   DB        │
└─────────────┘     └─────────────┘     └─────────────┘
```

## Milestones

1. **M0:** Setup proyecto + SPEC.md + DESIGN.md aprobado
2. **M1:** Scaffold + auth
3. **M2:** Core feature
4. **M3:** Testing + deployment

## Risks

- Dependencia de APIs externas
- Alcance ambiguo sin más detalles
