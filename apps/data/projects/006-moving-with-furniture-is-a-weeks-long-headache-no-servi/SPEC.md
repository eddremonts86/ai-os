---
id: "006"
slug: moving-with-furniture-is-a-weeks-long-headache-no-servi
title: "Moving with furniture is a weeks-long headache. No service picks up everything and pays fairly. Willing to give up to 50% commission just to get rid of this pain."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/9na53d57r1-moving-with-furniture-is-a-weeks-long-he"
  captured: "2026-07-17"
category: logistics
date: "2026-07-17"
tags: [Logistics, Transportation, Retail, Other]
country: USA
wtp:
  raw: "up to 50% commission"
  currency: PCT
  max: 50
  period: one-shot
tech: [Next.js, Postgres, Stripe Connect, Twilio, Cloudflare R2]
---
# Moving with furniture is a weeks-long headache. No service picks up everything and pays fairly. Willing to give up to 50% commission just to get rid of this pain.

## Problem

Relocating US households face a two-week puzzle: list every item on Facebook Marketplace, wait for low-ball offers, haggle, schedule pickups, no-shows, donations for whatever is left. The willingness to give up half the resale value in exchange for a single, scheduled pickup is the explicit signal that the pain is severe and the current market is fragmented.

## Objective

Ship a one-call liquidation service: a household fills a single intake form (address + room-by-room checklist), gets a flat quote, and a crew arrives on a scheduled day to photograph, list, sell, and remove everything in 72 hours, with the household receiving up to 50% of the net sale proceeds.

## Target Users

- Primary: US households relocating, downsizing, or settling an estate who would rather lose half the value than spend two weekends on it.
- Secondary: small landlords clearing a unit between tenants; remote heirs clearing a parent's home.

## MVP Scope

- Single ZIP intake form that asks for room count and an estimate of items.
- Flat quote: 50% of estimated resale value minus a fixed pickup fee; the household sees the split upfront.
- 72-hour liquidation: pickup crew photographs items, lists them on a single integrated marketplace (no Facebook Marketplace integration in v1), negotiates, and removes anything that does not sell in 72 hours (donated, not stored).
- Direct deposit of proceeds within 5 business days of pickup.
- Receipt for tax purposes (itemized list of sold vs. donated).
- No storage, no consignment, no international shipping in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/logistics/9na53d57r1-moving-with-furniture-is-a-weeks` follows the constraints in `006-.../SPEC.md` and the chosen stack (Next.js, Postgres, Stripe Connect). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Pickup crews must be background-checked and W-2 employees, not gig workers, to limit theft risk on high-value homes.
- The 50% split is a ceiling, not a default; the actual split is dynamic based on item mix (e.g., antiques vs. IKEA) and presented as a single number, not a menu.
- Proceeds are reported on a 1099-K when total household payouts in a calendar year exceed the IRS threshold; the platform must track per-user lifetime payouts.
- No item may remain in the home after 72 hours; if it has not sold, it is donated to a registered 501(c)(3) and a receipt is issued.
