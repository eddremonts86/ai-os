# PLAN.md — My technical co-founder ghosted an investor meeting on purpose as a &quot;lesson,&quot; delivered nothing usable in ~12 months, and I rebuilt the entire product myself in 9 days. What's the actual right way to fix the equity split? I will not promote

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
