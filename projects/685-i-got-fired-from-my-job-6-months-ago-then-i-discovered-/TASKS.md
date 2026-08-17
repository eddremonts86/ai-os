---
tags: ["saas", "consumer", "ios", "focus"]
tech: ["SwiftUI", "Swift", "Screen Time API", "StoreKit 2"]
id: "685"
slug: i-got-fired-from-my-job-6-months-ago-then-i-discovered-
title: "I got fired from my job 6 months ago. Then I discovered a problem I couldn't stop thinking about."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpragt/i_got_fired_from_my_job_6_months_ago_then_i/"
category: saas
date: "2026-08-16"
---## Phase 0: Scaffold

- [ ] Create a fresh Xcode project `apps/685-i-got-fired-from-my-job-6-months-ago-then-i-discovered-/` (SwiftUI app lifecycle, iOS 16+ deployment target)
- [ ] Initialize git and add `.gitignore` excluding `*.xcuserdata`, `DerivedData`, `.build`
- [ ] Write SPEC.md and the matching DESIGN.md tokens (pause-prompt visual identity)
- [ ] Apply for the FamilyControls entitlement and the DeviceActivity / ManagedSettings capabilities
- [ ] Build the single pause-prompt screen and the on-device tally store
- [ ] Configure the configurable app-list UI and the daily-tally analytics view
- [ ] Wire StoreKit 2 with the free / $4.99 monthly / $29.99 annual product IDs

## Phase 1: Core

- [ ] SwiftUI app skeleton with iOS 16+ deployment target
- [ ] FamilyControls entitlement + DeviceActivity + ManagedSettings capabilities
- [ ] Single pause prompt ("Did you actually choose this, or is it the default?")
- [ ] Configurable app list (free: 3 apps, paid: unlimited)
- [ ] Daily tally: deliberate vs default pauses
- [ ] StoreKit 2 paywall ($4.99 monthly / $29.99 annual)
- [ ] On-device-only storage (no backend)

## Phase 2: Deploy

- [ ] App Store submission + TestFlight beta
- [ ] 200-UserFlight beta with a self-reported screen-time-reduction survey at day 30
- [ ] Post-mortem at week 9
