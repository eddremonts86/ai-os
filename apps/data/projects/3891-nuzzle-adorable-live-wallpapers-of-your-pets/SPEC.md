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

## Problem

The capture is one sentence from the author: "Made this as there just wasn't any good live wallpaper iOS apps." The product claim carried by the title is Nuzzle, an app that turns photos of your pets into adorable live wallpapers for an iPhone. The post offers no feature list, no pricing, and no links beyond the Show HN thread itself; the only stated motivation is a gap the author perceived in the quality of existing live wallpaper apps on iOS.

## Objective

Ship the iOS app the title describes: a user picks a photo of their pet, the app produces an animated, live wallpaper version of it, and the result lands on the phone's lock or home screen. The MVP targets the exact gap the author names — a live wallpaper experience good enough that he considered the existing iOS options not worth using.

## Target Users

- Pet owners with iPhones who want their pet on the lock screen rather than a static photo.
- People who gift personalized phone content to friends and family.
- iOS users who tried existing live wallpaper apps and found them, in the author's words, not good.

## MVP Scope

- Import a pet photo from the photo library.
- Apply an effect pass that turns the still into an animated, live wallpaper asset.
- Preview the result before committing.
- Save the wallpaper into the iOS wallpaper flow with the fewest possible taps.

## Constraints

- iOS only: the author frames both the gap and the app in terms of iOS live wallpapers.
- Adorableness is the product bar and it is subjective; the MVP must lean on taste, not features.
- The capture contains one sentence, so every technical choice below is ours, not the author's.
- Nothing about monetization or data handling is stated; no such claims may be invented.

## Design Direction

See `DESIGN.md` for this project's design tokens.
