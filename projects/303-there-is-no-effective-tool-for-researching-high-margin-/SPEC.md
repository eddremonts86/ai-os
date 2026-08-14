---
id: "303"
slug: there-is-no-effective-tool-for-researching-high-margin-
title: There is no effective tool for researching high-margin and small e-commerce products
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/ecommerce/uwa5w0mc31-there-is-no-effective-tool-for-researc"
category: ecommerce
date: "2025-11-13"
tags: [Ecommerce, Research, Other]
country: Australia
tech: [Next.js, TypeScript, Postgres, Playwright scraper, Keepa API, OpenAI, Hetzner]
---
# There is no effective tool for researching high-margin and small e-commerce products

## Problem

An Australian e-commerce operator describes a tooling gap: the products most worth selling are small, niche, and high-margin, but the existing product-research tools are built around the opposite use case — they surface saturated categories and the same Amazon-style "hot products" lists every other seller is already competing for. The title pins the unmet need directly: a tool that finds high-margin *small* products, not a tool that lists what's already popular.

## Objective

Ship a research tool that surfaces candidate small e-commerce products ranked on margin, demand signal, and competition intensity, with a workflow that helps an Australian operator go from a category seed to a shortlist of viable SKUs in under an hour.

## Target Users

- Solo e-commerce operators in Australia running Shopify, eBay AU, or Amazon AU stores.
- Sourcing managers at small Australian retail brands hunting for a second product line.
- Dropshippers who want a defensible margin, not a race-to-the-bottom SKU.

## MVP Scope

- Category seed input (e.g. "kitchen gadgets under $30 wholesale").
- A scraper that pulls Amazon AU, eBay AU, and a configurable list of niche marketplaces for products in the seed category.
- Per-product scoring: estimated wholesale cost, observed retail band, review velocity, seller count, gross margin %.
- Shortlist view with one-click export to a CSV the operator can hand to a supplier.
- Refresh schedule so a shortlist stays current for 14 days before re-running.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/ecommerce/uwa5w0mc31-there-is-no-effective-tool-for-r` follows the constraints in `303-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Australia.

For Australia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Scrape rate must respect robots.txt and each marketplace's terms; no cloaking, no fake user-agents.
- Margin estimates must show the assumption set (wholesale source, shipping, GST treatment) so the operator can sanity-check.
- Must run on a single Hetzner VPS in the first release; horizontal scaling is a v2 concern.
