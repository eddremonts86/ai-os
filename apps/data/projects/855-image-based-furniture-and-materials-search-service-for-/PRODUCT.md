---
id: "855"
slug: image-based-furniture-and-materials-search-service-for-
title: Image-based furniture and materials search service for designers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/design/n8bf3rlru1-image-based-furniture-and-materials-sear"
category: design
date: "2025-11-06"
tags: [Design, AI, Other]
country: USA
tech: [Next.js (App Router), TypeScript, Python (FastAPI), PostgreSQL with pgvector, CLIP ViT-L/14 (self-hosted), FAISS, AWS S3, Stripe, Vercel]
---
# Image-based furniture and materials search service for designers

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An image-based search service for US interior designers, set designers, architects and stylists, that turns a reference image into a ranked list of visually similar furniture and materials drawn from a curated index of supplier catalogues, each result carrying a similarity score and a deep link back to the supplier catalogue page where the item is sold. The service operates over an index the operator maintains, so what the designer sees is consistent and supplier-aware rather than a Google-Lens shopping result.

The product is deliberately scoped. It does not hold inventory, it does not sell furniture, and it does not transact purchases. What it does is convert a reference image into a ranked shortlist of similar items with a path back to the supplier — and into a project library the designer can share with a client or a colleague.

**One-liner:** An image-based furniture and materials search service for US designers that turns a reference photo into a ranked shortlist of similar items from a curated supplier-catalogue index, each with a similarity score and a link back to the catalogue page.

## Target Users

| Stakeholder | Why they care |
|---|---|
| US interior designers | Need to find specific pieces and materials across multiple supplier catalogues without re-running the same Google search. |
| US set designers and prop masters | Work under tight timelines and need to identify and source specific pieces quickly from a visual reference. |
| US architects specifying furniture and materials | Need a visual reference index that points back to the supplier catalogue rather than a Pinterest board. |
| US showroom staff | Need to identify an item a customer walks in holding a photo of and direct them to a similar product. |
| US editorial and advertising stylists | Source specific pieces on short timelines and need a maintained reference index. |
| US design studios | Need a shared, indexed visual reference surface rather than per-designer Pinterest boards. |

## Jobs To Be Done

1. **Functional job** — Find items visually similar to this reference image across the supplier catalogues I care about.
2. **Functional job** — Bias the results toward materials when my reference is a swatch rather than a styled shot.
3. **Functional job** — Group the results I like into a project library I can share with a client or colleague.
4. **Functional job** — Click through from each result to the supplier catalogue page where the item is actually sold.
5. **Emotional job** — Stop keeping twenty Pinterest boards and re-Googling the same walnut veneer across vendors.
6. **Social job** — Hand a client a visual shortlist in the first meeting rather than a list of vendor URLs.

## Success Metrics

- **Query completion** — share of queries that result in at least one clicked-through result, indicating the shortlist was useful.
- **Result click-through rate** — clicks per query divided by results shown, since the link back to the supplier is the product's value.
- **Catalogue coverage** — share of the most common US residential supplier catalogues that have at least one item indexed.
- **Catalogue freshness** — median age of indexed items and share of broken deep links flagged for operator review.
- **Project-library reuse** — share of designers who return to save results into a second project, which is the proxy for whether the library feature was trusted.
- **Disclaimer acknowledgement** — share of result pages for which the non-transaction disclaimer was visibly rendered.

## Pricing & Monetization

The capture names no price, no tier and no business model; the only ground truth available is the title, the country and the category tags. What the architecture does fix is a cost shape: every query consumes an embedding inference for the query image and a similarity search over the catalogue index, while catalogue ingestion is a batch cost driven by the operator's curation rate. A plausible paid shape is therefore per-designer subscription with usage included, plus an enterprise tier for design studios with shared project libraries; the actual price is left as an open question because the source gives no number to quote.

## Competitive Landscape

- **Pinterest and similar image-bookmarking tools** — abundant and well-known, but personal-bookmark rather than supplier-aware search, and not optimised for the specific furniture-and-materials workflow.
- **Google Lens and reverse-image search engines** — fast and broad, but return shopping results unrelated to the design industry and have no curated-catalogue index.
- **Individual supplier catalogue search** — vendor-scoped and deep, but requires re-running the same query across every vendor the designer cares about.
- **Trade-specific product-discovery platforms** — exist for some segments (high-end residential, contract furniture), but tend to be category- or vendor-specific rather than cross-catalogue visual search.

The capture names no competitor by name, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the supplier-catalogue ingestion terms with at least one major US residential catalogue; the capture names no partner.
- [ ] Establish the catalogue-curation rate the operator can sustain, since the product is only as good as the index it ships with.
- [ ] Decide whether deep-link revalidation is in-house or contracted, and how often broken links are surfaced to the operator.
- [ ] Set the retention policy for uploaded images and project libraries, including unpublished client projects; the capture gives no data-retention rule.
- [ ] Confirm whether the MVP is US-only at launch or extends to non-US catalogues from day one.
- [ ] Determine the studio-tier access model — a single shared library, per-designer libraries, or both — before the first studio pilot.
