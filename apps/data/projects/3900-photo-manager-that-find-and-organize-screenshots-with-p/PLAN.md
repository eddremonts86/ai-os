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

## Tech Stack

- **On-device OCR:** text extraction from screenshots.
- **Local embedding model:** semantic search over image content.
- **Image classification:** automatic categories.
- **Local vector index:** similarity queries.
- **SQLite:** metadata and file state.
- **Native desktop app shell:** OS integration.

## Architecture

- A folder watcher ingests new screenshots.
- A local pipeline runs OCR, embedding and classification per image.
- A vector index plus full-text index serve queries.
- A local UI: search bar, category browser, preview.
- Everything runs on the user's machine; the network use is none.

## Milestones

1. **M0 — Scaffold:** app shell, folder watcher, metadata store.
2. **M1 — Read:** OCR and embeddings run locally on every new screenshot.
3. **M2 — Find:** full-text and semantic search over the index.
4. **M3 — Organize:** automatic categories, duplicates, cleanup suggestions.

## Risks

- Model quality on device is the make-or-break: bad search kills the promise.
- Indexing cost on large libraries needs batching and idle-time scheduling.
- The privacy claim is binary: one accidental upload destroys trust.
- Desktop integration (screenshot hotkeys, file events) varies by OS.
