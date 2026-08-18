---
id: "2989"
slug: openleetcode-local-leetcode-runner-where-tests-live-in-
title: Openleetcode – local LeetCode runner where tests live in the repo
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49337367"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Openleetcode – local LeetCode runner where tests live in the repo

## Phase 0: Scaffold

- [x] Crear carpeta del proyecto en `apps/`
- [x] Inicializar repo git
- [x] Copiar `edd-app-template` → `apps/2989-openleetcode-local-leetcode-runner-where-tests-live-in-/`
- [x] Escribir SPEC.md (este documento)
- [x] Escribir DESIGN.md (tokens + dirección visual)
- [x] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [x] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] CLI accepts a problem ID or title and the path to a solution file.
- [ ] Local test runner: compile and execute against bundled test cases for Python, C++, Rust, Java, Go, TypeScript, Swift.
- [ ] Pass/fail per test case with a unified diff on failure.
- [ ] Toolchain detection: emit a clean error if `python3` / `cargo` / `javac` / `go` / `tsc` are missing.
- [ ] Watch mode: re-run on file save.
- [ ] Plugin adapter so adding a new language runner is a small change.

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-17_
