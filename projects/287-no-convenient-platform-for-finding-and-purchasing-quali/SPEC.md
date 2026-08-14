---
id: "287"
slug: no-convenient-platform-for-finding-and-purchasing-quali
title: No convenient platform for finding and purchasing quality products from local fa
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/food/8ypvtt1my1-no-convenient-platform-for-finding-and-purchas"
category: food
date: "2025-10-29"
tags: [Food, Business, Marketplace]
country: Russia
tech: [Next.js 14, TypeScript, Postgres + PostGIS, YooKassa payments, SDEK / Boxberry shipping, Sentry]
---
# No convenient platform for finding and purchasing quality products from local fa

## Problem

Russian consumers who want to buy from small local farmers — honey, dairy, sourdough, preserves, vegetables, free-range eggs — run into a fragmented market. Farmers sell at weekend markets, via Instagram, in Telegram channels, or only to neighbours. There is no single place to discover nearby farms, see what is in season, place an order with shipping or pickup, and trust that the farmer is who they say they are. The title points to the gap as a platform gap, not a supply gap — farmers exist, buyers want them, the connection is missing.

## Objective

Build a marketplace that makes a Russian consumer's weekly basket of farm-direct products as easy to buy as a supermarket order, while keeping the farmer-side workflow simple enough that a farmer without a website or marketing team can list and ship in under 10 minutes a week.

## Target Users

Urban Russian consumers (Moscow, St Petersburg, Kazan, Yekaterinburg, Novosibirsk) buying for the household. Foodie adults who already shop at farmer markets and want the same producers accessible between market weekends. Secondary: small and mid-sized Russian farms (≤ 100 ha) that produce more than they can sell through existing channels and want a direct channel without building their own e-commerce.

## MVP Scope

Farmer onboarding with passport + farm photo + product list. Producer profiles with farm photos, region, certifications (organic, biodynamic, raw dairy), and shipping policy. Product catalogue with seasonal availability calendar. Geo search by city or delivery radius. Cart and checkout via YooKassa (cards + SBP). Shipping via SDEK or Boxberry with farmer-paid labels, or local pickup. Russian-language-only UI in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/food/8ypvtt1my1-no-convenient-platform-for-finding-an` follows the constraints in `287-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, Postgres + PostGIS). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must not handle raw meat or alcohol in v1 — both require separate licensing and cold-chain compliance outside the MVP scope. Farmer payments held for 7 days after delivery confirmation (chargeback window). All listings in Russian only. Per Russian e-commerce rules, every seller must display full legal entity info (OGRN/IP) on the storefront; the platform enforces this in the farmer-onboarding step.
