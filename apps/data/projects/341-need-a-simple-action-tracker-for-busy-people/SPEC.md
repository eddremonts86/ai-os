---
id: "341"
slug: need-a-simple-action-tracker-for-busy-people
title: Need a simple action tracker for busy people
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/bngxaaugn1-need-a-simple-action-tracker-for-busy-pe"
category: productivity
date: "2025-10-29"
tags: [Productivity]
country: UAE
tech: [SwiftUI (iOS-first), CloudKit (private DB), Shortcuts integration, Apple Watch (Complications), RevenueCat]
---
# Need a simple action tracker for busy people

## Problem

A UAE-based professional is signing up for productivity tools that ask them to enter projects, sub-tasks, contexts and habits before the first action is captured. The poster wants a tracker that the user can use in 5 seconds - from an Apple Watch complication, a Shortcut, or the home screen widget - and that gets out of the way as fast as it got in.

## Objective

Ship a single-screen action tracker for busy UAE professionals that captures one action in 5 seconds from any surface (Watch, Lock Screen widget, Shortcut), and groups actions into a private, on-device timeline the user can review without an account.

## Target Users

- UAE working professionals (consultants, PMs, founders) who already own an Apple Watch and use Shortcuts.
- Travelling executives in the GCC who need to capture ideas between meetings without unlocking a phone.
- Personal-KM enthusiasts in Dubai/Abu Dhabi who want a private timeline, not a project management suite.

## MVP Scope

- One-screen iOS app: action title, optional tag, optional due-date.
- Apple Watch complication and one-tap dictation capture.
- iOS Lock Screen widget: capture from the Lock Screen without unlocking.
- Shortcuts integration: 'New Action' shows up in the system Shortcuts app.
- Private timeline view: chronological, no accounts, no cloud.
- Hand-off: review the day in a single swipe at 6pm.
- No project hierarchies, no sub-tasks, no dependencies, no team sharing in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/productivity/bngxaaugn1-need-a-simple-action-tracker-` follows the constraints in `341-.../SPEC.md` and the chosen stack (SwiftUI (iOS-first), CloudKit (private DB), Shortcuts integration). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in UAE.

For UAE, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- CloudKit private DB only; no team, no shared projects, no server-side profile.
- Watch capture must work without the iPhone being reachable for the simple path.
- One-time purchase (no recurring subscription for the basic flow) to lower the trial-to-paid friction.
