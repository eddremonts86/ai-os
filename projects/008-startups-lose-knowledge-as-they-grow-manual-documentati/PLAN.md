# PLAN.md — Startups lose knowledge as they grow. Manual documentation doesn't work. Need a smart tool for automatic knowledge capture and retrieval. Willing to pay from $25/month.

## Tech Stack Propuesta

- **Frontend:** React + TypeScript
- **Backend:** Node.js API (TanStack Start)
- **DB:** SQLite con Drizzle ORM
- **Despliegue:** Coolify + Docker

## Arquitectura

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

## Riesgos

- Dependencia de APIs externas
- Alcance ambiguo sin más detalles
