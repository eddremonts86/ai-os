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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An iPhone owner opens the app, hears a song within a second, and signals like or dislike with a swipe. After enough swipes, the recommendations match their taste without ever filling in a profile, signing up for an account, or importing their listening history. Connecting Apple Music turns every swipe-right into a song in a real "Milja Likes" playlist. The whole experience is audio-only, ad-free, and tracker-free.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Apple Music subscriber | Wants a faster way to find new tracks for their library than scrolling editorial playlists; the Apple Music sync turns swipes into real saved songs. |
| Free-tier music listener | Wants a discovery surface that does not interrupt with quizzes, history imports, or upsells; the swipe loop is the entire onboarding. |
| Niche-genre listener | Tired of seeing the same chart hits on every recommendation surface; the explicit multi-genre catalog promise targets under-served listeners. |
| Pocket-listener / commuter | Wants audio-only (no video) because they are on a train or a bus and the screen is off. |
| Privacy-conscious user | Refuses apps with cross-site trackers and ad SDKs; the "swipes and opens only" promise is the wedge. |

## Jobs To Be Done

1. **Functional job** — Find a new song worth saving in under 30 seconds from cold open.
2. **Functional job** — Build a taste model from the user's swipe history without ever asking them a direct question.
3. **Functional job** — Sync liked songs into a real Apple Music playlist the user actually plays from.
4. **Emotional job** — Stop feeling like every discovery surface starts with a questionnaire or a sign-up wall.
5. **Social job** — Have something to share — a "Milja Likes" playlist that reflects the listener's actual taste, not the chart.
6. **Privacy job** — Use a discovery app that does not track them across the web.

## Success Metrics

- **Activation:** median time from app open to first swipe-right on a saved-quality track is under 5 minutes for first-time users.
- **Swipe throughput:** median user completes ≥ 10 swipes per session in week 1, indicating the gesture model has been learned.
- **Apple Music opt-in rate:** ≥ 35% of active users connect Apple Music within 30 days of install.
- **Sync correctness:** ≥ 99% of swipe-right songs appear in the user's "Milja Likes" playlist within 60 seconds (network permitting).
- **Genre diversity:** the median session spans ≥ 3 distinct genres, validating the chart-monotony counter-claim.
- **Return frequency:** ≥ 40% of week-1 users open the app again in week 2; ≥ 25% are still active in week 4.
- **No-tracking verification:** the app's binary contains zero third-party analytics SDKs (audited before each release).

## Pricing & Monetization

The BetaList listing does not state a price. The article says the app is free to download, the privacy posture excludes ads, and Apple Music integration requires the user's own subscription. A reasonable v1 model is free-with-no-monetisation; a future paid tier could be an offline mode, longer-than-clip previews, or richer Apple Music playlist metadata — but none of these are in the source and should not be invented here.

## Competitive Landscape

- **Spotify Discover Weekly / Release Radar / Daily Mix** — chart-driven and onboarding-heavy; the chart-monotony problem the poster is naming is what these surfaces reproduce.
- **Apple Music's own discovery surfaces (Personal Station, New Music Mix)** — better privacy posture but still account-required and editorial-curated.
- **Last.fm, Bandcamp Daily, The Quietus** — editorial discovery; high quality but no swipe loop and no personalisation model.
- **Taste Discover, Soundcloud's algorithmic feed** — swipe-shaped discovery exists elsewhere but those apps carry third-party trackers and ad surfaces by default; Milja's "no third-party analytics, no ads" position is the explicit differentiator.

## Risks & Open Questions

- [ ] Whether the "dozens of genres across global storefronts" catalog is licensed or scraped, and whether storefront terms-of-service permit short-clip aggregation without a partner deal. The BetaList listing is silent on licensing.
- [ ] Whether a taste model that learns only from swipes (no history import, no onboarding questionnaire) converges quickly enough for new users, or whether week 1 feels like noise until enough swipes accumulate.
- [ ] Whether the privacy posture (no analytics, no ads) is financially sustainable as a free app, or whether a paid tier is inevitable and would betray the original promise. The BetaList listing does not commit either way.
- [ ] Whether the Apple Music integration can survive a MusicKit API change without forcing a rebuild, and whether Apple's playlist-write API rate limits will throttle large sync bursts.
- [ ] Whether "audio-only" is a real wedge or just a constraint that limits the surface where the swipe loop competes (TikTok-style vertical video is the dominant music-discovery surface for under-25 listeners).

---

_Source:_ [BetaList](https://betalist.com/startups/milja) · **Category:** beta · **Tags:** BetaList, Beta, Product
