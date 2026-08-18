---
id: "2990"
slug: engelbart-mange-goals-and-todos-for-claude-code
title: Engelbart – Mange Goals and TODOs for Claude Code
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49337325"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Engelbart – Mange Goals and TODOs for Claude Code

## Phase 0: Scaffold

- [x] Crear carpeta del proyecto en `apps/`
- [x] Inicializar repo git
- [x] Copiar `edd-app-template` → `apps/2990-engelbart-mange-goals-and-todos-for-claude-code/`
- [x] Escribir SPEC.md (este documento)
- [x] Escribir DESIGN.md (tokens + dirección visual)
- [x] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [x] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Claude Code plugin scaffolded against the official SDK.
- [ ] Hook that reads session turns and writes a raw goals/TODOs extract to SQLite.
- [ ] Inference layer that curates the raw extract into a goals + TODOs list.
- [ ] Web UI for reviewing and editing the inferred state (local-first).
- [ ] Context-injection hook that prepends the goals/TODOs to the next Claude Code turn.
- [ ] README with a demo on a real long-running session (before/after compaction).
- [ ] Optional: cross-tool adapter behind a stable interface for future portability.

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-17_
