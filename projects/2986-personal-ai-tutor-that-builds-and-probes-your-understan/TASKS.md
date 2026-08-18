---
id: "2986"
slug: personal-ai-tutor-that-builds-and-probes-your-understan
title: Personal AI tutor that builds and probes your understanding
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49337613"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Personal AI tutor that builds and probes your understanding

## Phase 0: Scaffold

- [x] Crear carpeta del proyecto en `apps/`
- [x] Inicializar repo git
- [x] Copiar `edd-app-template` → `apps/2986-personal-ai-tutor-that-builds-and-probes-your-understan/`
- [x] Escribir SPEC.md (este documento)
- [x] Escribir DESIGN.md (tokens + dirección visual)
- [x] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [x] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Python CLI scaffold using Typer or Click.
- [ ] LLM backend abstraction (one interface, OpenAI / Anthropic / Ollama adapters).
- [ ] Curriculum generator: given a topic, produce a chapter list beginner-to-advanced.
- [ ] Probe loop: per-chapter Q&A that adapts to the learner's replies.
- [ ] SQLite store for curriculum, probe history, and confidence-delta tracking.
- [ ] Resume support: re-running picks up at the chapter the learner stopped on.
- [ ] README with examples for three real topics end-to-end.

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-17_
