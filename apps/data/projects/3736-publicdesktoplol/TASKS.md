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

## Phase 0: Scaffold

- [x] Read the ProductHunt listing to confirm the $10 permanent slot, the song auction, and the "public computer of the internet" framing
- [x] Write SPEC.md (this document)
- [x] Draft the icon policy (allowed and disallowed content) as a public page before any buyer can pay
- [x] Scaffold the desktop page, the slot grid, and the `/d/[handle]` URL scheme

## Phase 1: Core

- [ ] Render the desktop surface with the finite icon grid and the public song slot
- [ ] Implement the $10 permanent checkout with a guest flow and a receipt that reads $10.00
- [ ] Pin each purchased icon, label, and outbound URL to its slot for the product's lifetime
- [ ] Implement the song auction: bid input, bid history, and the daily or weekly reset
- [ ] Publish the auction rulebook (sealed or open, frequency, minimum increment, refund on tie)
- [ ] Build admin tooling for slot inventory and content takedowns

## Phase 2: Deploy

- [ ] Launch the read-only surface as "Free" while keeping the buy flow clearly commerce
- [ ] Monitor the takedown rate as a signal on the icon policy, not the product
- [ ] Write the continuity plan for who runs the desktop if the original team stops

---

_Generated automatically by Lúa on 2026-08-29_
