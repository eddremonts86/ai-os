---
id: "325"
slug: no-effective-service-for-finding-target-customers
title: No effective service for finding target customers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/8bz4qkj921-no-effective-service-for-finding-target-custo"
category: marketing
date: "2025-10-29"
tags: [Marketing, Sales, Business]
country: Russia
tech: [Next.js 14, TypeScript, Postgres + pgvector, Yandex DataLens + VK Ads + Telegram Ads adapters, OpenAI API, YooKassa]
---
# No effective service for finding target customers

## Problem

Russian SMBs — especially in B2B services, local services, e-commerce niches, and D2C brands — cannot find their target customers effectively through any single channel. The title records the failure as a discovery-channel gap, not a marketing-budget gap. Russian SMBs have access to Yandex Direct, VK Ads, Telegram Ads, Avito, and word-of-mouth, but none of these alone reliably reaches the target customer for a small budget. The result is wasted ad spend, missed quota, and stalled growth.

## Objective

Ship a customer-discovery product purpose-built for Russian SMBs that, given a customer profile (industry, role, region, budget), recommends the optimal channel mix and produces the campaign assets per channel. Outcome: a Russian SMB with a RUB 50k–500k monthly marketing budget runs an effective channel mix without hiring a marketing agency.

## Target Users

Russian SMBs (1–50 FTE) in B2B services, local services (clinic, salon, repair), e-commerce niches, and D2C brands. Founders and marketing leads who have a tight budget and no agency relationship. Secondary: Russian marketing freelancers who want a channel-mix recommender for their SMB clients.

## MVP Scope

Customer profile intake: industry, role, region, budget. Channel-mix recommender with weighted output across Yandex Direct, VK Ads, Telegram Ads, Avito, and Yandex Zen (Dzen). Campaign-asset generator: Yandex Direct text ads, VK Ads creatives, Telegram Ads copy, Avito listings, Dzen articles. Budget allocator with expected reach per channel. Per-channel performance dashboard pulling from each platform's API where available. Russian-language UI + YooKassa RUB billing.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/marketing/8bz4qkj921-no-effective-service-for-finding` follows the constraints in `325-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, Postgres + pgvector). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must respect each platform's ad policy (Yandex, VK, Telegram, Avito). All ad copy must comply with Russian advertising law (Federal Law No. 38-FZ), including required disclaimers for certain categories. Per-channel spend caps to avoid budget blowout. No automated ad-buying in v1 — the platform generates assets and budgets; the user reviews and uploads.
