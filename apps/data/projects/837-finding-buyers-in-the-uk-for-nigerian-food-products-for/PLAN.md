---
id: "837"
slug: finding-buyers-in-the-uk-for-nigerian-food-products-for
title: Finding buyers in the UK for Nigerian food products for export
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: business
date: "2025-11-14"
tags: [Business, Other]
country: Nigeria
tech: [Astro (static), TypeScript, Cloudflare Pages]
---
# Finding buyers in the UK for Nigerian food products for export

## Tech Stack

Astro (static), TypeScript, Cloudflare Pages.

## Architecture

Static site generated from a JSON catalogue of buyer records. Filter UI is client-side. No login. Records are version-controlled in the repo so updates are reviewable.

## Milestones

- M1: seed 30 buyer records from public UK importers of African food
- M2: category + buyer-type filters and detail pages
- M3: outbound-email templates for first contact

## Risks

Static-first site is acceptable; buyer records can be curated markdown or JSON in the repo. No backend needed at MVP if data is curated.

- Buyer data goes stale fast; without an owner this becomes a dead directory.
- Import compliance (UK food labelling, FSA registration) is real but out of scope; do not give advice here.
