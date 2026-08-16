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
---
# I got fired from my job 6 months ago. Then I discovered a problem I couldn't stop thinking about.

## Tech Stack

- **iOS app:** SwiftUI + Swift 5.10, iOS 16+ deployment target.
- **Interception:** Apple's Screen Time API (FamilyControls + DeviceActivity + ManagedSettings).
- **Backend:** none in v1; the pause logic and tally run on-device.
- **Payments:** StoreKit 2 with auto-renewable subscriptions.

## Architecture

Single iOS app; no backend. The pause prompt is rendered when an app in the watch list is opened; the tap is logged on-device.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-pause demo with a hardcoded app list. End of week 1.
2. **M1 — Screen Time API integration + pause prompt.** End of week 3.
3. **M2 — Configurable app list + daily tally.** End of week 5.
4. **M3 — StoreKit 2 paywall.** End of week 7.
5. **M4 — Public beta.** 200 TestFlight users. End of week 9.

## Risks

- **Screen Time API limits** — Apple's restrictions are the binding constraint; if Apple narrows the API, the MVP breaks.
- **Founder-as-design-partner bias** — the product is sized to the founder; broader appeal is unproven.
