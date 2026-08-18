---
id: "2984"
slug: encrypted-git-remote-server
title: Encrypted Git Remote Server
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49337799"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Encrypted Git Remote Server

## Phase 0: Scaffold

- [x] Crear carpeta del proyecto en `apps/`
- [x] Inicializar repo git
- [x] Copiar `edd-app-template` → `apps/2984-encrypted-git-remote-server/`
- [x] Escribir SPEC.md (este documento)
- [x] Escribir DESIGN.md (tokens + dirección visual)
- [x] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [x] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Rust client wrapper that intercepts `git push` / `git fetch` against a ghostfork URL scheme.
- [ ] AES-256-GCM encryption of every git object (blob, tree, commit, tag) before transmission.
- [ ] Public-key bootstrap: first-run keypair generation, with a forced backup-of-private-key step.
- [ ] Round-trip integrity test: push then fetch returns bit-identical trees against the same key.
- [ ] Reference server (Go or Rust) that accepts the encrypted smart-HTTP protocol and stores ciphertext.
- [ ] Single-binary server distribution plus a Docker image for Coolify.
- [ ] Threat-model write-up published alongside v1; reproducible builds for the client binary.

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-17_
