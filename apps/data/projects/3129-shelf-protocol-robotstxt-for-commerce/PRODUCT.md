---
id: "3129"
slug: shelf-protocol-robotstxt-for-commerce
title: "Shelf Protocol: robots.txt for commerce"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449679"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Node.js, TypeScript, PostgreSQL, DNS-TXT verification, Shopify storefront API, OpenAI API]
---
# Shelf Protocol: robots.txt for commerce

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Let an AI agent ask one registry instead of fan-out visiting every merchant — and let a merchant be visible, verified, and bounded by a single DNS record.

## Target Users

Three, in one product: merchants (especially Shopify storefronts) who want agent traffic under their own rules; consumers running AI buying agents; AI-agent developers who want one registry call instead of per-merchant integration.

## Jobs To Be Done

Functional for agents: get a verdict on whether a merchant allows AI buying, whether it is verified, and the per-transaction spending limit, in one call. Emotional for merchants: not be invisible to future agent traffic. Social: be the kind of merchant that is safe for an agent to transact with.

## Success Metrics

The poster reports the launch state of the seeded registry only: 8 merchants, 834 products, none verified, 0 spending limit. These are the cold-start numbers; no retention or transaction metrics are stated.

## Pricing & Monetization

The poster describes merchant onboarding as free — one DNS record and ~5 minutes — for v1. No pricing beyond free onboarding is stated.

## Competitive Landscape

_TODO:_ the source does not name competing registries. The framing is "robots.txt for commerce" but no prior-art system is cited for direct comparison.

## Risks & Open Questions

The seeded registry entries are unverified and have a 0 spending limit until merchants claim them — onboarding velocity is the gating risk. The poster is explicitly uncertain whether DNS-TXT is the right verification mechanism long-term and is asking for feedback. The `shelf.json` schema is open for public review. The poster assumes a future in which agents will skip unverified stores; if that world does not arrive, the value proposition loses its urgency.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49449679) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
