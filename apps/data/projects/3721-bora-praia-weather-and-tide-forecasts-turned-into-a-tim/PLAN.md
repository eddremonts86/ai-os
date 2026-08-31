---
id: "3721"
slug: bora-praia-weather-and-tide-forecasts-turned-into-a-tim
title: Bora Praia – weather and tide forecasts turned into a time to leave
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487925"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Mobile, Weather, Tide, Travel]
tech: [Flutter, Dart, iOS, Android, Open-Meteo, marine weather providers]
---
# Bora Praia – weather and tide forecasts turned into a time to leave

## Tech Stack

Chosen for one codebase across four targets, with honesty about data coverage built into the provider layer.

- **Flutter / Dart:** one codebase for iOS, Android, and the Flutter Web / PWA build.
- **Open-Meteo:** weather, wind, and daylight signals where coverage is broad.
- **Marine weather providers:** tide and wave signals, with per-provider coverage variance handled honestly.
- **Local forecast cache:** a 24-hour offline window per selected beach.
- **Timezone-aware engine:** Perfect Timing computed in the beach's local timezone, not the device's.

## Architecture

- **Pick-a-place step:** a curated beach directory with map view on mobile and list view on web.
- **Conditions step:** temperature, rain risk, wind, waves, tide, daylight, and sea temperature, each a threshold the user can switch on or off.
- **Travel and stay step:** driving or walking time and visit duration feed the engine.
- **Perfect Timing engine:** recommends a departure time and outing window from forecast, tides, daylight, and travel time.
- **Confidence layer:** "low confidence" or "unavailable" states wherever tide or marine data is missing — never a fabricated number.
- **Web build:** the same three steps minus auth, sharing, maps, and notifications, with the gaps marked visibly.

## Milestones

1. **M0 — Perfect Timing on iOS.** The three-step flow reaches a departure recommendation for launch-region beaches, in EN and PT-BR.
2. **M1 — Honest coverage.** Confidence and unavailable states exist for every tide and marine provider gap.
3. **M2 — Android and web.** The Android app plus the Flutter Web / PWA build ship with documented feature gaps.
4. **M3 — Store launch.** App Store (id 6758357483) and Google Play releases, with the 24-hour offline cache verified.

## Risks

- **Data honesty:** a single fabricated tide number breaks the confidence-state promise the product is built on.
- **Coverage variance:** tide and marine providers differ by location; launch-region coverage must be confirmed before claims are made.
- **Timezone mistakes:** using the device timezone instead of the beach's would recommend wrong departure times.
- **Offline staleness:** the 24-hour cache needs a freshness indicator, not silently stale data.
- **Web parity expectations:** users who find the PWA first must see exactly which features are missing.
