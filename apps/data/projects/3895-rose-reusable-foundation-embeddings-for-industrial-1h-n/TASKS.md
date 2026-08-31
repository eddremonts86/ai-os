---
id: "3895"
slug: rose-reusable-foundation-embeddings-for-industrial-1h-n
title: "Rose – reusable foundation embeddings for industrial 1H NMR"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497418"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [PyTorch, self-supervised pretraining, NMR spectral preprocessing, HuggingFace Hub, Python, chemistry data pipelines]
---
# Rose – reusable foundation embeddings for industrial 1H NMR

## Phase 0: Scaffold

- [x] Read the Show HN capture and confirm it is URL-only
- [x] Write SPEC.md, PRODUCT.md, PLAN.md and TASKS.md
- [x] Scaffold the repo and the embedding stub
- [x] Define and document the canonical spectrum input format

## Phase 1: Core

- [ ] Implement the preprocessing pipeline for raw spectra
- [ ] Load the pretrained embedder and embed a single spectrum end to end
- [ ] Build the nearest-neighbor retrieval demo
- [ ] Set up the linear-probe evaluation harness

## Phase 2: Deploy

- [ ] Publish checkpoints on HuggingFace Hub with usage examples
- [ ] Publish retrieval and linear-probe numbers with honest labels
- [ ] Seek feedback from one industrial lab
- [ ] Resolve licensing explicitly
