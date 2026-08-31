---
id: "3814"
slug: open-source-dataset-cleaner-for-jsonl-outputs
title: Open source dataset cleaner for JSONL outputs
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495806"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Python CLI, PyPI packaging, JSONL parsing and validation, documentation-to-Q&A extraction, deterministic cleaning rules, pip install distribution]
---
# Open source dataset cleaner for JSONL outputs

## Phase 0: Scaffold

- [x] Read the Show HN post and the linked PyPI page to extract what is verifiable (version, Python floor, maintainer)
- [x] Write SPEC.md (this document)
- [x] Clone the published repository and install the package in a virtualenv
- [x] Inspect the CLI surface and enumerate its actual cleaning operations

## Phase 1: Core

- [ ] Implement or verify JSONL parsing with field-level validation
- [ ] Implement or verify normalization and deduplication rules
- [ ] Add an error report for rejected records
- [ ] Exercise the tool inside a documentation-to-Q&A extraction pipeline

## Phase 2: Deploy

- [ ] Gate reproducible output (same input, same cleaned file) in CI
- [ ] Publish versioned releases to PyPI with sdist and wheel
- [ ] Write a README that closes the description gap between the HN title and the PyPI summary
