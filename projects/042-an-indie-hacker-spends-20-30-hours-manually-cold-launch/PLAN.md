# PLAN.md — An indie hacker spends 20-30 hours manually «cold launching» each new product in directories, Reddit, and blogs. There is no tool that fully automates this and proves its effectiveness.

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
