---
id: "737"
slug: moving-with-furniture-is-a-weeks-long-headache-no-servi
title: "Moving with furniture is a weeks-long headache. No service picks up everything and pays fairly. Willing to give up to 50% commission just to get rid of this pain."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/9na53d57r1-moving-with-furniture-is-a-weeks-long-he"
  captured: "2026-05-27"
category: logistics
date: "2026-05-27"
tags: [Logistics, Transportation, Retail, Other]
country: USA
wtp:
  raw: "40-50% commission to a service"
  currency: USD
  period: one-shot
  min: 40
  max: 50
  mrrMid: 0
tech: [TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, React for ops console, third-party pickup logistics APIs]
---
# Moving with furniture is a weeks-long headache. No service picks up everything and pays fairly. Willing to give up to 50% commission just to get rid of this pain.

## Problem

A relocating household cannot sell its used furniture quickly or fairly through the existing channels. Listing on AptDeco, OfferUp, or Craigslist turns into weeks of lowball messages, no-shows, and a single couch sitting unsold for a month; Remoov picks up everything but quotes "50% of the sale" and then deducts expenses so the user received $45 on $800 of furniture; junk haulers will remove it for ~$300 but pay nothing; charity takes items selectively. The ProblemHunt author (Marty, USA) has moved five times in seven years because of work, faces the same problem every 1–2 years, and is willing to give a service 40–50% of the proceeds if it will come, take everything at once, sell it, and send him a fair payout plus a report — or alternatively pay a smaller amount on-site for an immediate buyout. The pain is "weeks of stress, dozens of messages, rejections, wasted time" every move.

## Objective

Ship a "whole-house furniture buyout" service that shows up once, takes everything, sells it through the operator's own resale channel, and pays the household a transparent share (40–50%) of the realised sale with a written report — or alternatively offers a discounted on-site buyout for users who need cash the same day — so a relocating family gets one scheduled pickup and one fair number, instead of weeks of self-managed listings.

## Target Users

- Primary: US households in the middle of a state-to-state move who have a fully furnished rental to vacate and one to furnish, with no time to manage per-item sales.
- Secondary: downsizers (empty-nesters, divorcees, recently relocated retirees) who need to clear a furnished home in one transaction instead of running a yard sale.
- Tertiary: estate executors and property managers who need a single bulk pickup plus a transparent resale accounting trail.

## MVP Scope

- One web form per move: address, furniture count, photos, target move-out date, contact.
- A "full buyout" tier: operator takes everything, sells through its own resale channel, household receives 40–50% of the realised sale with a per-item report.
- An "on-site buyout" tier: operator sends a crew for a single visit, pays a discounted instant amount on-site, takes everything that day.
- Per-item intake manifest generated from the photos (item, condition tier, estimate), shared with the household for approval before the truck rolls.
- Resale accounting: a per-job report listing what sold, for how much, and the household's share; delivered within 30 days of pickup.
- Single US region launch (one metro area) with two pickup crews; one office + one warehouse.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Household share must be 40–50% of the *realised* sale (the ProblemHunt author's stated willingness to pay), not of the operator's list price; the report must show the realised number.
- On-site buyout must be paid the same day as pickup; the discounted instant amount must be explained in plain language ("we pay less because we're absorbing the resale risk").
- Operator must take *everything* offered at intake (no cherry-picking); refusing items after the truck arrives voids the buyout and triggers a refund of any deposit.
- v1 is single-region (US) and single-channel (operator's own resale); a marketplace model where third-party resellers bid is out of scope.
