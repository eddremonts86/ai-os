---
id: "766"
slug: an-african-entrepreneur-cannot-accept-international-pay
title: "An African entrepreneur cannot accept international payments on Shopify. PayPal blocks, Stripe is unavailable. There is no payment gateway that does not discriminate based on geography."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/ces298ikj1-an-african-entrepreneur-cannot-accept-in"
category: finance
date: "2026-02-11"
tags: [Finance, Legal, Business, Other]
country: Benin
tech: [Node.js, Hono, Cloudflare Workers, D1 (SQLite at edge), Hyperwallet Africa, Flutterwave, Cloudflare R2]
---
# An African entrepreneur cannot accept international payments on Shopify. PayPal blocks, Stripe is unavailable. There is no payment gateway that does not discriminate based on geography.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A payment gateway that does not display a country-based eligibility screen to the merchant at install time. The integration is one shape for every Shopify merchant; the routing layer chooses which upstream rail to use for each transaction based on the merchant's country and the buyer's country, and the payouts reach whatever rail is normal in the merchant's country — local bank, mobile money, or domestic card processor.

The ProblemHunt capture names no price, no tier, and no specific alternative processor. The category is Finance and the tags are Finance, Legal, Business and Other, which the plan reads as a signal that the post treats this as a regulatory and operational gap, not a feature gap in any single processor.

**One-liner:** A payment gateway for Shopify merchants in Africa that installs the same way in every country and routes each transaction to the upstream rail that actually settles where the merchant lives.

## Target Users

| Stakeholder | Why they care |
|---|---|
| African entrepreneur running a Shopify storefront in Benin | Installs once and accepts international cards and local methods without seeing a country-based eligibility screen. |
| Small merchant in a Francophone African country | CFA-franc mobile money is treated as a first-class rail rather than a workaround. |
| Merchant selling mostly outside the continent | Cross-border receipts reconcile to a domestic payout on a single feed, with an FX rate locked at the moment of sale. |
| Shopify store builder in any African country | One integration works across countries, and the gateway handles the local-rail decision rather than the merchant doing it. |
| Merchant in a country without a single dominant gateway | A fallback path is chosen by the platform rather than the merchant running a second or third integration manually. |

## Jobs To Be Done

1. **Functional job** — Install a payment gateway on Shopify from any African country without hitting a geography-based eligibility screen.
2. **Functional job** — Accept an international card payment from a buyer outside Africa and route the payout to a domestic bank or mobile-money account.
3. **Functional job** — Accept a local-method payment (mobile money, domestic card, bank transfer) in markets where it is the dominant rail.
4. **Functional job** — Reconcile cross-border receipts with a domestic payout in a single feed rather than across multiple processors.
5. **Emotional job** — Stop treating payment acceptance as a country-by-country problem and trust that a new market does not require a new integration.
6. **Social job** — Operate a storefront in an African country without the storefront visibly signalling that payments are a problem in that country.

## Success Metrics

- **Install-to-first-payment latency** — median time from merchant install to a successful first settlement, since the platform's value proposition collapses if the install path is itself a country-aware flow.
- **Country coverage** — share of African countries where at least one upstream rail settles in a domestic currency, because geography discrimination is the problem and coverage is what solves it.
- **Rail-success rate** — share of transactions that succeed on the first attempt through the routed rail, since a merchant who retries is already in the friction the platform exists to remove.
- **Reconciliation completeness** — share of settled transactions whose reconciliation row matches the originating rail and the settlement destination exactly.
- **Payout on time** — share of payouts that hit the merchant's bank or mobile-money account on the schedule promised at onboarding.

## Pricing & Monetization

The ProblemHunt capture names no price. What the architecture does fix is the cost shape: a percentage of the settled transaction plus a small fixed fee per payout, because per-transaction pricing aligns the platform's revenue with the moment the merchant actually sells and avoids charging for installation. The percentage taken by the platform is layered on top of the upstream rail's fees, so the merchant sees two line items on every reconciliation row (the upstream rail's fee and the platform's fee) and can attribute either. Tiered pricing for higher volumes is possible but is not named here because the source does not name one. The platform does not pay out in a different currency than the domestic one, so the merchant avoids the FX middleman fee that a foreign gateway would charge.

## Competitive Landscape

- **Mainstream Western payment processors** — strict country restrictions at the merchant-of-record layer, which is the friction the post names directly.
- **Regional African processors** — solid in their home country but with limited cross-country reach, which forces a multi-country merchant to add a different processor per market.
- **Aggregator gateways that wrap mainstream processors** — offer a single integration but only insofar as the underlying processors allow, so an aggregator in a blocked country still produces a blocked-merchant outcome.

The capture names no competitor by name and no industry figure, so no further names or market-size numbers are claimed here.

## Risks & Open Questions

- [ ] Confirm the licensing posture in each African country served at launch, because the platform cannot be the merchant of record where it does not hold a licence.
- [ ] Decide the failure policy when a routed rail declines a transaction, since a merchant whose retries fail moves quickly to a competitor whose retry path is simpler.
- [ ] Decide how FX rate lock is communicated to the buyer at checkout, because a buyer who sees their card charged in a currency different from the merchant's price is the friction the post implicitly rejects.
- [ ] Confirm the dispute surface remains consolidated across rails, so a merchant with two upstreams behind the scenes does not see two inboxes.
- [ ] Decide the merchant-visible story for jurisdiction-specific KYC, because hiding geography-based discrimination at install time does not mean hiding it from a regulator.
- [ ] Confirm the rail-fallback consent flow records merchant agreement, so a fallback use is auditable per transaction.
