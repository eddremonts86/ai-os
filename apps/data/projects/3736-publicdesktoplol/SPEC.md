---
id: "3736"
slug: publicdesktoplol
title: publicdesktop.lol
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/publicdesktop-lol"
category: product-launch
date: "2026-08-27"
tags: [ProductHunt, Product Launch]
wtp:
  raw: $10 permanent icon slot (purchase); song auction has no quoted reserve in the source
  currency: USD
  period: one-shot
  min: 10
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# publicdesktop.lol

## Problem

The ProductHunt listing for publicdesktop.lol is short by design: one tagline ("Public computer of the internet"), a one-line description ("Buy a permanent $10 icon location on the internet's public computer, or bid to control its public song."), and the launch tags "Design Tools • Icons • Marketing." The product positions itself as a single shared "public desktop" — a web surface that is one machine, one screen, one canvas for the whole internet to draw on, with the only scarce resource being the pixels their icon occupies and the audio track their bid buys for the day. The implicit problem the listing targets is twofold: the first is that iconic web real estate (the favicon on the address bar, the desktop shortcut on a kiosk browser, the "site of the day" badge that links back to the buyer) is normally brokered by intermediaries — media buys, sponsored slots, app-store placements — and the maker is selling it instead for a flat $10, permanently. The second is that even a flat icon on a shared public surface confers cultural recognition that an ad impression does not: by buying into the same desktop as the rest of the internet, the buyer becomes a peer of whichever other brand happens to have bought the neighbouring pixel.

## Objective

Ship a single shared, publicly-rendered web "desktop" with a finite grid of icon slots, each slot priced at $10 for permanent occupation, plus an auction mechanism for the public "song" that plays on the page. The MVP is the publicdesktop.lol website as described in the ProductHunt listing: a one-page surface that displays the desktop, the icons, and the song selector, with checkout attached for the $10 slot purchase and bid input for the song auction.

## Target Users

- **Primary:** solo founders and indie hackers who want an iconic web presence for $10 (one-time, permanent) instead of a media buy, and who treat the slot as a flex as much as a marketing surface.
- **Secondary:** small studios / one-person brands who want to appear on the same surface as their peers and use the URL as a permanent link in their bios / linktrees / email signatures.
- **Tertiary:** meme brands and culture-first projects for whom "we bought a slot on the internet's public computer" is itself the marketing message.

## MVP Scope

- A web "desktop" surface — a single rendered page — with a finite grid of icon slots, each slot anchored to a permanent URL such as `/d/[handle]` or `/d/[slug]`.
- A $10-permanent checkout flow for an icon slot, with the buyer's icon, label, and outbound URL pinned to that slot for the lifetime of the product.
- A public "song" slot on the page, controlled by the highest current bidder, with a daily (or weekly) reset and a bid-history surface visible to bidders.
- Read-only views of the desktop (the page itself) and any per-slot detail (icon, label, link target) that the buyer chose to publish.
- Admin tooling for slot inventory and disputed-content takedowns (the slot is permanent, but the *content* must be removable for abuse, trademark, or legal reasons).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- "$10 permanent" is the listing's headline price; if the real checkout deviates (a $10/year subscription, a $10/one-time plus a renewal fee, a hidden processing surcharge), the brand promise collapses. The checkout number must round to $10 in the buyer's eyes.
- The product is a *shared* surface. An icon policy must exist from day one — what icons are allowed, what is not (trademarks, impersonation, adult content, malware, scams). The policy is the product's editorial voice; if it is lax, the desktop becomes a spam farm, and if it is silently enforced with no published rulebook, the maker loses legitimacy.
- The "song" auction is a public-good surface. Bid rigging, shill bidding, or cartel behaviour would kill the cultural value quickly; the auction rules (sealed vs. open, frequency, minimum increment, refund policy on tie) must be published, not improvised.
- Permanent slots create a permanent responsibility for the maker: the desktop outlives the maker's attention. Hosting, takedowns, and a transition plan ("who runs the desktop if the original team stops?") are not optional, even if they are explicitly outside the MVP scope as shipping work.
- Pricing is partially stated: $10 per icon slot is explicit; song bidding has no minimum or increment quoted in the source. `wtp` should reflect *what is stated*, not invented: `{min: 10, currency: USD, period: one-shot}` only for the icon slot. Song auction has no quote and is left out.
- The ProductHunt listing marks the launch as "Free" — that is the read-only surface, not the buy flow. The team should not let "Free" be conflated with "no commerce exists on the page."
