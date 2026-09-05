---
id: "3895"
slug: rose-reusable-foundation-embeddings-for-industrial-1h-n
title: Rose – reusable foundation embeddings for industrial 1H NMR
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

## Problem

The capture for this plan is a URL-only Show HN submission pointing at https://github.com/romboai/rose-1h-nmr. The product claim carried by the title is Rose, a set of reusable foundation embeddings for industrial proton nuclear magnetic resonance (1H NMR) spectroscopy — pretrained vector representations of NMR spectra that industrial labs can reuse instead of training from scratch. The capture states nothing further: no training data description, no benchmark numbers, no licensing statement and no named users.

## Objective

Ship the MVP the title describes: a loadable embedder that maps a 1H NMR spectrum to a fixed-size vector, published as reusable checkpoints so a lab can plug the embeddings into its own downstream tasks. The MVP must make the reusability claim concrete — a model, a documented input format, and a minimal inference path.

## Target Users

- Cheminformatics teams in pharma and chemicals building spectra-based ML models.
- Analytical chemists and QC labs that want similarity search over spectral libraries.
- ML researchers working on spectroscopy foundation models.
- Industrial labs without ML staff who need off-the-shelf spectral features.

## MVP Scope

- A pretrained embedder that consumes 1H NMR spectra and returns embeddings.
- Published checkpoints with a documented input format.
- An inference example that runs on a single spectrum end to end.
- A minimal evaluation showing the embeddings separate or retrieve spectra, to make reuse credible.

## Constraints

- The source is a bare URL plus title; dataset, model size and performance claims are ours to define and must not be presented as the author's.
- Industrial 1H NMR data is heterogeneous (solvent, field strength, referencing); the input contract is the hard problem.
- The capture states no licensing; the plan must not assume one.
- No benchmark numbers exist in the capture; the MVP must produce its own, honestly labeled.

## Design Direction

See `DESIGN.md` for this project's design tokens.
