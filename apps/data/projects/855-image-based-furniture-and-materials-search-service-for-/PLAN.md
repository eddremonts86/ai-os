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

## Tech Stack

- **Next.js (App Router)** for the designer-facing search UI and project-library pages, because the user journey is image-heavy and benefits from server-rendered result pages with shared project links.
- **TypeScript** end to end so the catalogue data shape and the result schema are enforced at compile time across the UI and the API.
- **Python with FastAPI** for the embedding and similarity-search service, because image-embedding inference and FAISS query handling are well-served by Python's ML ecosystem.
- **PostgreSQL with pgvector** as the primary store for catalogue items, designer accounts, project libraries and audit logs, with pgvector used as a secondary store for per-query embeddings during development.
- **CLIP ViT-L/14 self-hosted** as the image-embedding model, run behind an internal inference endpoint so query images and catalogue images share the same vector space without external API cost.
- **FAISS** as the in-memory similarity-search index over the catalogue embeddings, snapshotted to disk on operator-curated updates and reloaded at service start.
- **AWS S3** as the storage layer for catalogue images and designer-uploaded reference images, on a per-designer prefix with lifecycle rules aligned to the documented retention policy.
- **Stripe** as the payments processor for any paid tier, on a single subscription product at launch.
- **Vercel** for the Next.js front-end hosting, because image-heavy search UI benefits from Vercel's edge caching and image optimisation.

## Architecture

The designer-facing UI is a Next.js App Router page that accepts an image upload, a pasted image URL or a captured camera frame, plus an optional mode flag (default near-neighbour, alternative material-texture bias). Submission posts the image to the Python service, which loads CLIP ViT-L/14, computes the embedding for the query image and runs a FAISS similarity search over the catalogue index. The top-N results are returned with their similarity scores, catalogue metadata and deep links back to the supplier catalogue page.

The catalogue index is built from a batch ingestion pipeline that runs when the operator adds or updates items. Each item is downloaded from a controlled supplier source, embedded with CLIP, tagged with a category and material taxonomy, and written into both the FAISS snapshot and the PostgreSQL catalogue-items table. The two stores are versioned together: a catalogue edit creates a new catalogue version rather than overwriting the old one, so a query result generated against version N continues to resolve to version N until the FAISS snapshot is reloaded. Deep-link revalidation is a periodic batch job that HEAD-checks each catalogue item's deep link and flags broken links for operator review.

The project-library feature stores a per-designer collection of query-and-result pairs in PostgreSQL, with a shared-link token for client-facing views. Uploaded reference images are stored under the designer's AWS S3 prefix with a lifecycle rule aligned to the documented retention policy; catalogue images are stored separately under an operator-owned prefix that is not subject to the per-designer retention rule. Audit logs record every query, every result click-through, every project-library edit and every catalogue edit, with a request id that ties them together.

The non-transaction disclaimer is rendered server-side so it is included in the initial HTML and so a shared project-library link carries the same wording as the designer's own view. Stripe handles paid-tier billing on a single subscription product, with the studio tier as a separate subscription product once the access model is confirmed.

## Milestones

1. **M1 — Embedding and index** — CLIP ViT-L/14 inference endpoint, FAISS snapshot over a small seed catalogue, and a Python service that returns ranked results for an uploaded image.
2. **M2 — Catalogue ingestion v1** — operator-facing ingestion pipeline that downloads, embeds, tags and versions items into the FAISS snapshot and the PostgreSQL catalogue table.
3. **M3 — Search UI** — Next.js page with image upload, result list with similarity scores and deep links, and the server-rendered non-transaction disclaimer.
4. **M4 — Material-texture mode** — swatch detection on the query image and a bias toward material-tagged items in the ranking.
5. **M5 — Project libraries** — per-designer saved searches and result bundles, with a shared-link token for client-facing views.
6. **M6 — Deep-link revalidation** — periodic batch job that flags broken deep links for operator review, and a freshness metric surfaced in the operator dashboard.

## Risks

- **Thin catalogue index** — the product exists to give a designer a supplier-aware shortlist, and an index with too few items is the same problem as a Pinterest board with five pins.
- **Broken deep links** — supplier catalogue pages move and disappear, and a result that no longer resolves to a real product page is a product failure that must be detected and surfaced to the operator.
- **PII exposure** — uploaded reference images may include unpublished client projects, and a clear retention policy and per-designer S3 prefixes must exist before the first pilot designer.
- **Disclaimer invisibility** — a result page that does not visibly carry the non-transaction disclaimer is a result page that a designer might use as a sales channel; the disclaimer is a feature, not a footer.
- **CLIP bias** — a general-purpose image-embedding model mis-prices some design-specific similarity judgments (a walnut veneer versus a walnut-print laminate, for example), and the operator needs a feedback channel for catalogue mis-tagging.
- **Vendor-relationship drift** — a curated index built without partner agreement is fragile, and the operator must confirm ingestion terms with at least one major catalogue before scale.
- **Studio-tier scope creep** — a shared-library feature that quietly grows into a project-management tool is scope creep that has to be resisted; the MVP is search and library, not studio PM.
