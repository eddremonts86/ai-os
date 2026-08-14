---
id: "243"
slug: searching-for-direct-hotel-contacts-to-book-without-ove
title: "Searching for direct hotel contacts to book without overpaying to aggregators, which markup prices by 15-30%"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/travel/kymbn6kp61-searching-for-direct-hotel-contacts-to-b"
category: travel
date: "2026-01-19"
tags: [Business, Other]
country: UK
tech: [Next.js 14, TypeScript, PostgreSQL, Playwright (Python), Stripe, SendGrid, Redis]
---
# Searching for direct hotel contacts to book without overpaying to aggregators, which markup prices by 15-30%

## Problem

A UK traveller finds a hotel on Booking.com or Expedia and then wants to book direct with the hotel to avoid the 15-30% markup the aggregator charges. Finding the hotel's direct phone number or booking email is currently manual (Google, the hotel's own website, sometimes a call) and inconsistent.

## Objective

Ship a search-and-redirect service that, given an aggregator listing URL, returns the hotel's direct booking channel (phone, email, or direct-booking URL) along with an estimate of the markup avoided.

## Target Users

UK travellers who already book on Booking.com / Expedia and want to check the direct price before paying. Travel bloggers and small travel agents who want to recommend direct-bookable properties.

## MVP Scope

Browser extension that detects an aggregator listing page and overlays the direct-booking contact. Backend that maintains a database of UK-relevant hotels with verified direct contacts. Estimate of typical aggregator markup per property.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/travel/kymbn6kp61-searching-for-direct-hotel-contacts` follows the constraints in `243-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in UK.

For UK, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must not scrape aggregator sites in violation of their terms. Coverage limited to hotels with verified direct contacts; honest "not yet verified" state beats guessing.
