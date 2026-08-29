---
id: "882"
slug: nigerians-cant-access-local-movies-due-to-expensive-sub
title: "Nigerians can't access local movies due to expensive subscriptions and piracy"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/pypg9yzgy1-nigerians-cant-access-local-movies-due-t"
category: media
date: "2025-10-25"
tags: [Media, Legal]
country: Nigeria
---
# Nigerians can't access local movies due to expensive subscriptions and piracy

## Problem

In Nigeria and other African countries, there are no affordable streaming platforms focused on local content. Global services like Netflix are too expensive for most of the population and offer only a limited selection of African films. As a result, piracy remains the main way to access content, which deprives local creators (Nollywood and beyond) of income and leaves legitimate viewers with no affordable, legal alternative. The author (Nelson Jebose, Nigeria) has researched the option of building their own application but lacks the technical knowledge and resources, and existing local platforms have not yet covered the whole market. The author is open to several monetisation models — subscription, pay-per-view, or advertising — as long as the price stays affordable for the end user. The author is also looking for a co-founder to build the solution.

## Objective

Ship an affordable, mobile-first streaming platform for Nigerian and pan-African movies (Nollywood plus neighbouring film industries) that is priced for the local market, monetises through a mix of subscription, pay-per-view, and advertising, and gives local creators a legitimate revenue stream they do not have today. The MVP must (1) be operable on a low-end Android phone over a typical Nigerian mobile connection, (2) be priced within reach of the median viewer (not Netflix pricing), (3) give creators a transparent revenue share and a path to upload their own catalogue, and (4) carry a legal, licensed catalogue — not pirated re-uploads.

## Target Users

- Primary: Nigerian viewers aged 16–45 who want Nollywood and pan-African films on a phone and cannot afford Netflix or the global streamers' Nigerian pricing.
- Secondary: members of the African diaspora in the UK, US, Canada, and the EU who want legal access to Nollywood and pan-African content and are willing to pay global-market prices for it.
- Tertiary: local Nigerian and pan-African creators (producers, directors, distributors) who need a legitimate distribution channel and a transparent revenue share.

## MVP Scope

- A mobile-first Android app (PWA acceptable in v1) with offline downloads for previously-watched titles.
- A licensed catalogue of at least 200 Nollywood / pan-African titles at launch, sourced from independent producers and rights-holders.
- Three monetisation paths running side by side: a low-priced subscription (≤ ₦1,500/month), pay-per-view at a per-title price (≤ ₦500), and an ad-supported free tier (≤ 2 ads per 30-minute watch session).
- Creator portal: a producer / distributor uploads a title with rights documentation, sets the monetisation model per title (sub-only, PPV-only, ad-supported), and sees a transparent revenue share (proposed 70/30 creator / platform).
- Offline downloads for at least 20 titles per month on the paid tier; 5 titles per month on the free tier.
- Local payment rails: Paystack, Flutterwave, and USSD for the subscription tier; mobile-money and card for diaspora.
- Basic content discovery: genre filters, language filter (English / Yoruba / Igbo / Hausa / Pidgin), and a "trending in Lagos / Abuja / PH" rail.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Affordability is the headline constraint: subscription must be priced in the ₦1,000–₦1,500/month band (USD ≈ $0.65–$1.00) so it stays within reach of the median Nigerian viewer; Netflix pricing is explicitly out of range.
- Mobile-first, low-end Android: the app must run on a 2 GB RAM Android 10 device over a 3G connection; video bitrate must be tuned per connection quality.
- Legal, licensed catalogue only — no pirated re-uploads. Each title must have rights documentation in the creator portal before it can be published.
- Creators must see a transparent revenue share and a payout path; the 70/30 split is the proposed default, not negotiable per title.
- Operable in low-bandwidth conditions: video must default to a 480p stream with a one-tap upgrade to 720p when bandwidth allows; downloads must be resumable.
- The author is looking for a co-founder; the build plan must be fundable as a small founding team, not a venture-funded staff.
