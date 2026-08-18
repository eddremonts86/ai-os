---
id: "232"
slug: republished-there-is-no-app-for-nigerian-passengers-tha
title: "Republished: There is no app for Nigerian passengers that shows the real-time flight status and helps with transit, hotel, and the embassy line."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: travel
date: "2026-01-26"
tags: [Travel, Nigeria, Information]
country: Nigeria
tech: [Flutter, Python, FastAPI, PostgreSQL, AviationStack, Paystack]
---
# Republished: There is no app for Nigerian passengers that shows the real-time flight status and helps with transit, hotel, and the embassy line.

## Problem

A Nigerian passenger travelling internationally has no single app that combines real-time flight status, transit from the airport, hotel booking, and the embassy-visa-line guidance. They piece it together from airline apps, Google Maps, Booking.com, and a WhatsApp group. The information is real-time on the airline side but the moment the plane lands, the passenger is offline relative to the rest of the trip. What is missing is a single app that, for someone flying to or from Nigeria, surfaces the flight status, the transit options from the destination airport, the hotel booking, and the visa/embassy rules of the destination — all in one place. None of the mainstream options (Google Flights, TripIt, Hopper) target the Nigerian passenger's actual information mix.

## Objective

A single app for Nigerian international passengers that shows real-time flight status, transit from the destination airport, a hotel option, and the visa/embassy rules of the destination — in one place.

## Target Users

Nigerian international passengers flying to or from Lagos, Abuja, and Port Harcourt. Secondary: Nigerian diaspora flying home and the diaspora-adjacent travellers (work, family, study).

## MVP Scope

Flutter app. Real-time flight status (AviationStack). Transit suggestion from destination airport (Google Maps). Hotel option (Booking.com affiliate). Visa/embassy rules per destination (manual, curated). No flight booking in v1.

## Design Direction

Design direction for the MVP at `` follows the constraints in `232-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must work offline for the transit and visa sections. Real-time flight status must be honest about the source's latency. Visa/embassy rules must be reviewed by a human (no LLM hallucination on visa rules). Data must be cacheable for the journey.
