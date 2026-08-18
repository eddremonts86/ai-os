---
id: "277"
slug: owners-of-modern-macs-cant-launch-old-games-due-to-comp
title: "Owners of modern Macs can't launch old games due to complex instructions involving emulators and file conversion"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/other/ff5gcnrro1-owners-of-modern-macs-cant-launch-old-ga"
category: other
date: "2025-12-04"
tags: [Other]
country: UK
tech: [Tauri (Rust), SwiftUI wrapper, DOSBox-X / ScummVM bundling, GOG Galaxy 2.0 import, RetroAchievements API]
---
# Owners of modern Macs can't launch old games due to complex instructions involving emulators and file conversion

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/277-owners-of-modern-macs-cant-launch-old-games-due-to-comp/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] SwiftUI macOS app shell with library view
- [ ] Tauri engine hosting DOSBox-X and ScummVM
- [ ] Apple Silicon native translation for bundled emulators
- [ ] GOG Galaxy 2.0 import flow
- [ ] archive.org bulk-import flow
- [ ] Per-game compatibility database (JSON, maintained)
- [ ] RetroAchievements API integration (optional)
- [ ] macOS notarisation and App Store submission

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Tauri (Rust), SwiftUI wrapper, DOSBox-X / ScummVM bundling) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 277-owners-of-modern-macs-can-t-launch- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in UK completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Tauri (Rust), SwiftUI wrapper, DOSBox-X / ScummVM bundling errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
