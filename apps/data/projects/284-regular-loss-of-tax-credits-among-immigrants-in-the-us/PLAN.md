---
id: "284"
slug: regular-loss-of-tax-credits-among-immigrants-in-the-us
title: Regular loss of tax credits among immigrants in the US
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/dpxn6fcl71-regular-loss-of-tax-credits-among-immigra"
category: other
date: "2025-10-29"
tags: [Other]
country: USA
tech: [Next.js 14 (App Router), TypeScript, Postgres + pgvector, OpenAI Assistants API, Plaid (bank OAuth), Stripe, Hetzner]
---
# Regular loss of tax credits among immigrants in the US

## Tech Stack

- Next.js 14 (App Router) + TypeScript — interview UI in English and Spanish.
- Postgres + pgvector for eligibility rules and preparer-side semantic retrieval of IRS publications.
- OpenAI Assistants API for the interview phrasing and explainer copy, gated behind a preparer-reviewed prompt set.
- Plaid for W-2, 1099, brokerage, and bank-statement import.
- Stripe for self-file and preparer fees, with refund-advance split-pay.
- Hetzner hosting behind Cloudflare, encrypted Postgres volume, KMS-managed key for PII column.
- Mailroom for paper IRS correspondence (notices, refunds) optional add-on.

## Architecture

Next.js serves the interview on web (desktop and mobile web). Each question's logic lives in a deterministic eligibility engine (TypeScript, versioned per tax year); the LLM is used only for narrative explanation, never for eligibility decisions. Interview answers are encrypted at the column level. On submission, the case is routed to a credentialed preparer queue (managed in Postgres) based on language + visa mix; the preparer uses a dedicated Next.js dashboard that renders the same interview answers with IRS publication citations.

## Milestones

1. **M0** — Spec freeze, eligibility rules for EITC, CTC, ODC for tax year 2025. End of week 1.
2. **M1** — Bilingual interview MVP, no bank import, English only. End of week 4.
3. **M2** — Plaid integration, W-2/1099 import. End of week 7.
4. **M3** — Spanish-language interview parity + preparer dashboard. End of week 10.
5. **M4** — ITIN helper, mixed-status return routing. End of week 13.
6. **M5** — Tax-year 2026 rule update + filing season load test. End of week 17.

## Risks

- **Deterministic eligibility engine drift vs IRS rule updates** — Mitigation: rule PR review checklist that includes the IRS publication reference and a sample case test.
- **Preparer capacity at peak** — February-April. Mitigation: rules-based auto-approve for low-complexity returns (single filer, no ITIN, no Schedule C); only Schedule C / ITIN cases require preparer review.
- **PII breach** — Mitigation: column-level encryption, no SSN in logs, third-party pen test before launch.
