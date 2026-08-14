---
id: "300"
slug: problem-of-product-selection-and-production-capacity-pl
title: Problem of product selection and production capacity planning
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/cbc7zd9891-problem-of-product-selection-and-product"
category: business
date: "2025-11-13"
tags: [Business, Manufacturing, Other]
country: India
tech: [Python (FastAPI), Next.js 14, Postgres + TimescaleDB, Prophet forecasting, WhatsApp Business API, Razorpay]
---
# Problem of product selection and production capacity planning

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An Indian manufacturer gets a weekly 'produce this much of each SKU' answer on WhatsApp, with the reasoning, the demand forecast, and the capacity check — no ERP, no spreadsheet, no consultant.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Indian small manufacturer owner | Decides weekly which SKUs to run and how many units; has gut feel but no model. |
| Indian mid-sized manufacturer ops manager | Needs the same answer at the SKU level across 30–100 active SKUs. |
| Indian regional industry association | Wants a planning benchmark for its members. |

## Jobs To Be Done

1. **Functional job** — Decide which SKUs to run and how many units each week, with a defensible number.
2. **Emotional job** — Stop the Sunday-night scramble to figure out the week's production plan.
3. **Social job** — Be able to show a banker or buyer a credible plan, not a 'we'll see'.

## Success Metrics

- Inventory write-down reduction — measured at quarter-end vs prior baseline.
- Hot-SKU stockout rate reduction — measured against prior baseline.
- Recommendation acceptance rate ≥ 70% (operator overrides the plan less than 30% of the time).
- Weekly active operator retention ≥ 80% after week 4.

## Pricing & Monetization

Free tier: 1 product line, weekly WhatsApp digest. Pro tier (₹2,500/month): up to 50 SKUs, demand forecast detail, capacity solver. Plant tier (₹12,000/month): unlimited SKUs, multi-plant, capacity scheduler, Tally/Zoho Books integration.

## Competitive Landscape

- Spreadsheets + WhatsApp forwards — the current baseline; works for some, breaks at 30+ SKUs.
- Tally / Zoho Books — accounting-first, no planning; basic inventory but no forecast.
- ERP systems (SAP B1, Microsoft D365) — powerful, expensive, requires an implementation partner.

## Risks & Open Questions

- [ ] Demand forecast accuracy on small histories — Mitigation: bootstrap with industry-association priors + conservative confidence bands.
- [ ] Capacity model fidelity — every plant has different machine-hours. Mitigation: per-plant onboarding wizard; manual override accepted in the recommendation flow.
- [ ] WhatsApp deliverability — Mitigation: utility-template-approved messages; opt-in at onboarding; opt-out keyword handling.

---

_Source:_ [manual](https://problemhunt.pro/en/business/cbc7zd9891-problem-of-product-selection-and-product) · **Category:** business · **Tags:** Business, Manufacturing, Other
