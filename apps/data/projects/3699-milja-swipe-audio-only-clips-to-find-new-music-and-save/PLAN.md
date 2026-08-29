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

## Tech Stack

- **Client:** Swift + SwiftUI, native iOS. The app is iOS-only in v1; Android is not in the BetaList listing.
- **Taste model:** on-device CoreML model (small, periodic retraining on the device's swipe history); no server-side profile is built per user.
- **Audio:** AVFoundation for clip playback, with prefetching of the next clip from the catalog API so the swipe gesture has zero perceived latency.
- **Apple Music integration:** MusicKit (iOS 16+); authorization is requested once on opt-in, then "Milja Likes" playlist updates use the playlist-write API.
- **Catalog:** a small Python service (FastAPI) that aggregates short-clip metadata and CDN URLs from the licensed sources, behind a signed-URL endpoint.
- **Sync persistence:** iCloud (CloudKit private database) for the user's swipe history, so a device migration does not reset the taste model.
- **Analytics:** none. The build is verified pre-release to contain zero third-party analytics SDKs.

## Architecture

```
iPhone (SwiftUI)
   │
   ├─▶ on-device taste model (CoreML)
   │     │
   │     └─▶ reads swipe history from CloudKit private DB
   │
   ├─▶ swipe gesture ──▶ score clip ──▶ fetch next clip
   │                          │
   │                          ▼
   │                   catalog API (FastAPI, signed URLs)
   │                          │
   │                          └─▶ CDN (signed URL, ~15–30s clip)
   │
   └─▶ Apple Music (MusicKit)
         │
         └─▶ "Milja Likes" playlist on swipe-right
```

The whole client is intentionally small. The taste model runs locally and the swipe history lives in the user's private CloudKit database. The catalog is the only piece of state the operator owns, and it is clip metadata, not user state.

## Milestones

1. **M0 — Catalog + clip player.** FastAPI catalog service with signed CDN URLs, SwiftUI player that can preload and crossfade short clips. End of week 3.
2. **M1 — Swipe gesture + on-device taste model.** Gesture handling, CoreML model trained on synthetic data and refined online from the user's swipe history, prefetched next-clip selection. End of week 6.
3. **M2 — Apple Music opt-in.** MusicKit authorization, "Milja Likes" playlist creation, write-through on swipe-right with retry and offline queue. End of week 9.
4. **M3 — CloudKit sync.** Swipe history in the user's private database, device-to-device sync tested on the same iCloud account. End of week 11.
5. **M4 — Genre catalog breadth.** 30+ genre categories seeded in the catalog, weighted by per-genre swipe statistics; editorial seeding rules documented. End of week 13.
6. **M5 — No-SDK audit.** Build pipeline scans the linked frameworks and rejects any third-party analytics or ad SDK before TestFlight upload. End of week 14.
7. **M6 — TestFlight beta.** 500 external testers, weekly release cadence, weekly retention read-outs. End of week 18.

## Risks

- **Catalog licensing.** The BetaList listing does not state where the short clips come from. If they are aggregated from storefronts without a licensing deal, the App Store review process or a takedown from a rights holder can kill the app overnight. The catalog service must be built so that source provenance is auditable per track.
- **Cold-start taste convergence.** With no questionnaire and no history import, a new user may swipe through 30 tracks of noise before the model "finds" their taste. The MVP must ship with a curated seed set per genre so the first 10 swipes feel responsive, not random.
- **MusicKit write API rate limits.** Apple Music's playlist-write endpoint rate-limits per developer token. If a power user generates hundreds of swipe-rights in a single session, the sync can fall behind. The write queue must be persistent and back off intelligently.
- **Privacy posture vs. growth.** "No analytics, no ads" forecloses the standard mobile growth loops (install-attribution, retargeting, A/B-tested onboarding). The team must accept that growth will be slower and rely on word-of-mouth, App Store editorial, and the Apple Music integration as the distribution channel.
- **iOS-only ceiling.** The BetaList listing only mentions iPhone. If the app catches on, the absence of an Android client will be both a ceiling on TAM and a competitive opening for a copycat. The architecture is intentionally not cross-platform; if Android becomes a requirement, a fresh build is needed.
