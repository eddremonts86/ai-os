---
id: "486"
slug: i-built-a-home-inventory-app-that-fills-in-an-items-det
title: "I built a home inventory app that fills in an item's details from a photo. Looking for critique on how I have it priced."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1ve81fm/i_built_a_home_inventory_app_that_fills_in_an/"
category: indiehackers
date: "2026-08-03"
tech: [React Native, TypeScript, Vision API, PostgreSQL, Google Play, AdMob (optional)]
---
# I built a home inventory app that fills in an item's details from a photo. Looking for critique on how I have it priced.

## Problem

Source: [reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1ve81fm/i_built_a_home_inventory_app_that_fills_in_an/)))))

Original post:

> https://play.google.com/store/apps/details?id=dev.koalalab.storeandforget Solo dev here, Android only, and this is my one self promotion post in this sub, so I would rather spend it on the part I am least sure about than on a pitch. Store & Forget is a home inventory app built on the assumption that you are never going to get organised and should not have to. You photograph a thing as you put it away and the app writes the name, brand, description and specs for you, so there is nothing to type and nothing to tag. Getting it back is Smart Find, where you describe the thing the way you would actually say it, something to cut thick cardboard rather than the box cutter, and it tells you which box or shelf it went into so you go straight there instead of opening all of them. This crowd always asks about scope, so here it is. The inventory is a database on the phone, which means adding, browsing and keyword search need no account and no connection. The photo scan and Smart Find are the two parts that call out to a cloud model. Backup to your own Google Drive is optional. 18 languages, and there is no iOS version coming. The money is where I actually want the critique. There is no subscription. The app is free and shows ads once you have been using it a while, scans run on credits because every one of them is a real API call I pay for, and everything past that is a one time unlock: Remove ads, Fire & Forget at $2.99, and Bring Your Own Key at $4.99, which lets you paste in your own free key so scans stop spending credits at all. What I keep turning over is whether a per scan cost survives in a consumer app. Developers hold that idea fine. I am not convinced a person cleaning out their garage ever will, and the only alternative I can see is eating the API cost myself and hoping the volume stays polite. Bring Your Own Key is the other thing I go back and forth on. Selling people the escape hatch from my own metering feels either very honest or very stupid, and I still cannot tell which. It caps my upside on exactly the users who get the most out of the app. Right now I am also giving both of those unlocks away until 10 August, through a console in the app. Open Settings, tap the app version at the bottom five times, then type unlock byok, then type fire. That second one needs version 1.22.4 or newer. My reasoning was that unlocks sitting with people who actually use the thing are worth more than the few sales I would have made this month. It has since occurred to me that this is also a very comfortable way of not finding out whether anyone would have paid. Happy to answer anything, and I would rather hear where it feels clunky than where it works. submitted by /u/RomeoDelta1234 [link] [comments]

---

What this plan addresses: A home inventory app that fills in an item's details from a photo (category, brand, model, value estimate).

## Objective

A home inventory app that fills in an item's category, brand, and model from a photo, removing the manual data-entry burden of traditional inventory apps. When I am cataloguing my belongings for insurance, I want a tool that fills in the details from a photo, so I do not spend an hour per item typing brand and model.

## Target Users

- Homeowners documenting belongings for insurance
- Renters moving frequently who want a portable inventory
- Estate planners cataloguing items for heirs

## MVP Scope

- Camera capture + on-device photo analysis
- Auto-fill category, brand, model
- Optional value estimate (sourced, not invented)
- Local-first storage + optional cloud sync

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1ve81fm/i_built_a_home_inventory_` follows the constraints in `486-.../SPEC.md` and the chosen stack (React Native, TypeScript, Vision API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions a Google Play home-inventory app that fills details from a photo
- Plan keeps the photo → details framing
- Source did not name a price or region
