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

## Problem

In the Bay Area the evening air cools to a comfortable temperature, and opening the windows instead of running the A/C saves a noticeable amount of money — the author (HN user `gregable`) says it has saved him a decent amount on A/C bills. The catch is that catching that moment means checking a forecast every hour, which he describes as exactly the kind of job a computer should do. He originally solved it for himself as a Home Assistant automation and ran it that way for years, then realised the automation needs no sensors at all, only a location, so anyone could use it. The remaining problems are in delivery, not detection: SMS through Twilio is prohibitively expensive for a free service, email at scale is not free either (a commenter makes the same point), and on iOS web push only works if the user adds the site to their home screen.

## Objective

Watch one saved location against a user-chosen set of comfort conditions and send a notification when conditions become nice and another when they stop — with a notification channel whose per-user cost stays compatible with the service being free.

## Target Users

- Primary: people in a climate with a comfortable window in the day (the author's own case: Bay Area evenings) who want to open the windows instead of running A/C and do not want to poll a forecast hourly.
- Secondary: people sensitive to air quality who need the "nice outside" signal to include AQI, which the author already pulls hourly from the major AirNow stations in the US.
- Tertiary: home-automation users — the origin of the project — though the author notes that group is niche and may just pull weather data directly.

## MVP Scope

- One saved location per user, no sensors required.
- A user-picked condition set: temperature range, wind, rain, dew point, air quality.
- Two notifications per episode: one when conditions become nice, one when they stop. The author states this is the whole product.
- Delivery via browser web push and email; no native app in v1.
- Web-native, free, no install — except the iOS home-screen add that push requires there.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- No SMS. The author wanted Twilio SMS and ruled it out as prohibitively expensive for a free service; a commenter adds that email at scale is not free either.
- iOS requires the site be installed to the home screen before web push works, which is friction the web-native approach cannot remove.
- AQI resolution is uneven: hourly data from major AirNow stations covers the US; outside the US the author has no equivalent source yet and is looking at PurpleAir.
- Weather is served from a self-hosted Open-Meteo instance (ECMWF global plus NOAA HRRR at 3 km for the US), so global users get coarser resolution than US users.
- Free service, so per-user notification and compute cost is the binding constraint on every feature.
