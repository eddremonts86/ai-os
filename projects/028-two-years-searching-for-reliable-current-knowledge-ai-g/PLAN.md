# PLAN.md — Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of links. Need a personalized guide to trusted information.

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
