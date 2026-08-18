---
id: "341"
slug: need-a-simple-action-tracker-for-busy-people
title: Need a simple action tracker for busy people
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/productivity/bngxaaugn1-need-a-simple-action-tracker-for-busy-pe"
category: productivity
date: "2025-10-29"
tags: [Productivity]
country: UAE
tech: [SwiftUI (iOS-first), CloudKit (private DB), Shortcuts integration, Apple Watch (Complications), RevenueCat]
---
# Need a simple action tracker for busy people

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/productivity/bngxaaugn1-need-a-simple-action-tracker-for-busy-pe` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/341-need-a-simple-action-tracker-for-busy-pe/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: SwiftUI (iOS-first), CloudKit (private DB), Shortcuts integration, and confirm versions resolve in CI.
- [ ] Provision the iOS/Android signing pipeline and confirm TestFlight/Internal Testing build distribution.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: UAE`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for UAE.
## Phase 1: Core

- [ ] SwiftUI iOS app: one-screen capture (title, tag, due-date)
- [ ] CloudKit private DB only; no account, no server profile
- [ ] Apple Watch complication + dictation path; works without iPhone reachable for simple captures
- [ ] iOS Lock Screen widget capture without unlock
- [ ] Shortcuts integration: 'New Action' in the system Shortcuts app
- [ ] Daily 6pm single-swipe review view
- [ ] RevenueCat one-time-purchase paywall on the review screen for pro features (export, multi-tag)

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (SwiftUI (iOS-first), CloudKit (private DB), Shortcuts integration) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 341-need-a-simple-action-tracker-for-bu MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in UAE completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for SwiftUI (iOS-first), CloudKit (private DB), Shortcuts integration errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
