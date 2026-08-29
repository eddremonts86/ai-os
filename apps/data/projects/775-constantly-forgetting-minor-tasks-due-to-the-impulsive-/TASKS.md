---
id: "775"
slug: constantly-forgetting-minor-tasks-due-to-the-impulsive-
title: Constantly forgetting minor tasks due to the impulsive habit of «swiping» reminders away. Needs a tool that breaks this behavioral pattern.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/6hmyvb2mk1-constantly-forgetting-minor-tasks-due-to"
category: productivity
date: "2026-01-24"
tags: [Productivity, Psychology, Other]
country: USA
tech: [Swift, SwiftUI, Core Data, ActivityKit, HealthKit, CloudKit]
---
# Constantly forgetting minor tasks due to the impulsive habit of «swiping» reminders away. Needs a tool that breaks this behavioral pattern.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/775-constantly-forgetting-minor-tasks-due-to-the-impulsive-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up Swift + SwiftUI with Core Data as the local store
- [ ] Build the reminder capture screen with title, deadline, and context fields
- [ ] Implement the notification surface that reaches the user on lock screen and as a live activity
- [ ] Build the presentation surface that has no swipe-to-dismiss gesture anywhere
- [ ] Add the engagement screen with the four engagement choices
- [ ] Implement per-choice recording against the row with timestamp
- [ ] Add the user-stated defer durations and the 'remind me again' follow-up state
- [ ] Build the dismissal-pattern view with aggregations by choice, type, and hour of day
- [ ] Add the per-reminder theme variation keyed off the row's state and history
- [ ] Implement the local-first default with opt-in CloudKit cross-device sync
- [ ] Add the plain-text export of the dismissal log without a paid tier
- [ ] Write an integration test that captures a reminder, presents it, routes through the engagement screen, defers, and re-presents after the defer duration

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
