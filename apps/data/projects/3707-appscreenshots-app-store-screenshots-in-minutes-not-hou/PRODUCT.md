---
id: "3707"
slug: appscreenshots-app-store-screenshots-in-minutes-not-hou
title: "AppScreenshots – App Store screenshots in minutes, not hours"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49486667"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
country: Australia
tech: [Astro, TypeScript, Postgres, image-rendering pipeline]
---
# AppScreenshots – App Store screenshots in minutes, not hours

## Value Proposition

A template-driven App Store and Google Play screenshot pipeline — one design input, every required device size, every locale, ready to upload.

**One-liner:** Design once, ship every size, every locale.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Indie iOS and Android developers | They have to produce a full screenshot set in seven sizes for every locale they ship, and resenting doing it by hand in Figma is universal. |
| App studio teams and agencies | They produce app-store creative for clients at scale, where visual consistency across an app portfolio matters more than per-app polish. |
| Localization and ASO specialists | They need a screenshot set in 10+ languages with the visual frame held consistent; one design input, every locale. |

## Jobs To Be Done

1. **Functional job** — Produce a complete App Store + Play Store screenshot set in every required size and locale from a single design input, ready to upload to the stores.
2. **Emotional job** — Stop the "I have to redo this in seven sizes" dread that shows up a week before every submission.
3. **Social job** — Ship a screenshot set that looks like the studio's house style across every app, instead of one screenshot per developer.

## Success Metrics

- **Activation:** % of free-tier users who generate the 5 free screenshots, then upgrade or come back for the next 5.
- **Retention:** Repeat renders per user per month — a developer shipping an update does a full re-render.
- **Revenue:** Paid-tier conversion and ARPU; the post does not state pricing but the landing-page footer lists templates as the obvious paid tier.

## Pricing & Monetization

The landing page lists "5 app store screenshots free · No card required" as the entry tier and "150+ fully customizable templates" as the catalogue behind the free tier. No price is named on the landing page copy we have; the post does not state paid-tier numbers. The shape is freemium (free tier + paid templates / paid locale pack / paid higher resolution), but the source does not commit to numbers.

## Competitive Landscape

The category includes AppMockUp, Previewed.app, screenshots.pro, Rotato, Mockup World, and the manual Figma / Photoshop pipeline. The product's stated differentiator is the combination of (a) every required device size, (b) localisation, (c) a 150+ template library, and (d) a 5-screenshot free tier. The product does not name competitors on the landing page.

## Risks & Open Questions

- **Apple and Google spec drift.** App Store and Play Store canvas sizes change. The MVP needs a published matrix that matches the current spec and a regression test against Apple's and Google's most recent submission guidelines.
- **RTL and locale-specific fonts.** Arabic and Hebrew require right-to-left layout; CJK locales need CJK-aware fonts. A template that hard-codes English silently breaks localisation. The MVP needs an RTL-aware template engine and a CJK font fallback.
- **Free-tier abuse.** 5 free screenshots is a marketing number; an attacker who scripts a free signup per screenshot will turn the funnel into a cost centre. The MVP needs basic per-email and per-IP rate limiting on the free tier.
- **Pricing unstated.** The post and the landing copy stop at "5 free". A paid tier, a template pack, a locale pack, an enterprise tier — none of the shapes are committed to in the source. The post leaves the pricing shape open.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49486667) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
