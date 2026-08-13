---
id: "003"
slug: a-private-breeder-needs-a-platform-to-find-trusted-sell
title: "A private breeder needs a platform to find trusted sellers who work for a commission. One helper at 10% commission already boosted sales. Need more people like that."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/xcnt6j8g51-a-private-breeder-needs-a-platform-to-fi"
  captured: "2026-07-17"
category: marketing
date: "2026-07-17"
tags: [Marketing, Business, Retail, Other]
country: Georgia
tech: [Next.js, Postgres, Stripe Connect, Twilio, Mapbox]
---

# A private breeder needs a platform to find trusted sellers who work for a commission. One helper at 10% commission already boosted sales. Need more people like that.

## Problem

A Georgian private breeder proved the model with a single trusted seller at 10% commission and saw real sales lift, but cannot find more people of that quality through informal networks. Hiring full-time sales staff is unaffordable for a small kennel; platforms like general-purpose freelance marketplaces are flooded with unqualified leads. The breeder needs a vetted pool of commission-only sellers who already understand live animals and small-business sales.

## Objective

Ship a vetting-first marketplace where a breeder can post a commission-only seller role, interview a shortlist, and pay out only on closed sales — without paying for the listing, the interviewing, or the platform fee beyond the percentage on closed deals.

## Target Users

- Primary: small private breeders in the Caucasus and Eastern Europe with 1–20 active animals and no in-house sales staff.
- Secondary: pet shop owners and small-animal cooperatives that resell from a breeder's stock and would benefit from the same vetting process.

## MVP Scope

- Breeder profile + listing with commission rate, region, animal type, and required experience.
- Seller profile with verifiable references (former breeders, vets, pet shops) and a sample pitch video.
- Two-sided messaging with templates and a 24h response nudge.
- Payout via Stripe Connect on closed sales only; platform fee is a percentage of the commission, never a flat fee.
- No payment holding; the breeder pays the seller directly through the platform.
- No shipping logistics, no insurance broker, no breed registry in v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Vetting must be human-reviewed for the first 100 sellers; no auto-approval.
- The platform fee must never exceed the seller's commission so the math stays attractive.
- Seller data is per-region; cross-border listings require explicit dual consent.
- Telegram is the primary notification channel for the Georgian breeder market — must integrate from day one.