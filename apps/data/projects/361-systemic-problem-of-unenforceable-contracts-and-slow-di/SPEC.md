---
id: "361"
slug: systemic-problem-of-unenforceable-contracts-and-slow-di
title: Systemic problem of unenforceable contracts and slow dispute resolution
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/legal/0i3lmdtm71-systemic-problem-of-unenforceable-contra"
category: legal
date: "2025-10-29"
tags: [Legal]
country: Russia
tech: [Next.js, Postgres, CryptoPro CSP e-signature, PDF generation, Russian arbitration court e-filing API]
---
# Systemic problem of unenforceable contracts and slow dispute resolution

## Problem

A Russian SME signing a contract with another Russian counterparty - or a cross-border counterparty that will accept Russian jurisdiction - faces two systemic problems: the contract is poorly drafted (no clear performance deadlines, no penalty clause, no jurisdiction), and if it is breached, dispute resolution through the Russian court system takes 6-18 months. The poster wants both improved: contract templates that hold up, and a dispute path that resolves in weeks for the common commercial cases.

## Objective

Ship a contract-and-dispute platform for Russian SMEs that produces enforceable contract templates with clear performance and penalty clauses, signs them with a CryptoPro e-signature, and runs commercial-dispute arbitration through a panel of experienced Russian arbitrators with a 30-60 day resolution SLA.

## Target Users

- Russian SMEs signing B2B contracts with other Russian counterparties.
- Russian SMEs signing cross-border contracts that will accept Russian-jurisdiction arbitration.
- Russian in-house legal leads at growth-stage companies standardising a contract library.

## MVP Scope

- Contract templates: 12 commercial templates (supply, services, NDA, distribution, lease) with Civil-Code-aware clauses.
- Performance deadline + penalty clause blocks that the customer can edit; non-mandatory defaults are flagged.
- CryptoPro CSP e-signature on the final document.
- Online arbitration flow: claimant files, respondent answers, arbitrator appointed, hearing scheduled (in-person or video), award rendered.
- 30-60 day SLA for the arbitration path on claims under RUB 5m.
- Enforcement: awarded amounts enforceable under Russian law via the standard court enforcement process; the platform provides the court paperwork.
- No criminal-law or family-law scope; commercial contracts only.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/legal/0i3lmdtm71-systemic-problem-of-unenforceable-co` follows the constraints in `361-.../SPEC.md` and the chosen stack (Next.js, Postgres, CryptoPro CSP e-signature). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Arbitration panel limited to qualified Russian arbitrators with disclosed backgrounds.
- Templates cite the specific Civil Code articles invoked (e.g. Art. 309, 310, 314 for performance and deadlines).
- 30-60 day SLA is binding at the panel level; deviations publish a public reason.
