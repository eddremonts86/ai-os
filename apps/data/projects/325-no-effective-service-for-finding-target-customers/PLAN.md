---
id: "325"
slug: no-effective-service-for-finding-target-customers
title: No effective service for finding target customers
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/8bz4qkj921-no-effective-service-for-finding-target-custo"
category: marketing
date: "2025-10-29"
tags: [Marketing, Sales, Business]
country: Russia
tech: [Next.js 14, TypeScript, Postgres + pgvector, Yandex DataLens + VK Ads + Telegram Ads adapters, OpenAI API, YooKassa]
---
# No effective service for finding target customers

## Tech Stack

- Next.js 14 (App Router) + TypeScript for the SMB console.
- Postgres + pgvector on Hetzner for customer profiles, channel mixes, performance data.
- Yandex Direct API + VK Ads API + Telegram Ads API + Avito API + Dzen API adapters.
- OpenAI API for campaign-asset generation in Russian.
- YooKassa for RUB billing.
- Cloudflare for ingress.
- Sentry + Logtail for monitoring.

## Architecture

Next.js console hosts the customer profile, the channel-mix recommendation, the campaign assets, and the performance dashboard. Channel-mix recommender uses a weighted rule engine (industry × region × budget → channel weights). Asset generation pipeline: per-platform templates + OpenAI with Russian-language prompts. Performance dashboard pulls from each platform's API where available; user-uploaded CSV fallback for the rest. No automated ad-buying in v1; the user uploads assets per platform.

## Milestones

1. **M0** — Spec freeze, customer profile intake + channel-mix recommender MVP. End of week 1.
2. **M1** — Campaign-asset generation per platform + budget allocator. End of week 4.
3. **M2** — Performance dashboard with per-platform API adapters. End of week 7.
4. **M3** — Agency tier: multi-client workspaces + white-label reports. End of week 10.
5. **M4** — Pilot with 50 Russian SMBs; measure CPA delta at week 12.

## Risks

- **Ad-policy violations** — Mitigation: per-platform policy; required-disclaimer library; review queue.
- **Budget blowout** — Mitigation: per-channel caps; daily-burn alerts; explicit user review.
- **Performance dashboard accuracy** — Mitigation: platform APIs where available; CSV fallback.
