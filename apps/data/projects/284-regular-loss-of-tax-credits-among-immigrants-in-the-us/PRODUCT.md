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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An eligible immigrant household keeps every credit the IRS actually allows them, files with confidence that the credits are claimed, and pays a flat fee that is dwarfed by the refund they recover.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Work-authorised immigrant filer (single or joint) | Loses hundreds to thousands in credits each year due to skipped forms or wrong filing status. |
| Mixed-status household parent | Eligible for CTC on citizen children even on ITIN; easily missed if preparer is not careful. |
| Credentialed tax preparer (CPA/EA) | Wants a steady pipeline of ITIN and immigrant returns without building the eligibility UI themselves. |

## Jobs To Be Done

1. **Functional job** — File a return that claims every credit the household qualifies for, with the supporting forms attached.
2. **Emotional job** — Stop second-guessing whether the preparer missed a credit, especially with ITIN or mixed-status paperwork.
3. **Social job** — Get a refund that proves the work was worth it, in a household where remittances and savings matter.

## Success Metrics

- Credits recovered per return — average and median, broken out by filing status and visa category.
- First-time filing acceptance rate ≥ 98% (no IRS rejection for missing schedules).
- Preparer review SLA — 95% of ITIN/mixed-status returns reviewed within 48 hours of interview completion.
- Customer-reported refund delta vs prior-year preparer ≥ +$500 median.

## Pricing & Monetization

Flat $79 self-file fee per federal return (state filing +$29). For ITIN or mixed-status cases that require a preparer review, a $149 flat fee covers the licensed preparer. Optional refund-advance product (small portion of expected EITC) for an additional $39 fee.

## Competitive Landscape

- TurboTax / H&R Block — generic interview flows; ITIN path is supported but not optimised; no specific credit-maximisation nudge per immigrant case.
- Immigrant-focused community tax clinics (CASA, Catholic Charities, etc.) — free but capacity-bound, multilingual, slow in peak season.
- Local Spanish-speaking CPA — high trust, no scale, fees 3–5× higher.

## Risks & Open Questions

- [ ] IRS rule changes — credits and phase-outs shift year to year. Mitigation: eligibility rules shipped as a tax-year versioned config; CI test against IRS publications on each new year release.
- [ ] Unauthorized practice of tax law — the product cannot give tax advice outside a preparer review. Mitigation: hard-coded 'this is software guidance, not advice' copy, licensed preparer signs every ITIN/mixed-status return.
- [ ] PII handling — SSN/ITIN storage is the highest-risk surface. Mitigation: tokenised PII, KMS-managed encryption keys, audit log on every decryption.

---

_Source:_ [manual](https://problemhunt.pro/en/finance/dpxn6fcl71-regular-loss-of-tax-credits-among-immigra) · **Category:** other · **Tags:** Other
