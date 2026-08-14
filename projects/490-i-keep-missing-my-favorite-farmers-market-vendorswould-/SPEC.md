---
id: "490"
slug: i-keep-missing-my-favorite-farmers-market-vendorswould-
title: I keep missing my favorite farmers-market vendors—would this solve it?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vo07oc/i_keep_missing_my_favorite_farmersmarket/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Twilio (SMS), Vercel]
---
# I keep missing my favorite farmers-market vendors—would this solve it?

## Problem

Source: https://www.reddit.com/r/SideProject/comments/1vo07oc/i_keep_missing_my_favorite_farmersmarket/

Original post:

> I have a small side-project idea based on a problem I keep having at my local farmers market in Duvall, WA. There are a few vendors I buy from regularly, but I never know whether they’ll be at Duvall that week, at another nearby market, or not vending at all. I usually have to hunt through Instagram or message them. I’m considering a simple, vendor-controlled schedule: - Vendors list where they’ll be selling each week - Customers follow their favorite vendors - Customers can see upcoming markets, times, and cancellations It would not be creepy live tracking, a delivery app, or a full marketplace—just a public “find this vendor this week” tool. My first version would be tiny: one local market area, a handful of vendors, and simple weekly schedule updates. Would you use something like this as a market customer or vendor? What would make it worth using instead of just checking Instagram? submitted by /u/Gud_Boye1 [link] [comments]

---

What this plan addresses: A farmers-market vendor tracker that alerts you when your favourite vendors are at a market this week.

## Objective

A farmers-market vendor tracker that alerts you when your favourite vendors are at a market this week, with vendor self-service schedule updates. When I have favourite farmers-market vendors, I want a tool that alerts me when they are at a market this week, so I stop missing them.

## Target Users

- Regular farmers-market shoppers with favourite vendors
- Vendors who want to notify regulars about their schedule
- Local-food communities tracking vendor schedules

## MVP Scope

- Vendor directory with per-market schedule
- Opt-in alerts (email / SMS) for favourite vendors
- Vendor self-service schedule updates
- No marketplace or payment in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vo07oc/i_keep_missing_my_favorite` follows the constraints in `490-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes the poster's frustration with missing favourite vendors
- Plan keeps the alert framing
- Source did not name a market, region, or vendor count
