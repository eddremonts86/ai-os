---
id: "3891"
slug: nuzzle-adorable-live-wallpapers-of-your-pets
title: "Nuzzle – adorable live wallpapers of your pets"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497509"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [SwiftUI, iOS Live Photos, Core Image, Photos framework, WidgetKit, App Store distribution]
---
# Nuzzle – adorable live wallpapers of your pets

## Tech Stack

- **SwiftUI:** the pick, edit and preview flow.
- **Photos framework:** library access and photo import.
- **Core Image:** the animation and effect passes.
- **iOS Live Photo composition:** building the wallpaper asset itself.
- **WidgetKit:** letting the pet extend onto the home screen later.
- **App Store distribution:** TestFlight first, production later.

## Architecture

- Photo import from the library into the edit screen.
- An effect pipeline: source photo, motion pass, live wallpaper export.
- A preview that plays the animation exactly as iOS will render it.
- Wallpaper handoff into the system save flow.
- An optional widget extension reusing the same generated asset.

## Milestones

1. **M0 — Scaffold:** Xcode project, photo import, preview screen, TestFlight channel.
2. **M1 — The animation pass:** one effect that turns a pet still into a live wallpaper asset.
3. **M2 — Save and polish:** wallpaper handoff, re-run loop, effect variety.
4. **M3 — App Store submission:** release, rating monitoring and the share-out flow.

## Risks

- iOS wallpaper APIs define strict bounds on live assets; effects must fit them.
- Battery and performance need measurement on real devices, not simulators.
- A solo iOS app lives and dies on App Store discovery.
- Taste risk: the effect pass must clear the author's own bar of good.
