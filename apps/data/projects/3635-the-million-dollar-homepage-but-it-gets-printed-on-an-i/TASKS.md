---
id: "3635"
slug: the-million-dollar-homepage-but-it-gets-printed-on-an-i
title: "The Million Dollar Homepage, but it gets printed on an iPhone skin"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481324"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Next.js 14 (App Router), TypeScript, Stripe Checkout, Sharp, PostgreSQL, S3-compatible storage, Coolify]
---
# The Million Dollar Homepage, but it gets printed on an iPhone skin

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3635-the-million-dollar-homepage-but-it-gets-printed-on-an-i/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the Next.js storefront with the 25 × 45 grid component and the real-time tile-availability model
- [ ] Implement the per-tile and contiguous-pack selection flow with the grid preview
- [ ] Wire the JPG / JPEG upload with the 10 MB ceiling and the solid-background check using Sharp
- [ ] Integrate Stripe Checkout for the US$1-per-tile flow and the optional US$200 camera-area block
- [ ] Handle the Stripe webhook as the source of truth for the tile-lock transition
- [ ] Persist processed tile images and contributor records with the unique-constraint guarantee on grid coordinates
- [ ] Build the contributor account surface that lists tiles, allows downloading the final image and generates the certificate
- [ ] Schedule the submissions-close job that locks the grid on October 1, 2026 and produces the final composite
- [ ] Render the Apple non-affiliation statement on the storefront footer, every receipt and every deliverable
- [ ] Add CI that asserts the trademark line is present on every public surface and every downloadable artefact
- [ ] Add CI that asserts Stripe webhook handlers are idempotent so a retry does not double-lock a tile
- [ ] Document the print handoff flow with the print partner the source names, or flag it as an open question if the source does not name one

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
