---
id: "510"
slug: i-built-monito-a-native-macos-menu-bar-app-for-monitori
title: "I built Monito, a native macOS menu bar app for monitoring and managing VPS instances"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vny42b/i_built_monito_a_native_macos_menu_bar_app_for/"
category: sideproject
date: "2026-08-14"
tech: [Swift, SwiftUI, macOS, Nezha/Komari/NodeGet APIs, SSH (NMSSH), StoreKit, TestFlight]
---
# I built Monito, a native macOS menu bar app for monitoring and managing VPS instances

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/510-i-built-monito-a-native-macos-menu-bar-app-for-monitori/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Nezha / Komari / NodeGet integration
- [ ] Standalone SSH support
- [ ] Menu-bar status
- [ ] Pro tier

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Swift, SwiftUI, macOS) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 510-i-built-monito-a-native-macos-menu- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Swift, SwiftUI, macOS errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
