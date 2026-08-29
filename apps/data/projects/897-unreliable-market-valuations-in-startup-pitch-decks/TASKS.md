---
id: "897"
slug: unreliable-market-valuations-in-startup-pitch-decks
title: Unreliable market valuations in startup pitch decks
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/startups/45pkeu8rb1-unreliable-market-valuations-in-startup"
  captured: "2025-10-10"
category: startups
date: "2025-10-10"
tags: [Startups]
country: Russia
tech: [Python, ClickHouse / Postgres, citation graph (CBO Insights + Crunchbase + PitchBook + public filings), LLM-assisted narrative review]
---
# Unreliable market valuations in startup pitch decks

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define the v1 free-source corpus scope (SEC EDGAR, Statista public, World Bank, OECD, industry PDFs)
- [ ] Define the deterministic red-flag rule set and write them down before any code
- [ ] Curate a 50-deck ground-truth test set with annotated red flags (so we can measure recall / precision in CI)
- [ ] Decide the deterministic extraction path (fine-tuned small model vs. structured-output LLM call) and lock it in
- [ ] Copyright review with a media lawyer before paid launch

## Phase 1: Core

- [ ] Ingestion: PDF, PPTX, Google Slides export, plain-text paste path
- [ ] Claim extractor: returns `{claim_text, value, unit, year, source_text}` per market-size statement
- [ ] Citation cross-reference service against the v1 free corpus
- [ ] Red-flag engine: staleness (> 3 years), single-source, GDP-impossible TAM, sum-of-unrelated-markets
- [ ] Confidence-report PDF with per-claim citations + red-flag score; deal-memo export
- [ ] Analyst dashboard with deck history, claim drill-down, and per-deck red-flag summary
- [ ] LLM narrative summary strictly grounded in extracted values (no free-form numerics)
- [ ] Per-deck processing latency ≤ 15 minutes on a free-corpus-only deck
- [ ] End-to-end pilot with 5 VC / angel analysts for 60 days; ≥ 90% red-flag recall on the 50-deck ground-truth set; ≥ 80% analyst-confirmed true-positive rate

## Phase 2: Deploy

- [ ] Paid-corpus connectors: PitchBook + CBO Insights behind analyst seat licenses
- [ ] Enterprise tier with SSO at $499 / seat / month
- [ ] Multi-corpus coverage: add Statista full API, IDC, Gartner excerpts where the seat-license allows
- [ ] Public launch targeting early-stage VC and angel communities
- [ ] Per-deck processing latency budget review; if compute-bound, add a small worker pool behind the extractor
