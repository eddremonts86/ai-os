---
id: "363"
slug: difficulty-finding-effective-marketers-for-a-constructi
title: Difficulty finding effective marketers for a construction business
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/hc75uckma1-difficulty-finding-effective-marketers-f"
category: freelance
date: "2025-10-29"
tags: [Freelance, Marketing]
country: Russia
tech: [Next.js, Postgres, Yandex Direct API + VK Ads API, Yandex.Metrica + call-tracking (Calltouch / Callibri) integration, Stripe / YuKassa]
---
# Difficulty finding effective marketers for a construction business

## Problem

A Russian construction-business owner (small contractor, renovation, modular homes) knows that hired marketers underperform because they do not understand construction buying cycles, permit realities, regional pricing, or how a site visit actually happens. Generic freelance marketers produce glossy posts that do not turn into contracted jobs. The poster wants a way to find marketers who have already produced construction-business results, with a payment model tied to contracts signed, not impressions.

## Objective

Ship a Russian construction-business marketing marketplace that connects construction-business owners with vetted marketers who have a track record of construction campaigns, runs Yandex Direct + VK Ads campaigns with a call-tracking layer, and pays the marketer a success fee on the contract value, not on the click.

## Target Users

- Russian small construction-business owners (renovation, modular, finish work) with RUB 50-300k/month marketing budget.
- Russian marketers with a track record in construction campaigns who want lead-gen-for-percentage deals instead of flat retainers.
- Russian construction holding-company marketing leads evaluating a vetted external marketer per region.

## MVP Scope

- Marketer profile: verticals served, geo covered, prior contract values, references.
- Marketer vetting: reference check + 30-day trial campaign with a guaranteed cost-per-lead cap.
- Yandex Direct + VK Ads campaign setup with a builder-tunable budget and a per-region bid modifier.
- Call-tracking: Calltouch / Callibri integration; calls recorded for QA; weekly reports.
- Contract-attribution: signed-contract tracking via a builder-supplied CRM webhook or manual upload.
- Success fee on the signed-contract value (5-10%, set per listing).
- No long-form SEO retainer in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/freelance/hc75uckma1-difficulty-finding-effective-mar` follows the constraints in `363-.../SPEC.md` and the chosen stack (Next.js, Postgres, Yandex Direct API + VK Ads API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Per-region bid modifier capped to prevent over-bidding on saturated regions.
- Marketers who miss the cost-per-lead cap for two consecutive weeks are paused pending a strategy review.
- Call recordings stored for 90 days for QA; deletion on builder request.
