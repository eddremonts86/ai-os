---
id: "639"
slug: i-built-a-3mo-tool-that-auto-posts-to-linkedin-through-
title: I built a $3/mo tool that auto-posts to LinkedIn through their official API
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp7kaq/i_built_a_3mo_tool_that_autoposts_to_linkedin/"
category: saas
date: "2026-08-15"
wtp: "$3/mo basic, $6/mo higher tier"
---
# I built a $3/mo tool that auto-posts to LinkedIn through their official API

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/639-i-built-a-3mo-tool-that-auto-posts-to-linkedin-through-/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Provision LinkedIn developer app + scopes for w_member_social
- [ ] OAuth callback handler stores encrypted access + refresh tokens
- [ ] Compose form with character count + media URL field
- [ ] Schedule model: user_id, body, scheduled_at, status (pending/posted/failed)
- [ ] Worker pulls due rows, calls Posts endpoint, records result
- [ ] Stripe products for $3 and $6 tiers, webhook maps to seat quotas

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-15_
