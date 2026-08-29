---
id: "888"
slug: universal-tracking-service-for-all-mobile-devices
title: Universal tracking service for all mobile devices
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/kiv6i361e1-universal-tracking-service-for-all-mobil"
category: other
date: "2025-10-22"
tags: [Other]
country: Russia
tech: [Native iOS (Swift, FindMy + CoreLocation background modes), Native Android (Kotlin, Fused Location Provider + foreground service), React + TypeScript admin dashboard, Postgres + Drizzle ORM, Coolify, Stripe metered billing]
---
# Universal tracking service for all mobile devices

## Problem

A user (Rinat, Russia) frequently forgets his phone at home or in the car and needs to locate it quickly. He has tried numerous existing device-tracking services and found every one to be a partial solution: some only work with Android, others only with iOS, and all require complex per-OS setup that prevents him from seeing all his devices in a single dashboard. He wants a single platform where he can register any device regardless of its OS — iOS, Android, or future platforms — and locate it from one web dashboard. His stated monetization posture is pay-for-result: basic functionality stays free, and he only pays when the service actually helps him locate a lost device.

## Problem (extended)

The pain has two layers. The first is the OS fragmentation: Find My (iOS-only) and Find My Device (Android-only) do not interoperate, so a household with mixed devices has no single view. The second is the setup tax: each native tracker app requires its own account, its own permission grants (location, background location, motion & fitness), and its own device-pairing flow — and the user gives up before completing the second one. A unified service that abstracts the per-OS setup into a single signup flow, registers both ecosystems into one dashboard, and charges only when a locate is actually useful is the value proposition the existing tools do not deliver.

## Objective

Ship a cross-OS device-tracking service with a single web dashboard that shows the live location of every registered device — iOS, Android, or future — and charges the user only when the service successfully helps locate a lost device (a successful recovery, not just an open). Basic functionality (register devices, see last-known location, ring a device) stays free; a per-recovery fee is the monetization, in line with the user's stated pay-for-result preference.

## Target Users

- Primary: users with mixed-OS households (iPhone + Android, family devices across platforms) who need one dashboard for all devices.
- Secondary: people who forget their phone at home or in the car frequently and want a one-tap "where is my phone" flow without per-OS app gymnastics.
- Tertiary: small-business owners tracking company-issued devices (tablets, phones) across iOS and Android; same fragmentation pain, higher willingness to pay.

## MVP Scope

- Single web dashboard at `app.platform.com`: shows all registered devices on one map with last-known location, battery %, online/offline status.
- iOS companion app (Swift, native): registers with the user's account, opts into background location + motion APIs so the device pings location when moved; integrates with Find My where possible.
- Android companion app (Kotlin, native): same registration flow, Fused Location Provider, foreground service for continuous reporting.
- "Locate now" action: forces a fresh location ping from the selected device (where the OS allows); shows the result on the map with a confidence indicator.
- "Ring" action: plays a loud tone on the device for 30 seconds, even if the device is on silent (where the OS allows).
- Pay-for-result: basic features free; a per-recovery fee ($1–$3) is charged only when a "Locate now" action returns a fresh location within a short window and the user marks it as a successful recovery.
- Single-user, single account; no family / team plan in v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Apple's and Google's background-location restrictions are real and cannot be bypassed; the iOS and Android apps must be honest about what background tracking can do (significant location changes, motion-triggered updates) vs. what is impossible (continuous high-frequency tracking while the app is suspended).
- The platform must respect each OS's privacy posture: no location is shared without explicit user consent; no data is sold to third parties; the privacy policy must be readable in plain language, not legalese.
- Cross-border compliance (GDPR, CCPA, Russian personal-data law 152-FZ) is non-negotiable: location data is personal data under all three; the platform must allow data export and deletion, and must store Russian users' data in a way that satisfies 152-FZ if the user is in Russia.
- The pay-for-result model must be enforced by the platform, not the user's honor: a recovery counts only when the locate returned a fresh ping within the agreed window and the user marked it as a recovery, with a built-in cooldown to prevent accidental double-charges.
- Free tier must be usable forever (not a trial); the author explicitly stated the basic functionality should remain free.
- The author has not stated a per-recovery price; $1–$3 is within the implied value of "actually finding a lost device."
