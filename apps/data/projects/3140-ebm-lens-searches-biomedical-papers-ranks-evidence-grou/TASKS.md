---
id: "3140"
slug: ebm-lens-searches-biomedical-papers-ranks-evidence-grou
title: "EBM Lens, searches biomedical papers, ranks evidence, grounds claims"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448826"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# EBM Lens, searches biomedical papers, ranks evidence, grounds claims

## Phase 0: Scaffold

- [ ] Create the repo and Python package layout
- [ ] Add the literature API client with rate-limit handling
- [ ] Define the record and citation-span data structures
- [ ] Write SPEC.md, PRODUCT.md, PLAN.md, TASKS.md, DESIGN.md

## Phase 1: Core

- [ ] Implement query to ranked candidate records
- [ ] Implement the evidence ranking and document its hierarchy
- [ ] Implement claim-to-source span extraction
- [ ] Add a grounding check that fails on unresolvable citations
- [ ] Ship a CLI and a worked example in the README

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify (or chosen host)
- [ ] Verify in production
