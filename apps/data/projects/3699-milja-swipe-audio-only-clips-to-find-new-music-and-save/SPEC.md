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

## Problem

Music discovery on phones in 2026 is dominated by recommendation surfaces that, the poster argues, have a chart-monotony problem: the same handful of songs repeat across listeners, and discovery "flows" interrupt the user with screens of context — quizzes, history imports, account linking, onboarding questionnaires — before they hear anything. The Milja proposal is to invert the loop: open the app, audio starts playing immediately, every swipe (right for yes, left or up for no) steers the next clip, and the user has found a song within seconds without ever filling in a profile. The app is audio-only (no video) for pocket listening and covers dozens of genres drawn from global storefronts, which is the explicit response to chart monotony. The optional integration is with Apple Music: a swipe-right builds a real playlist in the user's connected Apple Music account. The privacy posture is "swipes and opens only — no third-party analytics, no ads," which is unusual for a free discovery app.

The implicit problem the poster is naming is that discovery friction (questionnaires, history imports, account linking) is a self-imposed cost the major services have learned to charge in exchange for personalisation, and that a friction-free, audio-only alternative is missing.

## Objective

Ship an iOS music discovery app whose first frame is audio and whose only input is a swipe. The MVP must (a) start playback on cold open, (b) learn taste from swipe signals without any questionnaire, (c) cover enough genre variety to escape chart monotony, (d) optionally sync swiped-right songs into the user's real Apple Music library as a playlist, and (e) ship with no third-party analytics and no ads.

## Target Users

- Primary: iPhone owners who already have an Apple Music subscription and want a faster way to fill their library with new tracks than browsing editorial playlists. The Apple Music integration is the wedge.
- Secondary: music listeners who do not currently pay for a streaming service and want a free discovery surface that does not interrupt them with quizzes or onboarding. These users get the discovery loop but no library sync.
- Tertiary: listeners in genres that are chronically under-represented on chart-driven surfaces (jazz, regional folk, classical sub-genres, niche electronic); the "dozens of genres across global storefronts" claim is targeted at them.

## MVP Scope

- A native iOS app (Swift + SwiftUI) that opens directly into playback; no onboarding screen, no login wall, no profile.
- A swipe gesture model with three actions: right (yes), left (no), up (no with a different signal weight). The model weights the next-track selection from the swipe history without any persisted user profile.
- Audio-only playback: short clips of ~15–30s from a catalog spanning dozens of genres, sourced from the public storefronts and aggregated server-side.
- Apple Music integration via MusicKit: a single opt-in toggle that requests user authorization and creates / updates a "Milja Likes" playlist in the user's library on every swipe-right.
- A pure-local telemetry model: every interaction is stored on-device; no third-party analytics SDK, no advertising SDK.
- A catalog refresh path that adds new tracks server-side without an app update.

## Design Direction

See `DESIGN.md` for this project's design tokens. Audio-first UI: full-bleed album art as the background, swipe gestures as the only required input, a small chip in the top corner showing which swipe does what. The Apple Music connection is the only modal screen, and only ever shown once.

## Constraints

- "No third-party analytics and no ads" is a published promise. Any future analytics or monetisation layer has to be a deliberate departure from this position, not an accidental SDK addition.
- The app must work without an Apple Music account; the discovery loop is the core, and the integration is a sync, not a prerequisite.
- Swipe gestures must be the primary input; tap-to-skip and other accidental inputs must not pollute the taste model. A misfire (user swipes by accident while walking) must be reversible from the next swipe without losing history.
- The app must not collect personal data beyond swipe and open events, and those events must remain on-device by default. A future cloud-sync path must be opt-in and explicit, not a default.
- "Audio-only" must hold across the entire experience; adding video previews or canvas art is out of scope for v1.
