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

## Phase 0: Scaffold

- [x] Read the Show HN post and landing page to confirm the three-step flow, the Perfect Timing positioning, and the honest coverage states
- [x] Write SPEC.md (this document)
- [x] Curate the initial beach directory for the launch region with map and list views
- [x] Scaffold the Flutter project with iOS, Android, and web targets plus the EN and PT-BR string tables

## Phase 1: Core

- [ ] Build the pick-a-place, conditions-thresholds, and travel-and-stay steps
- [ ] Implement the Perfect Timing engine with travel time, visit duration, daylight, and the beach's local timezone
- [ ] Wire Open-Meteo weather, wind, and daylight plus the marine tide and wave providers
- [ ] Implement confidence and unavailable states wherever tide or marine data is missing
- [ ] Add the forecast view (current, hourly, seven-day) with rain risk, wind, tide, wave, and sea temperature
- [ ] Verify the 24-hour offline cache per selected beach

## Phase 2: Deploy

- [ ] Ship iOS (App Store id 6758357483) and Android (Google Play), in EN and PT-BR
- [ ] Deploy the Flutter Web / PWA build with visible feature-gap markers for auth, sharing, maps, and notifications
- [ ] Track confidence honesty (zero fabricated values) and the app-store rating target of 4.5+

---

_Generated automatically by Lúa on 2026-08-29_
