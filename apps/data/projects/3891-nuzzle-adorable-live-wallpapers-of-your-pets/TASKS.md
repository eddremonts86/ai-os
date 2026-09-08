---
id: "3891"
slug: nuzzle-adorable-live-wallpapers-of-your-pets
title: Nuzzle – adorable live wallpapers of your pets
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

## Phase 0: Scaffold

- [x] Read the Show HN capture and keep the author's one-sentence motivation in the record
- [x] Write SPEC.md, PRODUCT.md, PLAN.md and TASKS.md
- [x] Scaffold the Xcode project and TestFlight distribution channel
- [x] Verify the iOS live wallpaper constraints in the current SDK before committing to an effect pipeline

## Phase 1: Core

- [ ] Import a pet photo from the photo library
- [ ] Build the first effect pass from still to animated live wallpaper asset
- [ ] Preview the animation exactly as iOS will render it
- [ ] Hand off the finished wallpaper to the system save flow

## Phase 2: Deploy

- [ ] Add effect variety and a re-make loop for new photos
- [ ] Add a WidgetKit extension reusing generated assets
- [ ] Measure battery impact on real devices
- [ ] Submit to the App Store and monitor early reviews
