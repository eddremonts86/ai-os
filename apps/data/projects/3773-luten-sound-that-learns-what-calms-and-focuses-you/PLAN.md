---
id: "3773"
slug: luten-sound-that-learns-what-calms-and-focuses-you
title: Luten – Sound that learns what calms and focuses you
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/luten"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [Swift, SwiftUI, AVFoundation, Apple NaturalLanguage framework, Apple HealthKit, StoreKit 2]
---
# Luten – Sound that learns what calms and focuses you

## Tech Stack

Swift, SwiftUI, AVFoundation, Apple NaturalLanguage framework, Apple HealthKit, StoreKit 2.

## Architecture

Single iOS app. Audio engine plays the soundscape. Apple NaturalLanguage classifies the feelings text on-device. The learning loop is a per-user weights file in the app sandbox. Apple Health sleep score is read on permission. StoreKit 2 handles the subscription and lifetime unlock.

## Milestones

- **M0:** SPEC + DESIGN approved.
- **M1:** Sixteen sounds + feelings-input UI.
- **M2:** Sona on-device classifier + learning loop.
- **M3:** Apple Health integration + StoreKit + App Store launch.

## Risks

- Apple NaturalLanguage model quality on plain feelings text is bounded; cold-start is the risk.
- Learning loop must stay on-device; any cloud sync breaks the privacy claim.
- Apple Health permission UX is delicate; over-asking causes uninstalls.
- Lifetime tier revenue front-loading requires a content pipeline to retain users.
