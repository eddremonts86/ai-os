---
id: "2982"
slug: i-made-a-3d-globe-platform-to-promote-your-startup-base
title: I made a 3D Globe platform to promote your startup based on your MRR
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49338015"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# I made a 3D Globe platform to promote your startup based on your MRR

## Phase 0: Scaffold

- [x] Crear carpeta del proyecto en `apps/`
- [x] Inicializar repo git
- [x] Copiar `edd-app-template` → `apps/2982-i-made-a-3d-globe-platform-to-promote-your-startup-base/`
- [x] Escribir SPEC.md (este documento)
- [x] Escribir DESIGN.md (tokens + dirección visual)
- [x] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [x] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Three.js scene with a textured globe and smooth pan/zoom/spin.
- [ ] Tower primitive per startup, height proportional to MRR.
- [ ] Seed 20 hand-entered startups (Stripe mocked) for the first public demo.
- [ ] Stripe Connect onboarding flow so founders can claim a slot themselves.
- [ ] Cloudflare Worker that polls Stripe every 6h and writes MRR into KV.
- [ ] Click-on-tower affordance: opens the startup's site in a new tab.
- [ ] Orbit-tier billing via Stripe subscriptions; orbit placement lifts the tower above the surface.
- [ ] Mobile performance pass: target 30+ fps on a mid-range phone with 200 towers.

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-17_
