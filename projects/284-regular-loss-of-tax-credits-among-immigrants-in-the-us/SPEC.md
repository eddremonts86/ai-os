---
id: "284"
slug: regular-loss-of-tax-credits-among-immigrants-in-the-us
title: Regular loss of tax credits among immigrants in the US
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/finance/dpxn6fcl71-regular-loss-of-tax-credits-among-immigra"
category: other
date: "2025-10-29"
tags: [Other]
country: USA
tech: [Next.js 14 (App Router), TypeScript, Postgres + pgvector, OpenAI Assistants API, Plaid (bank OAuth), Stripe, Hetzner]
---
# Regular loss of tax credits among immigrants in the US

## Problem

Immigrants in the US — work-authorized, filing taxes, often with mixed-status households — repeatedly lose refundable tax credits (EITC, CTC, AOTC, Saver's Credit) they are legally entitled to. The title frames this as a recurring loss, not a one-time mistake. Drivers the title implies: complicated eligibility rules layered with visa status, language barriers, preparers who skip credits to keep the return simple, and the ITIN filing path being less well-supported than SSN. Each missed credit is hundreds to a few thousand dollars per year, compounding across working years.

## Objective

Ship a tax-prep companion that maximises the credits an eligible immigrant household can claim in a given tax year, in plain English or Spanish, with a credentialed preparer available for the ITIN and mixed-status cases. Outcome: the user files the return with every credit for which they qualify, on the first try, at a fee that is a small fraction of the credits recovered.

## Target Users

Work-authorised immigrants in the US (H-1B, L-1, green-card holder, DACA, asylum, refugee, naturalised citizen) with at least one year of US filing. Adults 22–55 filing single, joint, or head of household, often with US-citizen children. Spanish and English primary languages; Mandarin, Vietnamese, Korean, Tagalog as secondary. Mixed-status households where some members have SSNs and others have ITINs.

## MVP Scope

Bilingual interview flow (English + Spanish) that asks only the questions needed to determine eligibility for EITC, CTC, ODC, AOTC, Saver's Credit, and state-level credits. Eligibility engine rules from IRS publications + state FTB/FTY rules, versioned per tax year. Credit-maximisation prompt: suggest filing status changes (e.g. MFS vs HOH vs single) that produce the highest net refund. ITIN application or renewal helper for filers without an SSN. Bank OAuth via Plaid to import W-2, 1099, and brokerage data automatically. Credentialed preparer review for any ITIN or mixed-status return, paid per return via Stripe.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/finance/dpxn6fcl71-regular-loss-of-tax-credits-among-` follows the constraints in `284-.../SPEC.md` and the chosen stack (Next.js 14 (App Router), TypeScript, Postgres + pgvector). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must not give tax advice unless the responder is a licensed preparer; the product is an interview + preparer routing tool, not a software-as-CPA substitute. All eligibility rules must cite the IRS publication or state form they come from, with publication number visible to the preparer and the user. Personally identifying data (SSN/ITIN, DOB, address) must be encrypted at rest and never logged in plaintext. Spanish-language interview must use the same eligibility engine as English (no branching by language).
