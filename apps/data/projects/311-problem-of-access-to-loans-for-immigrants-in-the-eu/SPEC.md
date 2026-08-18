---
id: "311"
slug: problem-of-access-to-loans-for-immigrants-in-the-eu
title: Problem of access to loans for immigrants in the EU
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/finance/mebr1a5hi1-problem-of-access-to-loans-for-immigrant"
category: finance
date: "2025-11-12"
tags: [Finance, Immigration, Other]
country: Portugal
tech: [Next.js, TypeScript, Postgres, Plaid (EU), Stripe, Resend, Vercel]
---
# Problem of access to loans for immigrants in the EU

## Problem

A user based in Portugal describes a recurring blocker for immigrants in the EU: getting a loan — even a small one — requires a local credit history, a local employment contract, and sometimes a Portuguese NIF-linked bank account, none of which a recently-arrived immigrant has. The title pins the problem on access: the immigrant can pay, can prove income, but cannot get past the local-history gate the bank applies.

## Objective

Ship a loan-readiness service for EU immigrants that builds a portable credit file from non-traditional signals (rent payments, utility bills, employment contract, remittance history) and routes eligible applicants to lenders who accept alternative credit data.

## Target Users

- Recently-arrived EU immigrants in Portugal (and replicable in other EU countries) who need a small personal loan.
- EU immigrants rebuilding credit after a move.
- Lenders (Portuguese neobanks, EU digital banks) who want to underwrite thin-file immigrants without building the data layer themselves.

## MVP Scope

- Applicant profile: name, country of origin, residency status, employer, employer country, monthly income.
- Document upload: residence permit, Portuguese NIF (if available), employment contract or payslips, rent contract + 6 months of rent payments, utility bills.
- Alternative credit file builder: converts the documents into a portable JSON file with rent payment history, income stability, employer verification, and identity proof.
- Lender router: a small network of EU digital lenders and Portuguese neobanks who accept the file; the app returns 1–3 pre-qualified offers in 48 hours.
- Application tracker: status of the application with each lender, with a clear "approved / declined / needs more info" outcome.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/finance/mebr1a5hi1-problem-of-access-to-loans-for-imm` follows the constraints in `311-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Portugal.

For Portugal, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- All applicant documents stored encrypted at rest; access logged and visible to the applicant.
- KYC / AML obligations are the lender's, not the tool's; the file is portable data, not a binding credit decision.
- No hard-credit-pull in v1 — only soft eligibility checks until the applicant accepts an offer.
