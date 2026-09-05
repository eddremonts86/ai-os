---
id: "4158"
slug: retainfast-cancellation-flow-widget-that-never-touches-
title: RetainFast – cancellation flow widget that never touches your Stripe
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511987"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# RetainFast – cancellation flow widget that never touches your Stripe

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A drop-in cancellation-flow widget that gives SaaS operators reasons, save-rate analytics, and reason-attached offers without ever needing write access to their Stripe account — and at a price point well below the $250+/mo retention platforms.

## Target Users

Indie SaaS founders and small SaaS teams on Stripe who want a real cancellation flow without handing Stripe OAuth to a third party.

## Jobs To Be Done

When a customer clicks "Cancel subscription" on a SaaS billing page, intercept the click, ask the one question the operator never gets answered, surface the right offer for that reason, and hand the outcome (offer accepted or reason given) back to the operator's own backend so the operator stays in control of every state transition.

## Success Metrics

Save-rate uplift versus the merchant's prior `confirm()` or Stripe-only flow; reason-attribution coverage (share of cancellations that return a usable reason); integration time (vendor claims five-minute install). No baseline is published in the post.

## Pricing & Monetization

Per the source: $25 intro then $12/month. The widget never holds the merchant's Stripe key; the merchant's own backend is the only side that can apply offers or cancel subscriptions.

## Competitive Landscape

The vendor names two adjacent categories in its own comparison table: the Stripe portal (free, one canned question, no save-rate analytics) and the Churnkey-style paid tools ($250+/mo, require Stripe write access, half-day setup). No other direct comparisons appear in the source.

## Risks & Open Questions

A live widget on production billing pages means a frontend outage becomes a customer-visible outage; the vendor claims quiet failure if the analytics endpoint is down, but does not name what happens if the widget script itself fails to load. A second risk is that merchants may expect richer customisation than a 5 KB vanilla-JS bundle can offer; any expansion will trade payload size for features and the source does not signal which way the vendor will go.