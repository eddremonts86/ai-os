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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (search results grid, mood-board canvas, vendor console)
- [ ] Provision Vercel + Neon Postgres (pgvector) + Cloudflare R2
- [ ] Wire Replicate + Stripe + 2 launch vendor LoIs
- [ ] Decide on auth: email magic link

## Phase 1: Core

- [ ] Designer signup: email magic link, name, studio, design focus
- [ ] Image upload or paste-a-URL input
- [ ] Embedding pipeline: upload to R2, CLIP ViT-L/14 via Replicate, write vector to pgvector
- [ ] Top-20 nearest-neighbour match; result page with vendor link, price, lead time
- [ ] Mood boards: per-project collection, drag-to-reorder, shareable read-only link
- [ ] Vendor console: catalog upload (CSV / JSON), review queue, listing status
- [ ] Stripe billing for designers (free / paid) and vendor featured placements
- [ ] Nightly embedding cron for newly added vendor products
- [ ] End-to-end test: 100 reference images across launch vendors, measure top-5 hit rate

## Phase 2: Deploy

- [ ] Move Stripe to live mode
- [ ] Recruit 100 designers via ASID, AIA, and Houzz Pro communities
- [ ] Vercel-side deployment of the console
- [ ] Status page + Replicate + R2 monitoring
- [ ] Post-mortem after week 10 with the designer cohort
