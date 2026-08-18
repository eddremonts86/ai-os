---
id: "311"
slug: problem-of-access-to-loans-for-immigrants-in-the-eu
title: Problem of access to loans for immigrants in the EU
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/mebr1a5hi1-problem-of-access-to-loans-for-immigrant"
category: finance
date: "2025-11-12"
tags: [Finance, Immigration, Other]
country: Portugal
tech: [Next.js, TypeScript, Postgres, Plaid (EU), Stripe, Resend, Vercel]
---
# Problem of access to loans for immigrants in the EU

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An EU immigrant in Portugal can build a portable alternative credit file from rent, utilities, and employment data, and get pre-qualified offers from lenders who accept thin-file applicants — without first needing a 12-month local credit history.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Recently-arrived EU immigrant in Portugal | Needs a small loan; blocked by the local-history gate. |
| EU immigrant rebuilding credit after a move | Wants a portable file that travels with them. |
| EU digital lender / Portuguese neobank | Wants to underwrite thin-file immigrants without building the data layer themselves. |

## Jobs To Be Done

1. **Functional job** — Get pre-qualified for a loan without a 12-month local credit history.
2. **Emotional job** — Stop being treated as a credit-invisible person in a new country.
3. **Social job** — Have a portable proof of creditworthiness that travels between EU countries.

## Success Metrics

- **Time to first offer:** median ≤ 48 hours from profile + documents complete to first lender offer.
- **Approval rate:** ≥ 30% of applicants receive at least one pre-qualified offer.
- **File portability:** ≥ 25% of approved applicants reuse the file in another EU country within 6 months.
- **Lender NPS:** ≥ 40 (small sample, but worth tracking).

## Pricing & Monetization

Free for applicants. Lender side: per-application fee + a small success fee on funded loans (EUR per funded loan).

## Competitive Landscape

- **Portuguese neobanks (ActivoBank, Banco CTT)** — strong on locals, thin on alternative credit data.
- **Credit-builder cards (Petal, Self)** — US-centric, no EU equivalent for immigrants.
- **Manual rent-payment reporting via Experian Boost** — not available in most EU countries.

## Risks & Open Questions

- [ ] Confirm the lender network for Portugal before launch — at least 3 lenders must accept the file format.
- [ ] Decide whether to ship the file format as open spec or proprietary; open spec improves portability but reduces lender lock-in.
- [ ] Define the data retention policy — when does an applicant profile expire?

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/finance/mebr1a5hi1-problem-of-access-to-loans-for-immigrant) · **Category:** finance · **Tags:** Finance,Immigration,Other
