---
id: "3815"
slug: offline-music-practice-apps-no-accountno-subscriptionno
title: "Offline music practice apps – no account,no subscription,no analytics"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495786"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [iOS app family, SwiftUI, on-device storage only, backing jam tracks, guitar tuner, tip jar monetization]
---
# Offline music practice apps – no account,no subscription,no analytics

## Tech Stack

Inferred from the site's stated constraints (on-device, offline, iOS-first).

- **iOS apps:** the shipped platform for all four Buddha apps, App Store distributed.
- **SwiftUI:** the natural fit for a solo iOS developer building four small, calm, consistent apps.
- **On-device storage:** local persistence for songs, riffs and practice memory; no server component.
- **Audio engine:** playback and recording for jamming, riff capture and backing tracks.
- **Opt-in analytics:** an anonymous, off-by-default analytics hook (the site allows opt-in only).
- **Tip jar:** an in-app donation mechanism that gates nothing.

## Architecture

- **Shared philosophy core:** one on-device data model and settings set reused across the four instrument apps.
- **Instrument layer:** per-app content (songs, grooves, rudiments, backing tracks) over the shared core.
- **Capture flow:** riff and idea recording to local storage.
- **Practice memory:** a quiet local log of what has been practiced, with no streaks or scoring surfaces.
- **Waitlist service:** a single-email list (Cloudflare-hosted) for the Android launch notification.

## Milestones

1. **M0 — Shared core.** The on-device storage and settings core exists once and runs in the Guitar Buddha shell.
2. **M1 — Instrument features.** Song learning, riff capture, backing band and tuner working offline in Guitar Buddha.
3. **M2 — The family.** Ukulele, Drum and Bass apps ship on the shared core with per-instrument content.
4. **M3 — Android path.** The waitlist converts to a notification; the Android build lands with the same three rules.

## Risks

- **Revenue constraint:** free-forever with a tip jar is a promise, not a plan; nothing else may fund the apps.
- **Solo velocity:** four apps, iOS and Android, from one person — scope must stay small or quality slips.
- **Anti-gamification tension:** even the quiet practice memory can drift into tracking; it needs a strict local-only boundary.
- **No backend by design:** user support, updates and waitlist notifications run on minimal infrastructure (one Cloudflare list).
