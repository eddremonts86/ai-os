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

## Phase 0: Scaffold

- [x] Read the Show HN post and the linked music-buddha.com site to extract the three rules and per-app features
- [x] Write SPEC.md (this document)
- [x] Create the iOS project with on-device storage and no network entitlements
- [x] Set up the single-email Android waitlist (Cloudflare) as described on the site

## Phase 1: Core

- [ ] Implement song learning screens for Guitar Buddha
- [ ] Implement riff capture and playback (the capture-an-idea flow)
- [ ] Add backing band jamming and the tuner
- [ ] Build the quiet practice memory with no streaks, goals or badges

## Phase 2: Deploy

- [ ] Ship the three sibling apps (Ukulele, Drum, Bass) on the shared core
- [ ] Wire opt-in anonymous analytics, off by default, into every app
- [ ] Launch the Android build and send the one promised waitlist email
