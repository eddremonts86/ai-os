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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/855-image-based-furniture-and-materials-search-service-for-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the CLIP ViT-L/14 inference endpoint and a Python (FastAPI) service that returns ranked FAISS results for an uploaded image
- [ ] Build the FAISS snapshot over a small seed catalogue and the PostgreSQL schema for catalogue items, designer accounts, project libraries and audit logs
- [ ] Build the operator-facing catalogue ingestion pipeline that downloads, embeds, tags and versions items into both stores
- [ ] Build the Next.js (App Router) search UI with image upload, result list with similarity scores and deep links
- [ ] Render the non-transaction disclaimer on every result page and every shared project-library view
- [ ] Implement the material-texture mode with swatch detection and a bias toward material-tagged items in the ranking
- [ ] Implement the project-library feature with per-designer saved searches and a shared-link token for client-facing views
- [ ] Implement the periodic deep-link revalidation job that flags broken deep links for operator review
- [ ] Wire AWS S3 storage with per-designer prefixes and lifecycle rules aligned to the documented retention policy
- [ ] Wire Stripe for the paid tier on a single subscription product
- [ ] Add the request-id-tied audit log across queries, result click-throughs, project-library edits and catalogue edits
- [ ] Define and document the retention policy for uploaded images and project libraries before any pilot designer is onboarded

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
