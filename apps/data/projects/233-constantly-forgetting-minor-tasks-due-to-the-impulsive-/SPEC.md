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

## Problem

The poster constantly forgets minor tasks because their habitual reflex is to swipe a reminder notification away the instant it appears. The notification is acknowledged but the task is never recorded as "done" or moved into a committed slot, so the work disappears from working memory within minutes. This is a behavioural loop, not an attention problem: the existing reminders apps (iOS Reminders, Google Tasks, Todoist) all let the user dismiss a notification with a single gesture and offer no friction that forces the task into a next-action decision.

## Objective

Ship a mobile task app that replaces one-tap dismissal with a small but meaningful commitment step: every reminder the user "swipes" forces a 3-second choice between "Done now", "Snooze 10 min", or "Push to tomorrow morning". The goal is to break the reflex-to-dismiss habit and increase the rate at which reminders convert into a completed-or-scheduled outcome.

## Target Users

Adults in the USA who already use a phone reminders app and recognise the swipe-to-forget pattern in themselves; ADHD-adjacent self-managers; remote workers whose daily load is many small tasks rather than a few large ones.

## MVP Scope

iOS app (SwiftUI) with a single "Inbox" list, quick-add, and a custom notification action that replaces the swipe-to-dismiss with a 3-option action sheet. Local notifications scheduled via UserNotifications framework; iCloud sync via CloudKit so the same task set appears on iPhone, iPad and Mac. A weekly stats screen showing dismiss-without-action rate as the primary metric.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/productivity/6hmyvb2mk1-constantly-forgetting-minor-t` follows the constraints in `233-.../SPEC.md` and the chosen stack (SwiftUI, CoreData, CloudKit sync). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must work fully offline (no network dependency for the core commitment step). iOS Human Interface Guidelines for notification actions. No dark patterns that trick the user into an action they did not intend.
