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

## Phase 0: Scaffold

- Scaffold the SwiftUI app with the audio engine.
- Bundle the sixteen launch sounds.
- Implement the feelings-input UI and the on-device classifier.
- Wire the per-user learning loop; verify nothing leaves the device.
- Add timers and offline playback.
- Integrate Apple HealthKit for the sleep score (opt-in).
- Implement StoreKit 2 for the subscription + lifetime tiers.
- Submit to the App Store.

## Phase 1: Core

- All MVP Scope items shipped end-to-end.
- A user can type a feeling, get a soundscape, rate it, and see Sona adjust.
- No telemetry contains user feelings text or listening history.
- Subscription and lifetime tiers work via StoreKit 2.
- Test coverage on the audio engine and the on-device classifier.

## Phase 2: Deploy

- Launch on the App Store with a 7-day trial.
- Run an Apple privacy nutrition-label audit.
- Publish a privacy one-pager: nothing leaves the device.
- Plan the next sound-content expansion based on per-soundscape ratings.
