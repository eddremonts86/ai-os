---
id: "3721"
slug: bora-praia-weather-and-tide-forecasts-turned-into-a-tim
title: Bora Praia – weather and tide forecasts turned into a time to leave
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487925"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Mobile, Weather, Tide, Travel]
tech: [Flutter, Dart, iOS, Android, Open-Meteo, marine weather providers]
---
# Bora Praia – weather and tide forecasts turned into a time to leave

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A beach-goer picks the beach, sets the conditions that matter (rain, wind, waves, tide, daylight, sea temperature), adds travel time and planned stay, and Bora Praia turns weather, tide, wind and daylight forecasts into a single "Perfect Timing" recommendation: when to leave and the best outing window, in the local timezone, with honest confidence states where marine data is missing.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Coastal residents (Brazil-first) | Want the right beach at the right hour without checking four apps. |
| Travellers to an unfamiliar coast | Need a travel-time-aware timing without doing the mental math themselves. |
| Surfers | Want to weight waves, tide and wind as primary conditions. |
| Families with kids | Want low-wind, daylight and tide-pool-friendly windows surfaced. |
| Dog-owners | Want to weight beach access rules, tide and shade into the window. |

## Jobs To Be Done

1. **Functional job** — Get a single recommended departure time and outing window for a chosen beach, given the day's forecast.
2. **Emotional job** — Stop wondering "is this a good time to go?" and stop second-guessing the four-app check.
3. **Social job** — Be the friend who always has the timing right for a beach day.

## Success Metrics

- **Activation:** ≥ 70% of new users complete the three-step plan and view the Perfect Timing card in their first session.
- **Plan-to-visit:** ≥ 40% of users return within 14 days for a second planned beach day.
- **Confidence honesty:** zero fabricated tide or wave values shown in the confidence / unavailable state.
- **App-store rating:** ≥ 4.5 average on the App Store (id 6758357483) and Google Play within the first quarter.
- **Web-to-mobile spillover:** ≥ 15% of PWA visitors open the App Store or Play Store link from the web build.

## Pricing & Monetization

Free to use, no subscription required for the core Perfect Timing flow. Monetisation likely through a future Pro tier with multi-day planning, calendar export, push notifications and a wider beach directory; the source page does not surface a paid tier today, so v1 ships free and the Pro tier is post-MVP.

## Competitive Landscape

- **Generic weather apps** (Apple Weather, Weather Underground, Climatempo) — strong forecast but no tide-aware "leave by" recommendation.
- **Tide-only apps** (Tide Chart, Tide-Track) — accurate tides but no weather or travel-time integration.
- **Surf apps** (Surfline, Magicseaweed) — surf-specific, paid, no plain beach timing.
- **Surf-Forecast / Windy** — powerful but the user still has to do the synthesis themselves.
- **DIY mental model (weather + tide app + Maps)** — works but high cognitive load per beach day.

## Risks & Open Questions

- [ ] Confirm tide and marine coverage in the regions the app will launch in (Brazil first; coverage varies by provider).
- [ ] Decide whether the Perfect Timing algorithm weights user-set conditions equally or uses an opinionated default ordering.
- [ ] Validate offline-cached forecast freshness is acceptable for the 24-hour offline window.
- [ ] Confirm iOS / Android notification permissions copy and timing so the reminder is useful, not annoying.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49487925) · **Category:** show-hn · **Tags:** Show HN,Mobile,Weather,Tide,Travel
