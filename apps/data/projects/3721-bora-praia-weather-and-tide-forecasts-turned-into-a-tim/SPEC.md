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

## Problem

Anyone planning a beach day has to mentally combine four separate forecasts: weather (rain risk, wind), tides (low/high), daylight, and travel time. The Show HN post links to [https://borapraia.com/](https://borapraia.com/), a Flutter app built by 64 Labs in Salvador, Brazil that turns those forecasts into a single recommended outing window and a single "when to leave" time. The landing page describes three steps: pick the beach, set the conditions that matter, and add travel time and planned stay; Bora Praia evaluates the available forecast, tide, wind and daylight data and recommends the best window. Coverage is honest — weather is broad, tide/marine coverage varies by provider and location, and the app shows clear confidence or unavailable states rather than overpromising. The app is on the App Store (id 6758357483) and Google Play, with a Flutter Web / PWA build that drops authentication, sharing, maps and notifications.

## Objective

Ship a Flutter beach-planning app on iOS, iPad, Android and the web that turns weather, tide, wind, daylight and travel time into a single "Perfect Timing" departure recommendation and outing window for a chosen beach, with honest confidence states where data is missing. The MVP must cover the three-step flow, the Perfect Timing engine, and the documented "show confidence or unavailable" behaviour for tide and marine providers.

## Target Users

- Primary: residents and visitors in coastal cities (Brazil first, given the build origin in Salvador) who want to pick the right beach and the right hour without checking four apps.
- Secondary: surfers, families with kids, and dog-owners who each weight different conditions (waves, tide, wind) and want to set them once.
- Tertiary: travellers planning a beach day in an unfamiliar city who need travel-time-aware timing.

## MVP Scope

- A "Pick a place" step backed by a curated beach directory with map view (mobile) or list view (web).
- A "Conditions that matter to you" step: temperature, rain risk, wind, waves, tide (low/high), daylight, sea temperature — each with thresholds the user can switch on or off.
- A "Travel time and planned stay" step that accepts driving/walking time and visit duration.
- A Perfect Timing engine that recommends a departure time and outing window for the chosen date, accounting for travel time, visit duration, daylight and the local timezone.
- A forecast view with current, hourly and seven-day weather alongside rain risk, wind, daylight, tide, wave and sea-temperature signals where the provider exposes them.
- Clear confidence states ("low confidence", "unavailable") wherever tide or marine data is missing, instead of misleading zeros.
- Native iOS and Android apps; Flutter Web / PWA build with documented feature gaps (no auth, sharing, maps, notifications).
- Made by 64 Labs Inc; ship in EN and PT-BR at launch.

## Design Direction

See `DESIGN.md` for this project's design tokens. The primary surface is a single "Perfect Timing" card with the recommended departure time and outing window above a clean conditions strip. Neutral, beach-appropriate palette (sand, sea, sky, one accent for the recommended state), one display family for headings, one text family for body, tabular numerals for the clock readout so departure times align cleanly. No third-party tracking beyond essential crash reporting.

## Constraints

- Where tide or marine data is unavailable, the UI must show a clear "unavailable" state, not a fabricated number.
- The Perfect Timing engine must account for the local timezone of the chosen beach, not the user's device timezone.
- The web build must visibly mark which features are missing compared with the mobile app.
- Personal location data must stay on the device by default; sharing or saving a planned day is opt-in.
- App must run offline against cached forecasts for the selected beach for at least 24 hours after last sync.
