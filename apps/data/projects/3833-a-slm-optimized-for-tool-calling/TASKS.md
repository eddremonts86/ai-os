---
id: "3833"
slug: a-slm-optimized-for-tool-calling
title: A SLM Optimized for Tool Calling
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493085"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Small language model tuned for tool calling, JSON schema decoding, TrustedRouter hosting, tool-call pipeline harness, per-token metered API, router-side integration]
---
# A SLM Optimized for Tool Calling

## Phase 0: Scaffold

- [x] Read the Show HN capture and the linked Neurometric blog post to extract pricing and claims
- [x] Write SPEC.md (this document)
- [x] Confirm the model endpoint on TrustedRouter and its tool-calling interface
- [x] Set up a schema-conformance test harness for tool calls

## Phase 1: Core

- [ ] Route real tool-calling traffic at the SLM and compare cost per turn against the frontier path
- [ ] Measure latency per tool-selection hop across workloads
- [ ] Test schema adherence on unseen schemas and fix malformed-call patterns
- [ ] Publish benchmark numbers that back the stated cost and latency claims
- [ ] Document router-side integration for teams switching tool-calling traffic

## Phase 2: Deploy

- [ ] Open the model to TrustedRouter users at the stated metered price
- [ ] Collect workload feedback on where the SLM should not be routed
- [ ] Decide expansion: more task-specific models or wider tool-call formats

---

_Generated automatically by Lúa on 2026-08-30_
