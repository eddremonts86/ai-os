---
id: "732"
slug: a-photographer-moving-to-the-us-needs-clients-platforms
title: "A photographer moving to the US needs clients. Platforms require reviews, agencies are expensive. Wants a website + ads that bring bookings. Willing to pay $100–300/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/6t7ke01t41-a-photographer-moving-to-the-us-needs-cl"
category: other
date: "2026-07-17"
tags: [Immigration, Freelance, Marketing, Career, Other]
country: Serbia
wtp:
  raw: $100-300/month
  currency: USD
  min: 100
  max: 300
  period: month
  mrrMid: 200
tech: [Next.js, TypeScript, Tailwind CSS, Stripe subscriptions, Google Ads API, Meta Ads API, Calendly embed, Coolify]
---
# A photographer moving to the US needs clients. Platforms require reviews, agencies are expensive. Wants a website + ads that bring bookings. Willing to pay $100–300/month.

## Problem

A photographer relocating from Serbia to the United States — Victoria, with a portfolio, experience, and a strong desire to move — is blocked by one thing more than visas and flights: she has no income source in her destination country and no idea where her first US clients will come from. She has looked at Thumbtack, TaskRabbit, and Angi (the standard immigrant-friendly service platforms), but they are generic across all service types: she competes with dozens of other photographers on the same profile page, and the platforms gate visibility behind review counts she cannot bootstrap from zero. She has also looked at the marketing agencies that build websites and run ads for photographers, but their packages start at $1,000+/month and run as high as $4,000–$8,000/month — out of reach before she has a single US booking. The platforms and agencies she has tried fail on opposite ends: one requires reputation she doesn't have, the other requires revenue she doesn't have yet. She wants a turnkey website plus configured advertising that brings in bookings immediately, on a budget of $100–300/month, so she can top up a balance and receive enquiries without learning Thumbtack's profile system or hiring an agency.

## Objective

Ship a turnkey photographer-booking service that bundles a niche-specific website (portfolio + booking widget + service packages + city landing pages) with managed Google + Meta ads targeting the photographer's city and genre, run on a $100–300/month subscription plus pass-through ad spend, so a relocating photographer gets bookings from day one without building reputation on a generic platform or paying an agency $1,000+/month. The photographer's daily workflow is "log in, see new bookings, top up the ad budget" — nothing else.

## Target Users

- Primary: relocating international photographers (immigrants, expats, returning citizens) with a portfolio but no US reputation, who need bookings in the first 30–60 days and cannot afford a $1,000+/month agency.
- Secondary: early-career US photographers in saturated metros (LA, NYC, Miami) who face the same zero-reviews problem and the same agency-price objection.
- Tertiary: niche-genre specialists (family, newborn, real-estate, headshot, elopement) for whom the generic platforms bury them under unrelated categories.

## MVP Scope

- Niche website template: portfolio grid, 3 service packages (shoot + edits + delivery), pricing in USD, embedded booking widget (Calendly or Cal.com), city landing pages (e.g., `/los-angeles/family-photographer`) for SEO.
- Managed ads: Google Ads (search + local services) and Meta Ads (Instagram + Facebook) targeting the photographer's city, genre, and ideal-client demographics; ad creative generated from the photographer's portfolio (AI-assisted captions and headline variants).
- Lead capture: every booking widget submission becomes a row in the photographer's dashboard with name, email, shoot date, package chosen; SMS/email notification on new lead.
- Ad-spend wallet: the photographer tops up a prepaid balance (Stripe); ad spend is debited from the wallet, platform subscription is debited separately.
- One workspace per photographer, single-user, no team features in v1.
- English-language dashboard; the landing page can be translated per market but v1 ships English only.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Author's stated budget cap is $300/month total, which must cover platform subscription + ad spend combined. Subscription must therefore sit at the bottom of the band ($100/month base) so the photographer can allocate the remaining $200/month to ad spend.
- No agency-style onboarding calls, no strategy sessions, no phone support in v1 — onboarding is a self-serve form (city, genre, portfolio upload, ideal client) and the platform configures the rest.
- Must work for a photographer with zero US reviews; the platform must not depend on the photographer having Google Business Profile reviews or Thumbtack reputation to generate leads.
- Ads must comply with Google Ads and Meta Ads policies for "before-and-after" / lifestyle photography — no before/after weight-loss or medical imagery.
- Hosting cost per workspace must stay under $5/month so a $100/month subscription leaves margin at the price point.
- The author has not provided a country of intended US destination; the platform must serve any US city, not just NYC/LA.
