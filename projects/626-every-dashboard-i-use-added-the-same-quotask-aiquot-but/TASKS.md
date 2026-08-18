---
id: "626"
slug: every-dashboard-i-use-added-the-same-quotask-aiquot-but
title: "Every dashboard I use added the same \"Ask AI\" button this year"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vozdqc/every_dashboard_i_use_added_the_same_ask_ai/"
category: saas
date: "2026-08-15"
---
# Every dashboard I use added the same "Ask AI" button this year

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/626-every-dashboard-i-use-added-the-same-quotask-aiquot-but/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Recruit the first 15 to 20 design-partner founders from the Reddit thread, document each host's API surface in a short brief, and pick the first host to ship against so the integration work is sequenced.
- [ ] Build the embeddable widget as a vanilla TypeScript bundle (no framework runtime) that injects an "Ask AI" button into a host dashboard with a single script tag and opens an iframe-based chat surface.
- [ ] Build the action registry as a JSON manifest per host that declares allowed endpoints, parameters, scopes, and human-readable descriptions so the LLM can never propose writes against unregistered routes.
- [ ] Build the host integration SDK as a thin TypeScript package the design partner installs in their backend, exposing the host's existing API surface as typed actions with a default dry-run mode.
- [ ] Build the Fastify backend agent that takes the operator's natural-language request, reads the host action registry, asks the LLM for a typed action candidate, and persists the proposal before returning it to the widget.
- [ ] Implement the approval dialog inside the widget that shows the operator the exact change the agent is about to make (the same "shows you what it's about to change" pattern the poster names), with explicit confirm and reject buttons.
- [ ] Wire the confirm path: on confirm, the backend calls the host SDK to execute the action, records the approval event, and surfaces the result in the widget so the operator sees the change actually happened.
- [ ] Implement the rejection-reason dropdown the design partner uses to flag bad proposals, plus a per-host prompt-tuning loop that consumes the rejection reasons to retune the LLM prompt.
- [ ] Ship an end-to-end demo on the first design partner: an operator types "give Priya the same access as Jamie but read only on production", the widget shows the typed action candidate, the operator confirms, and the host's actual access table updates with a recorded audit event.
- [ ] Repeat the integration on the second and third design partner to validate the pattern generalises, and only then decide whether to graduate from concierge onboarding to a self-serve flow.

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-15_
