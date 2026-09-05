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

## Tech Stack

- **A signal ingestion layer** that watches public buying signals on the public web (the source names no specific set; the set is the system's claim).
- **A signal-to-account matching layer** that attaches each signal to a known account, configured with the team's account list.
- **A pipeline-entry generator** that produces a structured entry (account, signal, suggested next action) from a matched signal.
- **A CRM routing layer** that pushes pipeline entries through a configurable CRM integration (the source names no specific CRM; the integration is the system's claim).
- **A signal feed** the user reads in the system before the pipeline entry is routed.
- **A pipeline stage surface** that shows where each signal-derived entry sits.
- **A per-user signal subscription store** the user curates.
- **A public-web watch policy** that bounds the ingestion layer to public sources, never private access.

## Architecture

The system is a hosted service backed by four components: an ingestion layer, a matching layer, an entry generator, and a CRM router. The ingestion layer watches the public web for buying signals; the matching layer attaches each signal to a known account; the entry generator produces a structured pipeline entry; the CRM router pushes the entry through the configured integration.

The ingestion layer is bounded by the public-web watch policy. A signal that requires private access is a coverage gap, not a feature; the ingestion layer never authenticates to a private source. The signal set is the system's claim; the source names no specific source.

The matching layer reads from the team's account list and attaches each signal to a known account. The matching algorithm is the system's claim (rule-based, ML-based, or hybrid); the source is silent on the algorithm. A signal the user has to tag by hand is a matching failure.

The entry generator produces a structured entry per matched signal: account, signal, suggested next action. The entry is the contract between the system and the CRM; a free-form entry is a generation failure.

The CRM router pushes entries through a configurable integration. The integration is the system's claim; the source names no specific CRM. The user configures the integration from the settings surface; an unconfigured integration is a setup failure, not a silent no-op.

The signal feed is the user's pre-routing review. The user reads the signal before it becomes a pipeline entry; the feed is a separate surface from the CRM. A signal the user never sees is a UX gap.

The pipeline stage surface reads from the CRM and shows where each signal-derived entry sits. The surface mirrors the CRM's stage view; a divergence is a sync failure.

The per-user signal subscription store is the user's curation surface. The user adds or removes sources; a signal outside the subscription does not enter the user's feed. The store is per-user, never shared.

## Milestones

1. **M1 — Public-web ingestion layer** — the signal sources the system watches, the ingestion cadence, the public-web watch policy.
2. **M2 — Account list and matching layer** — the team's account list, the matching algorithm, the match-rate measurement.
3. **M3 — Pipeline-entry generator** — the structured entry shape (account, signal, suggested next action), the generation contract.
4. **M4 — CRM router** — the configurable CRM integration, the push pipeline, the unconfigured-integration handling.
5. **M5 — Signal feed** — the pre-routing review surface, the per-signal review action, the batch review option.
6. **M6 — Pipeline stage surface** — the CRM-mirrored stage view, the sync loop, the divergence detection.
7. **M7 — Signal subscription store** — the per-user curation, the source list, the per-account subscription.

## Risks

- **Public-web ingestion drifts off-policy** — the ingestion layer authenticates to a private source. Mitigation: the public-web watch policy is enforced at the network layer; a private-source access is a security incident.
- **Matching fails on a signal** — the signal lands in the feed with no attached account. Mitigation: the matching layer is documented; a signal without an account is a feed entry the user reviews and attaches by hand; an unattached signal is a UX gap, not a silent failure.
- **Entry generation drops the structured shape** — the entry becomes a free-form note. Mitigation: the entry generator enforces the structured shape; a malformed entry is a generation failure and is not pushed.
- **CRM integration drifts** — the configured CRM changes its API. Mitigation: the integration is versioned; a drift is a documented upgrade; an unconfigured integration is a setup failure.
- **Pre-routing review skipped** — the user does not read the feed and the entry is pushed without review. Mitigation: the review is a separate surface from the CRM; an unreviewed entry is a logged warning, not a silent push.
- **Pipeline stage surface diverges from the CRM** — the user sees a stage the CRM does not show. Mitigation: the surface reads from the CRM, not from the system's own stage view; a divergence is a sync failure and is corrected on the next sync.
- **Signal subscription list grows unbounded** — the user adds sources and the feed grows past what the user can review. Mitigation: the subscription store exposes a prune action; a feed the user cannot review is a coverage gap, not a silent failure.