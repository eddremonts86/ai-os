---
id: "3017"
slug: a-benchmark-for-ai-agent-guardrails-that-caught-my-own-
title: A benchmark for AI agent guardrails that caught my own plugin
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49338963"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# A benchmark for AI agent guardrails that caught my own plugin

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/3017-a-benchmark-for-ai-agent-guardrails-that-caught-my-own-/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Define the `GuardrailAdapter` Python interface (a `decide(scenario) -> verdict` method plus scenario metadata) and ship a reference adapter for the founder's own plugin so the headline claim is reproducible.
- [ ] Write 30 YAML scenarios across three categories — tool-call validation, secret-leak detection, and unsafe shell execution — each with a known-bad input and the expected verdict the harness should observe.
- [ ] Build the pytest runner that loads every scenario YAML, instantiates the configured adapter, replays the scenario through it, and writes a JUnit-XML report with a stable verdict field.
- [ ] Write `report.py` that consumes the JUnit XML and emits a Markdown table grouped by category with an aggregate pass-rate per category and overall.
- [ ] Add a `make bench` target that runs the suite end-to-end and writes the Markdown report to `reports/latest.md`.
- [ ] Hand-validate the scenario corpus against the founder's plugin and record the baseline pass-rate in `reports/baseline.md` so future contributors can see what "as shipped" looked like.
- [ ] Write a README that explains how to add a scenario, how to point the runner at an external guardrail, and how to read the Markdown report.
- [ ] Add a `CONTRIBUTING.md` with a scenario template, a category checklist, and a review SLA so community PRs are triageable.
- [ ] Add an MIT LICENSE file so corporate users can vendor the harness without legal review.
- [ ] Smoke-test the full flow on a fresh clone: `make bench` produces a JUnit XML and a Markdown report without manual steps.

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-18_
