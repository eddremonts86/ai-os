---
id: "317"
slug: retail-store-profitability-problem
title: Retail store profitability problem
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/a8z3g4sod1-retail-store-profitability-problem"
category: retail
date: "2025-10-29"
tags: [Retail, Finance, Business]
country: Philippines
tech: [Next.js 14, TypeScript, Postgres, Stripe + PayMongo (PH cards + GCash), Xero / QuickBooks integration, Twilio SMS]
---
# Retail store profitability problem

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A Filipino sari-sari or small-retail owner gets a weekly SMS in Tagalog telling them which products make money, which lose money, and the three concrete actions to take this week.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Filipino sari-sari store owner | Tracks sales in a notebook; wants a profitability view that fits their phone. |
| Filipino small-retail chain operator (2–5 shops) | Wants per-shop profitability + a chain rollup. |
| Filipino distributor / wholesaler | Wants a per-account profitability dashboard for retail customers. |

## Jobs To Be Done

1. **Functional job** — Know which products make money and which don't, without an accountant.
2. **Emotional job** — Stop the Sunday-night cashflow guessing game.
3. **Social job** — Show a spouse or business partner a credible weekly report, not a verbal update.

## Success Metrics

- Weekly active retention ≥ 70% after week 4.
- Weekly margin delta vs baseline — measured at month 3.
- Top-3-action acceptance rate ≥ 60% (operator does at least 2 of 3 actions in the week after).
- SMS open / reply rate — Tagalog copy tuned via A/B.

## Pricing & Monetization

Free tier: 1 shop, 30 SKUs, weekly SMS digest. Shop tier (PHP 499/month): unlimited SKUs, photo-OCR receipt entry, Xero/QuickBooks export. Chain tier (PHP 1,499/month per shop): per-shop profitability, chain rollup, supplier comparison.

## Competitive Landscape

- Spreadsheet + notebook — the current baseline; works at <50 SKUs, breaks above.
- POS-lite apps (Kumarika, iVend) — basic sales tracking, no per-SKU profitability.
- Full POS (Aloha, Micros) — over-spec for sari-sari, requires hardware.

## Risks & Open Questions

- [ ] Data entry burden — Mitigation: photo OCR + LLM extraction of receipts; suggested entries the operator approves.
- [ ] Tagalog SMS nuance — Mitigation: A/B test copy with 5 sari-sari owners before launch; culturally-tuned advisor on retainer.
- [ ] Waste / shrink tracking — Mitigation: optional waste entry with simple categorisation; default low-burden flow.

---

_Source:_ [manual](https://problemhunt.pro/en/retail/a8z3g4sod1-retail-store-profitability-problem) · **Category:** retail · **Tags:** Retail, Finance, Business
