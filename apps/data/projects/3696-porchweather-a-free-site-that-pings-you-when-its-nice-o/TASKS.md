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

## Phase 0: Scaffold

- [x] Capture the problem and stack from the Show HN post
- [ ] Write DESIGN.md (condition picker, location card, notification states)
- [ ] Provision ECS Fargate cluster, DynamoDB tables, Cognito user pool, SES sending identity
- [ ] Stand up the self-hosted Open-Meteo instance with ECMWF global + NOAA HRRR

## Phase 1: Core

- [ ] Location save: one location per user, geocoded, no sensor input required
- [ ] Condition set editor: temperature range, wind, rain, dew point, AQI thresholds
- [ ] Hourly AirNow ingestion for US AQI, stored per station with staleness handling
- [ ] Evaluation loop in Rust: score each subscription against forecast + AQI, persist nice / not-nice state
- [ ] Transition detection with hysteresis and a minimum episode length so near-threshold conditions do not flap
- [ ] Web push registration, including the iOS add-to-home-screen prompt and a clear explanation of why it is required
- [ ] SES email delivery as the fallback channel, with per-user send caps to hold cost down
- [ ] Two-notification contract per episode: started nice, stopped nice — no interim messages
- [ ] Cost instrumentation: notifications sent and forecast evaluations per user per month
- [ ] End-to-end test: seed a forecast that crosses a threshold and back, assert exactly two notifications

## Phase 2: Deploy

- [ ] Launch free, measure notification cost per active user against the free-service budget
- [ ] Evaluate PurpleAir or user-submitted station data for AQI outside the US
- [ ] Decide on a polling API surface for home-automation users, per the HN suggestion
- [ ] Revisit the native-app question only if iOS install drop-off proves it necessary
