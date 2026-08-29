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

## Problem

The capture is a category-level problem statement from ProblemHunt: the `## Problem` body carries the placeholder `_Not written yet_`, and the title — "Image-based furniture and materials search service for designers" — is the entire problem statement. Nothing else in the capture adds detail: no description, no quoted persona, no specific furniture category, no named supplier, no price, no catalogue named. The honest ground truth is therefore the title plus the `Design, AI, Other` tags plus the country USA.

The problem the title names is real and recurring for US interior designers, set designers, architects and stylists: their work depends on finding specific pieces of furniture and specific materials — a particular walnut veneer, a particular brushed-brass pull, a particular bouclé weave — across dozens of supplier catalogues that do not share a search taxonomy. Designers currently keep Pinterest boards, screenshots, swatch folders and personal notes, and they re-search the same item by hand across vendor sites whenever a project requires it. Visual reference is the natural query modality for this work, but no shared, indexable search surface exists across the catalogues the designer cares about; vendor search engines are vendor-scoped, Google Lens returns shopping results unrelated to the design industry, and Pinterest is a personal bookmarking tool rather than a supplier-aware search.

The product implication, without inventing specifics, is that a US designer needs a way to upload or paste a reference image (a swatch photo, a styled room shot, a Pinterest screenshot) and receive a list of visually similar furniture and materials, ideally with a pointer back to the supplier catalogue the item lives in. The MVP is a similarity-search product over a curated catalogue index; it is not a vendor, it does not hold inventory, and it does not transact purchases. Country-specific facts the capture does not state — which supplier catalogues are in scope, whether US tariff rules apply to imported furniture, or specific US accessibility regulations for design-tool UIs — are flagged as open questions rather than asserted.

## Objective

Ship an image-based search service for US designers that turns a reference image (upload, paste or URL) into a ranked list of visually similar furniture and materials drawn from a curated index of supplier catalogues, each result annotated with its similarity score and a deep link back to the supplier catalogue page where the item is sold. The MVP must support reverse-image queries (find this item), near-neighbour queries (find items like this one) and material-texture queries (find materials matching this swatch), and must operate over an index the operator maintains rather than crawling the open web.

## Target Users

- US interior designers working on residential projects, who need to find specific pieces and specific materials across multiple supplier catalogues without re-running the same Google search.
- US set designers and prop masters for film and television, who work under tight timelines and need to identify and source specific pieces quickly.
- US architects specifying furniture and materials for commercial projects, who need a visual reference index that points back to the supplier catalogue rather than a Pinterest board.
- US furniture and lighting showroom staff, who need to identify an item a customer walks in holding a photo of and direct them to a similar product in their own inventory.
- US stylists for editorial and advertising shoots, who source specific pieces on short timelines and need a maintained reference index.
- US-based design studios building their own project libraries, who need a shared, indexed visual reference surface rather than per-designer Pinterest boards.

## MVP Scope

- A reverse-image and near-neighbour query endpoint accepting an uploaded image, a pasted image URL or a captured camera frame.
- A curated catalogue index built from supplier catalogue images, each item carrying a vector embedding, a category, a material tag and a deep link back to the supplier catalogue page.
- A self-hosted CLIP ViT-L/14 embedding pipeline that converts incoming query images into the same vector space as the catalogue index.
- A FAISS index over the catalogue embeddings, served from the Python service so a similarity query returns ranked results in the same request.
- A web UI for the designer showing the uploaded image, the top-N similar results with similarity scores, and a deep link per result.
- A material-texture mode that biases the ranking toward material-tagged items when the query image is detected as a swatch rather than a styled shot.
- A saved-search and result-bundle feature so a designer can group results into a project library.
- An explicit non-transaction disclaimer on every result page, naming that the service surfaces supplier catalogue pages and does not hold inventory or sell.
- An operator-facing catalogue-ingestion pipeline that lets the operator add, tag and retire catalogue items without code change.
- Audit logging of every query and every catalogue edit, with the catalogue versions referenced.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The product is an information and search service only; it does not hold inventory, does not sell furniture, and does not transact purchases, and the disclaimer must be visible on every result page.
- The catalogue index must be operator-curated; the service must not crawl the open web or include results from outside the maintained catalogue.
- Similarity scores are an approximation, not a guarantee; the service must label results as "visually similar" and link back to the supplier page rather than asserting identity.
- Supplier catalogue pages and pricing change; deep links must be revalidated periodically and broken links must be flagged for operator review.
- Personal data submitted to the service (uploaded images, project libraries) is sensitive and may include unpublished client projects; a documented retention policy must exist before any pilot designer is onboarded.
- The MVP is US-focused on day one; non-US catalogues can be added later but must not be in scope at launch.
- The product must not claim to identify a unique item from an image; visual similarity is the contract, identification is not.
