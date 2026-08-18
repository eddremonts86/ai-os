---
id: "463"
slug: i-built-an-ios-app-blocker-that-forces-you-to-complete-
title: I built an iOS app blocker that forces you to complete a challenge before unblocking an addictive app.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vnlnni/i_built_an_ios_app_blocker_that_forces_you_to/"
category: indiehackers
date: "2026-08-13"
tech: [Swift, SwiftUI, iOS Screen Time API, CoreData, StoreKit, TestFlight]
---
# I built an iOS app blocker that forces you to complete a challenge before unblocking an addictive app.

## Tech Stack

Chosen for this problem:

- Swift
- SwiftUI
- iOS Screen Time API
- CoreData
- StoreKit
- TestFlight

## Architecture

Swift + SwiftUI; iOS Screen Time API for blocking; CoreData for local state; StoreKit for paid tier; TestFlight for beta.

## Milestones

- App-blocker with Screen Time API
- Challenge engine (math / typing / breathing)
- Streak counter + weekly summary
- StoreKit paid tier

## Risks

- Screen Time API limits
- Challenge difficulty tuning
