---
id: "4233"
slug: brandjet
title: BrandJet
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/brandjet-ai"
category: product-launch
date: "2026-08-18"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# BrandJet

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4233-brandjet/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the public-web ingestion layer that watches public buying-signal sources (the system's documented set), with the public-web watch policy that bounds the layer to public sources and refuses private-source authentication.
- [ ] Implement the account list import and the matching layer that attaches each ingested signal to a known account, with the match-rate measurement that surfaces gaps in the feed.
- [ ] Build the pipeline-entry generator that produces the structured entry shape (account, signal, suggested next action) and refuses to emit a free-form entry.
- [ ] Implement the CRM router with a configurable integration; the user configures the CRM from the settings surface; an unconfigured integration is a setup failure, not a silent no-op.
- [ ] Add the signal feed as a pre-routing review surface where the user reads each signal before it becomes a pipeline entry; support per-signal and batch review actions.
- [ ] Build the pipeline stage surface that reads from the CRM and shows where each signal-derived entry sits; surface and correct any stage divergence from the CRM on the next sync.
- [ ] Add the per-user signal subscription store where the user curates which sources feed the user's feed; a signal outside the subscription does not enter the feed.
- [ ] Enforce the public-web watch policy at the network layer: the ingestion layer authenticates only to public sources, and any private-source access is a logged security incident.
- [ ] Write the README that documents the signal sources, the matching layer, the entry shape, the CRM integration, the pre-routing review, the pipeline stage surface, and the signal subscription store.
- [ ] Run an end-to-end test on a representative signal flow: the ingestion layer picks up a signal from a public source, the matching layer attaches it to a known account, the entry generator produces a structured entry, the user reviews it in the feed, the entry is pushed through the configured CRM integration, the pipeline stage surface mirrors the CRM, and the per-user subscription store keeps the feed scoped.

## Phase 2: Deploy

- [ ] Ship the system as a hosted service
- [ ] Document the signal sources, the matching layer, the entry shape, and the CRM integrations in the launch material so users understand the system's scope
- [ ] Verify in production