---
id: "859"
slug: retail-store-profitability-problem
title: Retail store profitability problem
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/r94p9mdzl1-retail-store-profitability-problem"
category: retail
date: "2025-10-31"
tags: [Retail, Other]
country: Philippines
tech: [Flutter (mobile), Dart, Firebase Firestore, Firebase Cloud Functions (Node.js), Cloudflare Workers, Square Reader SDK (sandbox), Xendit (sandbox), Google Cloud Storage, Coolify, Docker]
---
# Retail store profitability problem

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A profitability surface for Filipino small-retail owner-operators that captures point-of-sale data through a low-friction daily reconciliation flow (or a payment-processor integration where available), turns that data into per-product margin and per-day profitability without requiring a spreadsheet, and surfaces three concrete signals the owner can act on the same day — slow-moving stock to discount, fast-moving stock to reorder, and category-level margin drift in the last seven days. The app works on a phone, sits alongside the owner's existing cash register rather than replacing it, and is priced for Filipino small-retail economics.

The product is deliberately scoped. It is not a POS, it is not an enterprise BI tool, and it does not tell the owner what price to set, what to reorder or what to discount — it surfaces the signal and lets the owner act. What it does is give a Filipino small-retail owner a profitability surface they can read in two minutes a day.

**One-liner:** A profitability surface for Filipino small-retail owner-operators that turns a daily reconciliation into per-product margin and three concrete signals to act on — slow-moving stock to discount, fast-moving stock to reorder, category-level margin drift — without replacing the owner's existing cash register.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Filipino sari-sari store owner-operators | Run their store on a notebook and want per-product margin without a spreadsheet. |
| Filipino small-supermarket and convenience-store owners | Already use a basic POS or tablet register and want profitability signals layered on top. |
| Filipino bakery and food-retail owner-operators | Have a small daily product mix where margin drift and slow-moving stock are visible only at month-end. |
| Filipino hardware and construction-supply store owners | Deal with low-velocity but high-value inventory where reorder timing is the margin lever. |
| Filipino pharmacy and health-product store owners | Need category-level margin drift visibility more than per-product volume. |
| Filipino franchisees of regional retail chains | Want to see the same margin numbers the head office sees without a full enterprise POS. |

## Jobs To Be Done

1. **Functional job** — Capture today's sales in a few minutes without typing in every transaction.
2. **Functional job** — Show me today's per-product margin and per-day profitability on my phone.
3. **Functional job** — Tell me which products to discount, which to reorder and which category is drifting in margin, in plain language.
4. **Functional job** — Export the day's and week's numbers as a CSV I can hand to an accountant or head office.
5. **Emotional job** — Stop making the most consequential stocking decisions on feel.
6. **Social job** — Be able to show a spouse, family member or co-owner a written weekly summary.

## Success Metrics

- **Daily reconciliation completion** — share of new owner accounts that complete a daily reconciliation within the first week, which is the proxy for whether the data capture is actually used.
- **Signal action rate** — share of generated signals that the owner taps through and acknowledges, since signals that are never opened are not signals.
- **Margin trend** — median change in per-day gross margin in the first month, tracked as a directional metric rather than a vanity one.
- **Reorder timing** — share of fast-moving-stock signals the owner reports as acted on, since reorder timing is the margin lever the product exists for.
- **CSV export reuse** — share of owners who export the weekly CSV at least once, since the export to an accountant is a real adoption signal.
- **Disclaimer acknowledgement** — share of screens for which the non-POS-replacement disclaimer was visibly rendered.

## Pricing & Monetization

The capture names no price, no tier and no business model; the only ground truth available is the title, the country and the category tags. What the architecture does fix is a cost shape: every active owner consumes a daily reconciliation record, a per-day profitability calculation and a weekly summary message, while the operator-maintained product catalogue is a shared cost across all owners. A plausible paid shape is therefore a free tier with the daily reconciliation and the per-product margin view, and a paid tier with the signal panel, the weekly summary and the CSV export; the actual price is left as an open question because the source gives no number to quote, and a Filipino small-retail price band must reflect Filipino small-retail purchasing power rather than a US SMB default.

## Competitive Landscape

- **Enterprise POS suites with built-in reporting** — deep and well-funded, but priced for chains and franchises, not for owner-operators, and usually English-centric. The product competes on Filipino-retail-specific scope and on Filipino small-retail pricing.
- **Generic BI and spreadsheet tools** — flexible, but require the owner to type in transactions and become a data analyst. The product competes on the low-friction capture flow.
- **Notebook-and-calculator workflows** — the incumbent for sari-sari stores. The product competes on per-product margin visibility and on the three-signal panel.
- **Local Filipino POS brands** — strong on cash-register UX, but typically not focused on the upstream profitability signal layer. The product competes on the signal layer rather than on the register.

The capture names no competitor by name, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the consent and retention language is sufficient for a small-business profitability product under Filipino data-protection rules; the capture gives no legal sign-off.
- [ ] Establish which payment-processor integrations the MVP must cover on day one, given the capture names no specific processor.
- [ ] Decide the pre-loaded product taxonomy coverage for common Filipino retail categories; over-narrow coverage is an empty catalogue, over-broad coverage is a maintenance burden.
- [ ] Set the retention policy for sales, cost and supplier data, which is sensitive in the Filipino small-business context; the capture gives no data-retention rule.
- [ ] Determine the signal-panel thresholds for slow-moving, fast-moving and category-drift signals, since thresholds that are too noisy erode trust and thresholds that are too quiet hide the signal.
- [ ] Confirm the Filipino-versus-English UI policy: whether the MVP is Filipino-first, English-only at launch with Filipino support as a milestone, or bilingual on day one.
