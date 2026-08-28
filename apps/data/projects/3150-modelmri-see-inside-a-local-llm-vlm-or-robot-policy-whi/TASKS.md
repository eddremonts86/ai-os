---
id: "3150"
slug: modelmri-see-inside-a-local-llm-vlm-or-robot-policy-whi
title: "ModelMRI – see inside a local LLM, VLM or robot policy while it runs"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447785"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# ModelMRI – see inside a local LLM, VLM or robot policy while it runs

## Phase 0: Scaffold

- [ ] Create the repo and Python package layout
- [ ] Implement hook attachment on a loaded local model
- [ ] Define the tensor streaming format and transport
- [ ] Write SPEC.md, PRODUCT.md, PLAN.md, TASKS.md, DESIGN.md

## Phase 1: Core

- [ ] Capture activations and attention from one local LLM during inference
- [ ] Build the local live viewer
- [ ] Add selective capture and downsampling to bound overhead
- [ ] Measure and report instrumentation overhead
- [ ] Extend to a second model type and document what differs

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify (or chosen host)
- [ ] Verify in production
