---
id: "3699"
slug: milja-swipe-audio-only-clips-to-find-new-music-and-save
title: Milja – Swipe audio-only clips to find new music and save to Apple Music
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/milja?utm_campaign=startup-181079&utm_medium=atom&utm_source=newsfeed"
  captured: "2026-08-29"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [Swift, SwiftUI, CoreML, MusicKit, CloudKit]
---
# Milja – Swipe audio-only clips to find new music and save to Apple Music

## Phase 0: Scaffold

- [x] Capture problem from BetaList + write SPEC.md skeleton
- [ ] Provision the FastAPI catalog service with signed-URL CDN integration and a small genre taxonomy
- [ ] Xcode project scaffold (Swift + SwiftUI), TestFlight build pipeline, no third-party SDKs verified at link time
- [ ] Apple Developer account + MusicKit capability registered, App Store Connect app record created
- [ ] Catalog licensing: identify the source of short clips and the contractual terms; if licensing is unclear, do not ship until it is
- [ ] CloudKit container set up with a private database schema for `swipe_event` rows

## Phase 1: Core

- [ ] SwiftUI player that opens directly into playback on cold start, no onboarding screen, no login wall
- [ ] Short-clip audio engine (AVFoundation), prefetch of next clip so a swipe has zero perceived latency, background audio session so playback continues when the screen locks
- [ ] Swipe gesture model: right (yes), left (no), up (no with different signal weight); CoreML on-device model that updates from the swipe history and selects the next clip
- [ ] Curated seed set per genre so the first 10 swipes feel responsive even before the model converges on a new user
- [ ] MusicKit opt-in: single screen, single button, requests authorization, creates the "Milja Likes" playlist in the user's library, persists the playlist ID locally
- [ ] Write-through on swipe-right to the "Milja Likes" playlist with a persistent queue and retry; offline swipes sync when connectivity returns
- [ ] CloudKit private database for swipe history, device-to-device sync verified on the same iCloud account
- [ ] Pre-release "no third-party analytics SDK" audit step in the build pipeline, enforced as a CI gate
- [ ] End-to-end test: cold open → audio plays → 10 swipes → Apple Music playlist contains the 5 right-swipes within 60 seconds

## Phase 2: Deploy

- [ ] App Store submission with privacy label declaring only on-device swipe data and (when opted in) Apple Music playlist write access
- [ ] TestFlight beta with 500 external testers, weekly release cadence, weekly retention read-outs
- [ ] Editorial outreach to Apple Music's discovery editorial team and to music press (Pitchfork, The Quietus, Resident Advisor) that covers niche genres
- [ ] Public release post that explicitly names the chart-monotony problem and the privacy posture as the differentiators
- [ ] Quarterly review of whether the "no analytics, no ads" promise still matches the funding runway, and a public statement either way
