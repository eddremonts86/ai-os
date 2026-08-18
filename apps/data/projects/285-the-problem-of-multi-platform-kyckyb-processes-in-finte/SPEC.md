---
id: "285"
slug: the-problem-of-multi-platform-kyckyb-processes-in-finte
title: The problem of multi-platform KYC/KYB processes in fintech leading to specialist
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/bqzh0d2au1-the-problem-of-multi-platform-kyckyb-processes-i"
category: ai
date: "2025-10-29"
tags: [AI, Finance, Business, Legal]
country: France
tech: [NestJS API, TypeScript, Postgres, MinIO (S3-compatible), Onfido SDK, Stripe Connect, FranceConnect (OAuth), Docker on Scaleway]
---
# The problem of multi-platform KYC/KYB processes in fintech leading to specialist

## Problem

French fintechs building on top of multiple partner platforms (a payment processor, a neobank, a crypto on-ramp, a lending API) each demand their own KYC and KYB onboarding. A startup founder fills the same company information, the same beneficial-owner declarations, and uploads the same incorporation documents into four different vendor portals. The title points to the consequence: compliance roles fragment into specialists who only know one platform's checklist, slowing launches and producing contradictory answers to identical questions. Re-onboarding on a new vendor takes weeks; onboarding the same legal entity on five takes months of compliance-team time.

## Objective

Ship a single source of truth for KYC/KYB that lets a French fintech onboard once and reuse the verified corporate identity across every partner platform, with the right data shape and consent for each. Cut the marginal time to add a new partner platform from weeks to a few days, and free compliance specialists from re-keying the same documents.

## Target Users

French early-stage fintechs and regtechs (Series A or earlier) that integrate with 2+ regulated partners. Compliance leads and operations staff who currently run onboarding manually. Founders who get pulled into the compliance queue because no one else knows the partner's quirks. Secondary: French regulated partners (PSPs, neobanks, crypto RAMIs) that want verified entities to land in their queue without re-reviewing.

## MVP Scope

Single KYB onboarding flow for French SAS/SASU/SARL/EURL: company info, beneficial owners (UBO declaration aligned with registre des bénéficiaires effectifs), incorporation KBIS extract, identity documents for each UBO, and proof of address. Document store backed by MinIO, with retention rules per partner. Identity verification via Onfido for natural-person UBOs. Per-partner adapters that translate the master KYB record into the partner's onboarding format (Stripe Connect: account.individual + account.company; Powens: customer onboarding v2; etc.). FranceConnect OAuth for the legal representative sign-in. Status webhooks back to partners.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/ai/bqzh0d2au1-the-problem-of-multi-platform-kyckyb-pr` follows the constraints in `285-.../SPEC.md` and the chosen stack (NestJS API, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in France.

For France, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

GDPR-compliant by default: data minimisation, explicit consent per partner, right-to-erasure flow that purges from all partner-visible caches within 30 days. Must respect French AML/CFT requirements (Tracfin reporting obligations do not change; the product only collects, not reports). Per-partner adapters must be isolated — a failure in one partner's format cannot block another partner's onboarding. No credit-bureau checks in v1; that is a regulated activity that requires ACPR registration.
