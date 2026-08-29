---
id: "3773"
slug: luten-sound-that-learns-what-calms-and-focuses-you
title: "Luten – Sound that learns what calms and focuses you"
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

## Problem

Luten is sound for the mind that learns the user. Most sound apps give everyone the same playlist. The user tells Sona how they feel in plain words like tired, wired, or unable to start, and Luten finds the right soundscape for sleep, focus, ADHD, stress, or kids. It gets more personalised over time. Sona runs on the user's device using Apple's NaturalLanguage framework, so nothing the user types or listens to leaves the phone. There are no vocals, talking, guided courses, or ads. Features include timers, offline playback, and an Apple Health sleep score. Sixteen sounds are free forever. The product is $59.99 a year with a 7-day trial, or $119.99 once for lifetime access. Available on the App Store August 18.

## Objective

Ship a sound app that picks a soundscape from how the user feels (tired, wired, unable to start, …), learns what works over time, and does not collect what the user types or listens to.

## Target Users

1. **Insomnia or ADHD adult** — the primary user; needs a soundscape matched to the moment.
2. **Parent of a kid who cannot sleep** — wants a kid-safe, no-talking, no-ads app.
3. **Focus worker** — wants a noise loop that does not break concentration.

## MVP Scope

- Sixteen free sounds shipped at launch.
- A feelings-input UI: tired, wired, unable to start, and other plain words.
- Sona: an on-device classifier (Apple NaturalLanguage) that maps feelings to a soundscape.
- Per-user learning loop: rate each soundscape, Sona adjusts.
- Timers, offline playback, Apple Health sleep-score integration.
- $59.99/year subscription with a 7-day trial; $119.99 lifetime; no ads.

## Design Direction

See DESIGN.md for design tokens.

## Constraints

- Privacy is the product: nothing the user types or listens to leaves the device. The classifier runs on-device.
- No vocals, no talking, no courses, no ads — explicit product stance.
- iOS-first via the App Store; macOS / iPadOS are stretch.
