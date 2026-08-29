---
id: "3696"
slug: porchweather-a-free-site-that-pings-you-when-its-nice-o
title: "PorchWeather – a free site that pings you when it's nice outside"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484064"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [SvelteKit, Rust, DynamoDB, AWS Cognito, Amazon SES, Self-hosted Open-Meteo, ECS Fargate, Web Push]
---
# PorchWeather – a free site that pings you when it's nice outside

## Tech Stack

The author published the stack in the Show HN post:

- **Frontend:** SvelteKit SPA, web-native, no app store.
- **Backend:** Rust, running on ECS Fargate.
- **Data store:** DynamoDB.
- **Auth:** AWS Cognito.
- **Email:** Amazon SES.
- **Weather:** self-hosted Open-Meteo, serving ECMWF global plus NOAA HRRR at 3 km resolution for the US.
- **AQI:** hourly pulls from the major AirNow stations in the US; PurpleAir under evaluation for wider coverage.
- **Notifications:** web push primarily, email as the fallback. SMS via Twilio was evaluated and rejected on cost.

## Architecture

A location plus a condition set is a subscription row in DynamoDB. The Rust service evaluates each subscription against the current forecast from the self-hosted Open-Meteo instance and the hourly AirNow pull, and tracks a per-subscription state — nice or not nice. Notifications fire only on transitions, which is why the product is two messages per episode rather than a stream: one when the state flips to nice, one when it flips back. Self-hosting Open-Meteo is the cost decision that makes evaluating every subscription on every cycle affordable for a free service; a metered third-party forecast API would price the loop out.

## Milestones

1. **M0 — Condition model.** Settle the condition set (temperature range, wind, rain, dew point, AQI) and the transition semantics that avoid flapping. End of week 2.
2. **M1 — Self-hosted forecast layer.** Open-Meteo on Fargate serving ECMWF global and HRRR for the US. End of week 4.
3. **M2 — Subscriptions + evaluation loop.** Cognito auth, one saved location per user, state tracked per subscription. End of week 6.
4. **M3 — Delivery.** Web push plus SES email, including the iOS home-screen install flow. End of week 8.
5. **M4 — AQI beyond AirNow.** Evaluate PurpleAir and user-pushed station readings for non-US coverage. Unscheduled; the author has not committed to it.

## Risks

- **Notification economics.** The channel the author wanted (Twilio SMS) is prohibitively expensive for a free service, and an HN commenter points out email at scale is not free either. Web push is the cheapest option and the one with the worst delivery story on iOS. This risk is unresolved in the source and is the main thing that could force a pricing change.
- **iOS push requires a home-screen install.** A web-native product's activation funnel now includes a step most users have never performed. The author floats building a native app purely to remove it.
- **Flapping around thresholds.** Conditions that oscillate near a user's temperature or AQI boundary will generate repeated start/stop pairs. Hysteresis and a minimum episode length are needed or the two-notification promise becomes noise.
- **Uneven data coverage.** HRRR gives the US 3 km resolution; the rest of the world gets ECMWF global. AQI outside the US has no source yet. Users abroad get a measurably worse product, and the source does not say how that gap gets closed.
- **Polling API as an alternative surface.** A commenter suggested letting users poll configurable endpoints from their home automation to cap notification cost. The author has not prioritised it and suspects that audience would pull weather data directly instead — so it is an option, not a plan.
