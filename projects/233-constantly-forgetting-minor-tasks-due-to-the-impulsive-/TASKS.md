---
id: "233"
slug: constantly-forgetting-minor-tasks-due-to-the-impulsive-
title: Constantly forgetting minor tasks due to the impulsive habit of \u00abswiping\u00bb reminders away. Needs a tool that breaks this behavioral pattern
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/productivity/6hmyvb2mk1-constantly-forgetting-minor-tasks-due-to"
category: productivity
date: "2026-01-24"
tags: [Psychology, Other]
country: USA
tech: [SwiftUI, CoreData, CloudKit sync, iOS Shortcuts, ActivityKit, Firebase Cloud Messaging]
---
# Constantly forgetting minor tasks due to the impulsive habit of «swiping» reminders away. Needs a tool that breaks this behavioral pattern

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/233-constantly-forgetting-minor-tasks-due-to-the-impulsive-/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Create SwiftUI app shell with CoreData Inbox list
- [ ] Implement reminder creation flow (title, due time, repeat)
- [ ] Wire UserNotifications scheduling on reminder save
- [ ] Replace default swipe-to-dismiss with 3-option UNNotificationAction set
- [ ] Add CoreData commit handler invoked from notification action
- [ ] Build weekly-stats screen: dismiss-without-action rate, completed count
- [ ] Add CloudKit container and write-through sync
- [ ] Mac Catalyst target and iPad split-view
- [ ] Onboarding flow that explains the commitment-sheet mechanic and requests notification permission

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (SwiftUI, CoreData, CloudKit sync) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 233-constantly-forgetting-minor-tasks-d MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for SwiftUI, CoreData, CloudKit sync errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
