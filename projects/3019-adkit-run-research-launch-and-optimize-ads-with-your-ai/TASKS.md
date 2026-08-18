---
id: "3019"
slug: adkit-run-research-launch-and-optimize-ads-with-your-ai
title: "AdKit – Run research, launch, and optimize ads with your AI agent"
status: enriched
source:
  name: manual
  url: "https://betalist.com/startups/adkit?utm_campaign=startup-182664&amp;utm_medium=atom&amp;utm_source=newsfeed"
category: beta
date: "2026-08-18"
tags: [BetaList, Beta, Product]
---
# AdKit – Run research, launch, and optimize ads with your AI agent

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/3019-adkit-run-research-launch-and-optimize-ads-with-your-ai/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Define the `AdPlatformAdapter` interface (auth, list campaigns, fetch creative, draft change, submit approved change) and ship a Meta Marketing API adapter as the reference implementation behind it.
- [ ] Build the Postgres schema for workspaces, ad accounts, campaigns, ads, draft changes, approvals, and an immutable audit-log table that records every mutating action with operator and timestamp.
- [ ] Implement the approval queue worker as the only path that submits a change to a live ad platform; the worker reads approved drafts, calls the adapter's submit method, and writes the result back to the audit log.
- [ ] Build the React dashboard with TanStack Query for the operator's primary workflow — connect account, browse campaigns, browse creative, queue a clone — wired to the Fastify gateway.
- [ ] Build the chat surface with the Vercel AI SDK so the same orchestration endpoints that power the dashboard also work from a streaming chat, with the approval gate enforced for every mutating call.
- [ ] Ship a Google Ads adapter against the same `AdPlatformAdapter` interface to validate the abstraction on a second platform and to unblock the two-network MVP cut.
- [ ] Build the creative library seed pipeline that ingests the 500,000+ ads the brief mentions and exposes a clone workflow that produces a static ad draft in the operator's brand voice.
- [ ] Add an external agent connector endpoint so a Claude, GPT, or operator-owned agent can call the same orchestration endpoints the dashboard uses, with the approval gate enforced in front of every mutating call.
- [ ] Implement OAuth flows for Meta and Google with encrypted token storage, the minimum-scope principle, and a one-click revoke action visible in the dashboard.
- [ ] Ship an end-to-end demo: connect a Meta test account, clone a tracked competitor ad, approve the draft, and verify the live campaign reflects the approved change with a complete audit-log trail.

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-18_
