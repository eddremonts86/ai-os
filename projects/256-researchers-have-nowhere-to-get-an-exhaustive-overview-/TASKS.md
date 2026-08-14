---
id: "256"
slug: researchers-have-nowhere-to-get-an-exhaustive-overview-
title: "Researchers have nowhere to get an exhaustive overview of what has been done in their field, leading to the risk of duplicating work"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/ai/t3i6ddxjb1-researchers-have-nowhere-to-get-an-exhau"
category: ai
date: "2026-01-08"
tags: [AI, Other]
country: France
---
# Researchers have nowhere to get an exhaustive overview of what has been done in their field, leading to the risk of duplicating work

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/256-researchers-have-nowhere-to-get-an-exhaustive-overview-/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Build the indexing pipeline with connectors for Crossref, OpenAlex, arXiv, HAL, Semantic Scholar; document per-source coverage and update cadence.
- [ ] Store papers, authors, venues, and citation edges in PostgreSQL; index titles, abstracts, and author names in Meilisearch.
- [ ] Build the search and topic-discovery surface: a query returns a structured list of papers with citations and venue info.
- [ ] Build the overview template that organises the synthesis by sub-topic, method, and benchmark, with every claim tied to a paper.
- [ ] Add the coverage-disclosure block on every overview (sources queried, date span, paper count, indexed-as-of date).
- [ ] Implement BibTeX and Markdown export with embedded citations.
- [ ] Pick one or two pilot fields for the MVP; disclose the choice on the public surface.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 256-researchers-have-nowhere-to-get-an- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in France completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
