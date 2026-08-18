---
id: "221"
slug: nigerias-transport-trap-uberbolt-too-expensive-okada-to
title: "Nigeria's transport trap: Uber/Bolt too expensive, okada too deadly, Danfo buses a nightmare. Millions stuck without a safe, affordable option."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: mobility
date: "2026-02-13"
tags: [Mobility, Nigeria, Marketplace]
country: Nigeria
tech: [Flutter, Node.js, PostgreSQL, Google Maps, Paystack, Firebase]
---
# Nigeria's transport trap: Uber/Bolt too expensive, okada too deadly, Danfo buses a nightmare. Millions stuck without a safe, affordable option.

## Problem

Commuters in Lagos, Abuja, and other Nigerian cities face a transport trap: Uber and Bolt are too expensive for daily use, okada (motorbike taxis) are dangerous and unregulated, and Danfo buses are unpredictable and unsafe. The middle ground — a reliable, registered, affordable ride on a vetted vehicle — does not exist at scale. Existing ride-hailing platforms do not address the regulatory or cost problem for the masses. What is missing is a service that aggregates vetted, mid-cost drivers (minibus, car, motorcycle-with-helmet) onto a single app with clear pricing, real-time tracking, helmet and seatbelt enforcement, and a cash or transfer payment flow that works in the local market. None of the mainstream options (Uber, Bolt, Gokada) target this exact middle.

## Objective

A ride-hailing service for Nigerian cities that aggregates vetted mid-cost drivers (minibus, sedan, regulated motorcycle) with cash-or-transfer payment, helmet enforcement, and clear pricing the rider can rely on.

## Target Users

Nigerian commuters in Lagos, Abuja, Port Harcourt, and Ibadan who currently use okada or Danfo for daily trips and want a safer, more predictable alternative. Also Nigerian businesses that need to move staff mid-day.

## MVP Scope

Flutter app. Driver onboarding with vehicle registration and ID verification. Rider app with three vehicle classes (minibus, sedan, regulated motorcycle). Cash or transfer payment via Paystack. Real-time tracking via Google Maps. Helmet and seatbelt enforcement via a driver-side check-in. No intercity trips in v1.

## Design Direction

Design direction for the MVP at `` follows the constraints in `221-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must comply with local state transport regulations. Driver vetting must include a national-ID-based check. Helmet enforcement must be a hard precondition for regulated motorcycle trips. Cash payment must be supported for first-time riders. No surge pricing above 2x without explicit rider confirmation.
