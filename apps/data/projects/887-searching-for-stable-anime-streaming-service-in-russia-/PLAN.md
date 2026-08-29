---
id: "887"
slug: searching-for-stable-anime-streaming-service-in-russia-
title: Searching for stable anime streaming service in Russia without VPN requirement
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/ycnydla351-searching-for-stable-anime-streaming-ser"
  captured: "2025-10-23"
category: media
date: "2025-10-23"
tags: [Media, Legal]
country: Russia
wtp:
  raw: "300-500 RUB per month"
  currency: RUB
  min: 300
  max: 500
  period: month
  mrrMid: 400
tech: [HLS / DASH streaming, CDN (Russian PoPs), licensed-content ingestion pipeline, Android TV / iOS / Web clients, "payment: YooKassa / Robokassa"]
---
# Searching for stable anime streaming service in Russia without VPN requirement

## Tech Stack

- **Streaming pipeline:** HLS / DASH packaging, encoded at multiple bitrates (480p / 720p / 1080p) per title; origin storage on Yandex Object Storage, edge delivery via Yandex Cloud CDN with Russian PoPs.
- **Clients:** React Native for iOS + Android, a Kotlin-native Android TV app (Leanback), a Tizen / webOS app for Smart TVs, and a Next.js web client.
- **Content management:** a Ruby on Rails or Node.js back-office for the catalogue team to ingest titles, attach subtitles, attach dubs, schedule releases, and clear content against Russian regulatory rules.
- **Subtitles:** WebVTT served alongside the manifest; per-episode subtitle files versioned in a small object store.
- **Dubs:** the top-50 titles get native Russian dub from a contracted studio; the rest are subtitled only.
- **Payments:** YooKassa (primary), Robokassa (fallback), and SBP (Система Быстрых Платежей) for users without cards; 7-day trial flow; auto-renewing subscriptions.
- **Auth:** email + password plus phone-number OTP for the Russian audience's preference for SMS login.
- **Recommendations:** a lightweight collaborative-filtering model trained on play / completion data — no deep personalisation in v1.
- **Hosting:** all infrastructure inside Russia (Yandex Cloud, Rostelecom DC, or Selectel) to minimise cross-border latency and regulatory risk.

## Architecture

A standard streaming architecture: origin storage, CDN edge, manifest server, and a thin client app per surface. The catalogue and subscription state live in Postgres; play events stream into ClickHouse for analytics. The recommendations service is a small Python service that reads ClickHouse aggregates nightly. All client apps share a single content API (titles, episodes, manifests) and a single subscription API.

```
Clients (Web / iOS / Android / Android TV / Smart TV)
        │
        ▼
Content API ──▶ Postgres (catalogue, episodes, subs)
        │
        ├──▶ Origin store (Yandex Object Storage) ──▶ Yandex Cloud CDN (Russian PoPs)
        │
        ├──▶ Subscription API ──▶ YooKassa / Robokassa / SBP webhooks
        │
        └──▶ Play events ──▶ ClickHouse ──▶ Recommendation service (nightly)
```

## Milestones

1. **M0 — Legal entity + licensing strategy.** Russian LLC registered; Russian compliance officer hired; retainer with a Russian media law firm; first studio licensing conversations open. End of month 1.
2. **M1 — MVP catalogue (100 titles).** First batch of studio-licensed titles cleared against Russian regulatory rules; Russian subtitles live for the entire catalogue. End of month 4.
3. **M2 — Web + iOS + Android clients.** Three clients share the same content API; HLS playback validated end-to-end. End of month 6.
4. **M3 — Android TV + Smart TV clients.** TV-native clients (not phone-mirrored); the most important surface for Russian households. End of month 8.
5. **M4 — Subscription + trial flow.** YooKassa / Robokassa / SBP live; 7-day trial; auto-renew; cancellation flow. End of month 9.
6. **M5 — Top-50 native Russian dubs.** First 50 titles dubbed by a contracted Russian dubbing studio; the headline catalogue claim. End of month 14.
7. **M6 — Public launch.** Marketing campaign targeted at the Russian anime community (VK, Telegram, anime forums). End of month 15.

## Risks

- **Roskomnadzor reach.** Even a fully licit service can be collateral in a regulatory wave. The product must have a Russian entity, a Russian compliance officer, a Russian law firm on retainer, and a relationship with the regulator before launch.
- **Studio licensing willingness.** Many Japanese studios paused Russian distribution after 2022; the MVP catalogue is gated on which studios will still license. Build the licensing pipeline so titles can be added in batches as deals close.
- **Single-CDN dependency.** Yandex Cloud CDN is the obvious choice for Russian PoPs but ties the product to a single supplier. A multi-CDN failover (CDNvideo, Rostelecom, or Selectel as secondary) is the v1.1 target.
- **Payment-rail reliability.** International cards are unreliable for Russian subscribers; YooKassa + Robokassa + SBP from day one is mandatory. Auto-renew failure rates must be measured monthly.
- **Dub capex.** Russian dubbing for top-50 titles is a significant per-title cost; the dub catalogue is a marketing claim that the budget must back.
- **Reachability is the existential KPI.** A six-month "no Roskomnadzor block" window is the metric the product is judged by; any approach that threatens that window is a non-starter.
