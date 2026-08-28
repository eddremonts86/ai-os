---
id: "233"
slug: constantly-forgetting-minor-tasks-due-to-the-impulsive-
title: Constantly forgetting minor tasks due to the impulsive habit of \u00abswiping\u00bb reminders away. Needs a tool that breaks this behavioral pattern
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/6hmyvb2mk1-constantly-forgetting-minor-tasks-due-to"
category: productivity
date: "2026-01-24"
tags: [Psychology, Other]
country: USA
tech: [SwiftUI, CoreData, CloudKit sync, iOS Shortcuts, ActivityKit, Firebase Cloud Messaging]
---
# Constantly forgetting minor tasks due to the impulsive habit of «swiping» reminders away. Needs a tool that breaks this behavioral pattern

## Tech Stack

SwiftUI for the iOS app (chosen because the problem is iOS-notification-centric and the user is on iPhone per the source). CoreData + CloudKit for offline-first sync. UserNotifications framework for local notification actions. ActivityKit for live-activity reminders. Firebase Cloud Messaging as a fallback for cross-device push.

## Architecture

Single iOS app target with three layers: a local CoreData store (single source of truth), a notification-action handler that mediates between UserNotifications and the store, and a SwiftUI view layer that exposes the inbox and weekly stats. CloudKit is a write-through mirror of the CoreData store; no backend server in MVP.

## Milestones

M1: SwiftUI shell, CoreData model, basic reminder creation. M2: Custom notification action with the 3-option commitment sheet. M3: CloudKit sync and Mac catalyst support. M4: Weekly stats screen and 7-day retention instrumentation. M5: TestFlight beta with 50 USA users.

## Risks

iOS notification permission is the single most likely failure point — the app is useless without it. CloudKit silent-push quotas can drop writes during heavy dismissals. Users may simply deny notifications and the value proposition collapses.
