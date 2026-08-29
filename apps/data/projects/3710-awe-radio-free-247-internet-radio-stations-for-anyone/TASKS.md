---
id: "3710"
slug: awe-radio-free-247-internet-radio-stations-for-anyone
title: "Awe Radio, free 24/7 internet radio stations for anyone"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485708"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [iOS app (Swift/SwiftUI), web player, station-owner dashboard]
---
# Awe Radio, free 24/7 internet radio stations for anyone

## Phase 0: Scaffold

- [x] Marketing site at `aweradio.app` with curated stations and live now-playing.
- [x] iOS app on the App Store (iPhone, iPad, Apple Watch).
- [x] Web player at `listen.aweradio.app` with the same catalogue.
- [x] Station-owner dashboard (Dashboard, Upload, Broadcast, Stats).
- [x] Stations published to radio-browser.info for cross-app discovery.
- [ ] Decide on the licensing posture (PRO / SoundExchange / DMCA) and publish the policy on the marketing site.

## Phase 1: Core

- [ ] Catalogue parity: iOS app, web player, and station-owner dashboard share one source of truth for stations and now-playing.
- [ ] Cross-device background audio on iOS: an audio session that keeps playing when the app is backgrounded, with AirPlay / Bluetooth routing.
- [ ] Station-owner onboarding: measure signup-to-first-broadcast time; the target is under five minutes.
- [ ] Stats sampling: listener count, bandwidth, uptime, CPU, memory sampled at a fixed cadence (every 5s on the web dashboard, every 30s in the long-term store).
- [ ] Tests:
 - Now-playing parity: the now-playing shown on the marketing site, the iOS app, and the web player matches the streaming server's metadata within five seconds.
 - Station-owner funnel regression: a fresh signup can name a station, upload a first track, and broadcast within five minutes.
 - Stats regression: the dashboard reflects the same listener count as the streaming server's accounting.

## Phase 2: Deploy

- [ ] Streaming server (Icecast-class) in production with per-station mounts and now-playing metadata.
- [ ] iOS app on the App Store with all three device targets.
- [ ] Web player on `listen.aweradio.app`.
- [ ] Station-owner dashboard on `listen.aweradio.app/station/`.
- [ ] Music-licensing policy published on the marketing site with the named PROs and the per-station-owner responsibilities.
- [ ] Smoke test in production: tune in to a live station from each device, verify now-playing parity, verify the station-owner dashboard reflects the listener count within the sampling window.
