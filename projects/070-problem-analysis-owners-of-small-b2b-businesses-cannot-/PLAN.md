# PLAN.md — Problem Analysis: Owners of small B2B businesses cannot build a growth system. Do they need a fractional CMO, or can a SaaS be built?

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
