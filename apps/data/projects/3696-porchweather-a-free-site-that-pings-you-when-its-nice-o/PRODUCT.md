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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

You say what "nice outside" means for your location — temperature range, wind, rain, dew point, air quality — and get pinged when it starts and when it stops. No sensors, no app, no hourly forecast checking. The author's own version of this saved him a decent amount on A/C bills.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Homeowners in cooling climates | Opening the windows at the right hour replaces A/C spend; the window is easy to miss. |
| Air-quality-sensitive people | "Nice outside" is only useful if AQI is part of the condition set, which it is. |
| Home Assistant users | This started as one of their automations; the author notes they may prefer pulling weather data directly. |

## Jobs To Be Done

1. **Functional job** — Know the moment outdoor conditions cross into comfortable, without checking a forecast every hour.
2. **Emotional job** — Stop feeling like you missed the good part of the day.
3. **Social job** — Run the house on open windows instead of A/C.

## Success Metrics

- **Activation:** a new user saves a location and a condition set, and receives their first start-of-episode notification.
- **Notification precision:** episodes flagged nice that the user does not act on — the false-positive rate is the whole product's credibility.
- **Delivery reliability on iOS:** share of iOS users who complete the home-screen install and actually receive push.
- **Cost per notified user per month:** the number that decides whether the service can stay free.

## Pricing & Monetization

Free, stated by the author. There is no pricing model in the source; the interesting economics are on the cost side, where SMS was already rejected as too expensive and email at scale was flagged as non-free.

## Competitive Landscape

- **Home Assistant automations** — where this project started; capable but requires a self-hosted setup, and the author judges that group niche.
- **Standard weather apps and forecast widgets** — show conditions, do not watch for a user-defined comfort threshold and ping on transitions.
- **Pulling a weather API directly** — the author notes technical users may simply do this rather than use a service.

## Risks & Open Questions

- [ ] Notification cost at scale is unresolved: SMS ruled out, email at scale flagged as not free by an HN commenter, web push carries the iOS install requirement.
- [ ] A commenter proposed configurable API polling endpoints so home-automation users pull at their own pace and cap the cost; the author has not prioritised it and thinks that group may bypass the service anyway.
- [ ] AQI outside the US has no data source yet. PurpleAir is under consideration, as is letting users push readings from their own stations.
- [ ] Whether to ship a native app at all — the author says maybe, if demand appears, purely to make iOS push easier.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49484064) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
