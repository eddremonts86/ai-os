---
id: "899"
slug: need-to-withdraw-cash-from-credit-card-without-high-fee
title: Need to withdraw cash from credit card without high fees
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/6obgkxdbi1-need-to-withdraw-cash-from-credit-card-w"
  captured: "2025-10-10"
category: finance
date: "2025-10-10"
tags: [Finance]
country: Portugal
tech: [Next.js, TypeScript, Node.js API, PostgreSQL, a curated fee-database of Portuguese ATMs and bank cash-advance policies, Plaid / TrueLayer aggregator where available, no transactional money handling in v1]
---
# Need to withdraw cash from credit card without high fees

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A Portugal-based cardholder types in their card network, issuer, and city, and gets a ranked list of ATM networks and bank branches with the lowest effective cost for a cash withdrawal of €100, €200, or €500 — broken down into the issuer-side cash-advance fee, the interest-from-day-one cost, the foreign-transaction fee if any, and the ATM-owner fee — plus a side-by-side comparison against fee-free debit-card alternatives so they can see whether the credit-card route is even worth using. The tool is a lookup, not a transaction: no card data is entered, no PCI scope.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Portugal resident with a credit card | Needs cash occasionally (small-business suppliers, market stalls, tips) and wants the cheapest route, not the headline 3–5% cash-advance fee. |
| Expat in Portugal | Home-country card carries FX fees on top; needs a single view that compares no-FX-fee cards and fee-free debit cards against the credit-card cash advance. |
| Traveller passing through | Wants the lowest combined fee for the smallest necessary amount and a yes/no on whether the credit-card route is even worth comparing. |

## Jobs To Be Done

1. **Functional job** — Find the cheapest way to withdraw a specific amount of cash against a specific card at a specific ATM network in Portugal, before walking up to the machine.
2. **Emotional job** — Stop feeling surprised at the monthly statement when the cash-advance fee and "no grace period" interest hit together.
3. **Social job** — Be the person in the friend group who knows which ATM to use, not the one who pays 5% and complains.

## Success Metrics

- **Lookup completeness:** ≥ 95% of common Portugal-resident cardholder queries return at least one ranked ATM-network result within the first second of typing.
- **Fee accuracy:** Quarterly re-verification of every fee-database entry; ≥ 98% of entries have a verified source link and a verified date within the last 90 days.
- **Action-ability:** ≥ 40% of users who complete a lookup return within 30 days; repeat-lookup is the signal that the tool saved them money on the first visit.
- **Outcomes (self-reported):** ≥ 60% of surveyed users report "I picked a different (cheaper) option than I would have without this tool" after their first lookup.

## Pricing & Monetization

The source post does not state a price; the audience is cost-sensitive enough that a paid tool would be self-defeating. Ship free in v1 with no ads and no data sale; revenue comes from optional affiliate links to fee-free card products (Revolut, Starling, Wise) where the user opts in, with the affiliate relationship disclosed on the same screen as the link. A small annual supporter tier (€19/year) for users who want fee-update email alerts is a Phase 2 lever, not a v1 decision.

## Competitive Landscape

- **Bank-issued fee schedules (CGD, BPI, Millennium BCP, etc.)** — the source of truth for the issuer-side fee, but each bank's PDF assumes the user knows what a cash advance is; this tool is the comparison layer the bank pages do not provide.
- **Multibanco ATM locator + Multibanco fee page** — covers the ATM-owner fee side, not the issuer-side; the comparison lives in the gap between the two.
- **Revolut / Starling / Wise multi-currency cards** — the alternative the user is comparing against; the product is honest about them rather than pretending they do not exist.
- **N26 / Bunq** — additional alternatives the user might consider; same status, same disclosure rule.
- **Travel-community forums (Rick Steves, Reddit r/TravelHacks)** — useful background context but not a structured lookup; users currently piece the answer together from a forum thread, an issuer page, and an ATM fee page.

## Risks & Open Questions

- [ ] Validate that the curated fee database can be kept current at a 90-day cadence without a full-time employee; the bigger banks revise their fee schedules twice a year and the smaller fintechs revise more often, and stale data is the worst possible failure for a fee-lookup product.
- [ ] Decide whether to integrate with a Plaid / TrueLayer-style aggregator so the user does not have to type their issuer; the integration adds complexity and a privacy conversation that a free tool does not necessarily want.
- [ ] Confirm the affiliate-link disclosure can be written plainly enough that a non-lawyer understands the incentive before clicking; the user trust story is exactly the kind of thing that fails silently if it is treated as a footnote.
- [ ] Settle the cross-border expansion plan. Spain, France, and Brazil are obvious neighbours for a Portugal-built tool, but each requires a separate fee database; expansion must be data-led, not ambition-led.
