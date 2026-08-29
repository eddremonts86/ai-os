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

## Value Proposition

A free, cross-device internet radio app with named mood / genre stations and a hosted dashboard for anyone who wants to run their own 24/7 stream without standing up Icecast themselves.

**One-liner:** Tune in anywhere. Start one yourself.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Listeners | They want a "tune in" experience that runs in the background on iPhone, iPad, Apple Watch, or a browser tab, with named stations matched to mood and genre. |
| Station owners | They have a music library and a curator's instinct; the hosted dashboard gives them upload, broadcast, and listener stats without learning Icecast. |
| Small music communities and labels | They want a hosted station they can promote as a home for their catalogue, with a real-time now-playing feed. |

## Jobs To Be Done

1. **Functional job** — Tune in to a 24/7 station that matches a mood, from any device, without setting up an account.
2. **Emotional job** — Replace the "I just want background music while I work" friction with a one-tap ambient station.
3. **Social job** — Run a station with your own taste, share the link, watch the listener count on the dashboard.

## Success Metrics

- **Activation:** % of marketing-site visitors who tap "Listen on the web" or install the iOS app and tune in within a session.
- **Retention:** Daily tune-ins per listener; the product is background-listening, so a listener who comes back daily is the retention signal.
- **Revenue:** Free at the entry tier; no pricing tier is named in the source. The business model is an open question — ad-supported, listener-supported, or per-station hosting fees are all obvious shapes.

## Pricing & Monetization

The landing page shows "Listen on the web" and "Download on the App Store" with no pricing tier. The station-owner dashboard exposes Upload, Broadcast, and Stats with no tier gating in the source. No subscription, no ads, no per-station fee is named. The pricing shape is unstated.

## Competitive Landscape

The HN thread names the lineage directly: StreamTuner (StreamTuner-ng), radio-browser.info, Icecast / SHOUTcast servers. The product positions itself as the modern, cross-device layer on top of that lineage — "Tune in. Anywhere." The product does not name competitors on the landing page.

## Risks & Open Questions

- **Music licensing.** A 24/7 internet radio that anyone can start is a music-licensing minefield. The MVP needs a clear policy on who is responsible for PRO / SoundExchange / DMCA compliance — the station owner, the platform, or both. The source does not address this.
- **Cross-device parity.** iPhone, iPad, Apple Watch, and the web must show the same catalogue and the same now-playing. A watchOS app on the App Store is a commitment that has to be sustained across watchOS releases.
- **Station-owner onboarding.** "Anyone can start one" is the promise; the MVP needs the signup-to-first-broadcast path to be measured and below five minutes, or the funnel dies.
- **Revenue model unstated.** Free + free + free is not a business. The MVP has to decide whether the shape is ad-supported, listener-supported, or per-station hosting — and the post leaves this open.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49485708) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
