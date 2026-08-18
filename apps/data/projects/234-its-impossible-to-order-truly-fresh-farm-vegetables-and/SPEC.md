---
id: "234"
slug: its-impossible-to-order-truly-fresh-farm-vegetables-and
title: "It's impossible to order truly fresh farm vegetables and bread through delivery aggregators \u2014 product quality is low, and you have to go to the market yourself"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/food/a6dgf1icc1-its-impossible-to-order-truly-fresh-farm"
category: food
date: "2026-01-22"
tags: [Logistics, Retail, Other]
country: Russia
tech: [Next.js 14, TypeScript, PostgreSQL, PostGIS, Stripe Connect, Yandex Maps API, Telegram Bot API]
---
# It's impossible to order truly fresh farm vegetables and bread through delivery aggregators — product quality is low, and you have to go to the market yourself

## Problem

In Russia, delivery aggregators (Yandex Eda, Delivery Club, Samokat) do not give the buyer a reliable signal that the produce they order was actually harvested the same day or baked the morning of delivery. The poster's only current path to genuinely fresh vegetables and bread is to physically go to the market, which defeats the purpose of delivery. The problem is provenance visibility, not last-mile logistics.

## Objective

Ship a marketplace that connects buyers directly to nearby small farms and bakeries within a delivery radius, with a visible freshness claim (harvest date for produce, bake date for bread) attached to every listing and a rating that is updated from actual buyer feedback.

## Target Users

Russian urban households in Moscow, Saint Petersburg, and other major cities who already use Yandex Eda or Samokat but specifically want farm-direct quality for produce and bread. Smallholder farms and artisan bakeries that want a direct-to-consumer channel without setting up their own e-commerce.

## MVP Scope

Web app (responsive) for buyers. Vendor onboarding form for farms and bakeries. Listing creation with date-of-harvest / date-of-bake field. Buyer order flow with same-day or next-day delivery slots. Cash-on-delivery and Stripe (for cards). Simple rating + freshness-claim display on each listing.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/food/a6dgf1icc1-its-impossible-to-order-truly-fresh-f` follows the constraints in `234-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must respect Russian consumer-protection law on perishable-goods sales and on distance-selling consumer rights. Vendor payouts must support Russian bank rails (SBP / Tinkoff / YooMoney) before Stripe. Russian data-residency for any server storage.
