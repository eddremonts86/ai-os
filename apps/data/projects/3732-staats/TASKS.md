---
id: "3732"
slug: staats
title: Staats
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/staats-3"
category: product-launch
date: "2026-08-28"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Staats

## Phase 0: Scaffold

- [x] Read the ProductHunt listing to confirm the agent-native positioning, the cookieless claim, the deploy markers, and the no-dashboard identity
- [x] Write SPEC.md (this document)
- [x] Verify the collector design genuinely avoids a cookie banner in the EU: no cookies, no per-user identifiers
- [x] Scaffold the ingestion endpoint, the deploy-marker API, and the evidence-card schema

## Phase 1: Core

- [ ] Implement the cookieless pageview and event collector with no PII and no per-user identifiers
- [ ] Build the deploy-marker API (deploy id, commit, version, release notes) for CI and manual use
- [ ] Implement baseline comparison with time windows, segments, and cohort evidence
- [ ] Generate evidence cards: deploy id, window, baseline, delta, and a one-line interpretation
- [ ] Ship the agent-native CLI / MCP / HTTP surface for "what shipped, what changed, what's next"
- [ ] Insulate the analytics layer from user-controlled content against prompt injection

## Phase 2: Deploy

- [ ] Run an external scan confirming zero PII and per-user identifiers and no cookie banner requirement
- [ ] Onboard the first solo founders with coding agents and measure agent calls per workspace
- [ ] Set precision and recall targets against a labelled deploy set before public launch

---

_Generated automatically by Lúa on 2026-08-29_
