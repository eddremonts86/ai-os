---
id: "313"
slug: image-based-furniture-and-materials-search-service-for-
title: Image-based furniture and materials search service for designers
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/design/4jr9hzuc81-image-based-furniture-and-materials-search"
category: design
date: "2025-11-12"
tags: [Design, AI, Other]
country: USA
tech: [Next.js, TypeScript, Postgres, Cloudflare R2, Replicate (CLIP + ViT), Stripe, Vercel]
---
# Image-based furniture and materials search service for designers

## Problem

Interior designers and architects in the US describe a recurring search problem: a client shows them a mood-board photo or a swatch and says "find me this", and the designer has to scroll through hundreds of vendor sites, Houzz, and 1stdibs to find a match. Text search fails because the user does not know the product name, and exact-image reverse search fails because the photo is rarely from a stock site. The title names the missing service directly: image-based search for furniture and materials.

## Objective

Ship a visual search service that takes a reference image of furniture or a material, returns visually similar products from a curated vendor catalog, and lets the designer save matches into a per-project mood board.

## Target Users

- Independent interior designers in the US working on residential projects.
- Architects specifying finishes, fixtures, and furniture for commercial projects.
- Staging companies and set designers searching for a specific look across vendors.

## MVP Scope

- Image upload (JPEG / PNG) or paste-a-URL input.
- Visual encoder (CLIP / ViT) computes an embedding; matches against a vendor catalog (5–10 launch partners).
- Results page: top 20 visually similar products, ranked, with vendor link, price, and lead time.
- Mood board: per-project collection of saved products; shareable read-only link with the client.
- Vendor ingest: a self-serve vendor onboarding flow with manual review of the catalog.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/design/4jr9hzuc81-image-based-furniture-and-materials` follows the constraints in `313-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Catalog images stored on EU/US-compliant object storage; per-vendor access controls.
- Visual matching is fuzzy by design — the service must show the assumption set (which vendors are indexed, when the catalog was last refreshed).
- No vendor data may be reused to train another embedding model.
