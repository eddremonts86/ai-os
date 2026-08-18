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

## Tech Stack

Next.js 14 (App Router) with TypeScript for the web frontend — chosen because the buyer surface is mostly a browse-and-order experience that benefits from SSR and SEO around vendor pages. PostgreSQL with PostGIS for the geospatial vendor lookup. Stripe Connect as a fallback international rail; YooMoney and Tinkoff as primary Russian rails. Yandex Maps API for the buyer-facing map of nearby vendors. Telegram Bot API for vendor order notifications (Russian SMB vendors overwhelmingly run Telegram).

## Architecture

Three services: a Next.js web app for buyers, an admin/vendor web console (same Next.js codebase, separate route group), and a small Node.js API for order events and Telegram notifications. PostgreSQL holds vendors, listings, orders, ratings. PostGIS index on vendor location. Cron job computes freshness score per vendor from claimed dates and buyer ratings.

## Milestones

M1: Vendor onboarding and listing creation. M2: Buyer browse with map and freshness filter. M3: Order placement with Russian payment rails. M4: Rating and freshness-score engine. M5: Pilot with 30 farms and 10 bakeries in Moscow Oblast.

## Risks

Russian payment-rail KYC is slow and can block vendor payouts. Freshness claims are unverifiable in software; a small share of dishonest vendors could destroy trust if rating system is gamed. Aggregators may launch a competing feature.
