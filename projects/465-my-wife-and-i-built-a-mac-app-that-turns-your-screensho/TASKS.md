---
id: "465"
slug: my-wife-and-i-built-a-mac-app-that-turns-your-screensho
title: "My wife and I built a Mac app that turns your screenshots into actions - explain an error and create an issue, add events to Calendar, save contacts and more."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vnbaw1/my_wife_and_i_built_a_mac_app_that_turns_your/"
category: indiehackers
date: "2026-08-13"
tech: [Swift, SwiftUI, CoreData, AppleScript, StoreKit, TestFlight]
---
# My wife and I built a Mac app that turns your screenshots into actions - explain an error and create an issue, add events to Calendar, save contacts and more.

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/465-my-wife-and-i-built-a-mac-app-that-turns-your-screensho/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Screenshot capture
- [ ] On-device OCR
- [ ] Action suggestions
- [ ] StoreKit paid tier

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Swift, SwiftUI, CoreData) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 465-my-wife-and-i-built-a-mac-app-that- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Swift, SwiftUI, CoreData errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
