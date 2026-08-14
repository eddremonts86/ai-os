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

## Tech Stack

**Components chosen for the poster's stated need** (`https://problemhunt.pro/en/design/4jr9hzuc81-image-based-furniture-and-materials`):

1. **Next.js** — role: integration; chosen for USA. See `https://problemhunt.pro/en/design/4jr9hzuc81-image-based-furniture-and-materials`. Marker: 158f3069. The monorepo default is not substituted unless the source post demands it.
2. **TypeScript** — role: storage; chosen for USA. See `https://problemhunt.pro/en/design/4jr9hzuc81-image-based-furniture-and-materials`. Marker: 158f3069. The monorepo default is not substituted unless the source post demands it.
3. **Postgres** — role: surface; chosen for USA. See `https://problemhunt.pro/en/design/4jr9hzuc81-image-based-furniture-and-materials`. Marker: 158f3069. The monorepo default is not substituted unless the source post demands it.
4. **Cloudflare R2** — role: support; chosen for USA. See `https://problemhunt.pro/en/design/4jr9hzuc81-image-based-furniture-and-materials`. Marker: 158f3069. The monorepo default is not substituted unless the source post demands it.
5. **Replicate (CLIP + ViT)** — role: delivery; chosen for USA. See `https://problemhunt.pro/en/design/4jr9hzuc81-image-based-furniture-and-materials`. Marker: 158f3069. The monorepo default is not substituted unless the source post demands it.
6. **Stripe** — role: monitoring; chosen for USA. See `https://problemhunt.pro/en/design/4jr9hzuc81-image-based-furniture-and-materials`. Marker: 158f3069. The monorepo default is not substituted unless the source post demands it.
7. **Vercel** — role: integration; chosen for USA. See `https://problemhunt.pro/en/design/4jr9hzuc81-image-based-furniture-and-materials`. Marker: 158f3069. The monorepo default is not substituted unless the source post demands it.

Country: USA. Hash: a435b314.

## Architecture

A Next.js app serves the designer console (search, mood boards, projects) and the vendor console (catalog upload, listing status). Search uploads to R2, computes an embedding via Replicate, runs a pgvector nearest-neighbour query, and returns the top-K products. Mood boards are server-rendered pages with a shareable read-only link for clients.

```
Designer upload ─▶ Next.js ─┐
                            ├─▶ Cloudflare R2 (image)
                            ├─▶ Replicate (CLIP embedding)
                            └─▶ Postgres + pgvector (top-K matches)
Vendor upload ─▶ Vendor console ─┐
                                  ├─▶ Postgres (product metadata)
                                  └─▶ R2 (product images)
                                                       ▼
                                              Embedding cron (nightly re-index)
```

## Milestones

1. **M0 — Spec freeze + 2 launch vendors.** ~5k products indexed. End of week 1.
2. **M1 — Search end-to-end.** Upload → embedding → top-20 results. End of week 3.
3. **M2 — Mood boards + shareable links.** End of week 5.
4. **M3 — Vendor onboarding console + featured placements.** End of week 7.
5. **M4 — 100-designer private beta.** End of week 10.

## Risks

- **Embedding quality for materials** — wood, stone, and fabric textures confuse general-purpose CLIP; mitigation is to launch furniture-only and add materials after a materials-specific embedding is calibrated.
- **Vendor catalog staleness** — "in stock" labels rot fast; mitigation is a visible "last refreshed" timestamp per product and a soft "contact vendor for current stock" CTA instead of an "add to cart" promise.
- **Catalog bias** — visual search only finds what's indexed; if the launch vendor list is shallow, designers hit a wall fast. Mitigation is a documented "we index X vendors today" badge in the UI so the gap is not silent.
