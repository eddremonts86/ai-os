---
id: "3900"
slug: photo-manager-that-find-and-organize-screenshots-with-p
title: "Photo Manager That Find and Organize Screenshots with Private, Local AI"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49496500"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [on-device OCR, local embedding model, image classification, local vector index, native desktop app, SQLite]
---
# Photo Manager That Find and Organize Screenshots with Private, Local AI

## Value Proposition

Screenshots are the notes nobody can search. Cloud photo apps index them — at the price of uploading everything personal to someone else's servers. The title's promise is the local path: AI that reads and organizes screenshots on your own machine, so you can find the error message from March without shipping your life to the cloud. Privacy is not a setting here; it is the architecture.

**One-liner:** Find and organize screenshots with AI that stays on your machine.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Hoarders of screenshots | Years of captures become searchable for the first time. |
| Support and research workers | Reference images are their daily currency. |
| Privacy-conscious users | Local processing is the only acceptable kind. |
| Developers | Bug screenshots, docs, error logs — all findable by content. |

## Jobs To Be Done

1. Find one screenshot by what it shows or the text inside it.
2. Have the app file new screenshots automatically instead of a folder growing unbounded.
3. Search without uploading anything anywhere.
4. Clean up: spot duplicates and old captures worth deleting.

## Success Metrics

- Screenshots indexed per library.
- Search latency for text and semantic queries.
- Share of searches that end in a clicked result.
- Duplicate and clutter detection rate, the cleanup signal.

## Pricing & Monetization

None stated. The capture contains no pricing information.

## Competitive Landscape

The capture names no competitors. The category is photo management and search — cloud libraries on one side, and a thin set of local-AI photo tools on the other — where the title's differentiation is both axes at once: screenshots specifically, and private local AI.

## Risks & Open Questions

- [ ] On-device models are slower and weaker than cloud ones; the gap must be managed honestly.
- [ ] Indexing a huge existing library takes real time and battery.
- [ ] OCR accuracy on weird fonts, dark-mode UI and partial crops is uneven.
- [ ] The source is a bare URL plus title; scope may differ from the author's build.
- [ ] No monetization is stated; a local-first app has a different revenue path than SaaS.
