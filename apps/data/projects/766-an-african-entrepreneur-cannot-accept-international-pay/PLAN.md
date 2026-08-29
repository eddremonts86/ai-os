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

## Tech Stack

- **Node.js with Hono** for the routing service, chosen because the gateway's main job is to take an HTTP request from Shopify, pick a rail, and return a result; Hono keeps the routing surface small and Cloudflare-deployable.
- **Cloudflare Workers** for the host, because the routing layer is a stateless request router that benefits from edge placement and the source names no hosting preference.
- **D1 (SQLite at edge)** for the merchant and transaction ledger, because the read pattern (a merchant querying their own transactions) fits a small relational store and D1 places reads near the merchant.
- **Hyperwallet Africa (or comparable regional aggregator)** as the primary rail for payouts to African bank accounts and mobile-money handles, because the platform's value rests on whatever rail actually settles in the merchant's country.
- **Flutterwave** for the international card processing leg in countries where it is licensed, chosen because it is one of the few African-licensed processors with stable international card acceptance.
- **Cloudflare R2** for the storage of reconciliation artefacts (signed FX rate snapshots, rail choice logs, audit rows), because retaining them is required for the merchant's reconciliation feed and R2 makes it cheap.

The architecture surfaces only D1, Workers, and the upstream processors' SDKs as the durable surface area. PCI scope is delegated entirely to the upstream processors; this gateway itself handles the routing, the reconciliation, and the merchant-visible surfaces, not card data.

## Architecture

A Shopify merchant installs the gateway through the Shopify app store. The installation handshake is country-agnostic, by design: there is no published country list at install time, and the merchant does not see a screen that says 'not available in your country'. Instead, the onboarding flow collects the merchant's business details and runs them through the upstream processors' compliance checks behind the scenes; the merchant's experience is one flow that lands on either 'approved' or 'need more information' rather than on 'this country is excluded'.

Transaction routing is the structural core. A checkout request arrives from Shopify with the merchant's country and the buyer's country. The router maps merchant-country and buyer-country to an upstream rail that can both accept the buyer's payment method and settle in the merchant's country; if no single rail covers both, the router uses one rail for acceptance and a second rail for settlement, with the conversion step recorded in the reconciliation feed. The FX rate is locked at the moment the rail confirms the transaction, not at the moment of payout, so the merchant sees what they will receive before the buyer's charge clears. The reconciliation row carries originating rail, FX rate snapshot, fees from both legs, and the settlement destination.

Payouts run on the schedule of the merchant's domestic rail. A merchant in Benin sees payouts to a mobile-money handle on the rail's schedule, not on a foreign gateway's weekly cycle; the cycle is recorded at onboarding and visible in the merchant's dashboard. When the primary rail declines a payment, the platform records the failure with the merchant's consent policy in mind and, if consent is on file, retries on the fallback rail. The fallback consent itself is recorded per transaction for audit purposes, so a regulator and the merchant can both see why a transaction took the route it took.

The dispute surface is consolidated across rails: a chargeback arriving through any upstream lands in a single inbox with the merchant's choice of action (accept, contest, escalate), and the action is propagated back to the upstream rail by the platform. This is what stops the merchant from needing to learn each rail's dispute format and the structural reason why a multi-rail gateway is harder to operate than a single-rail one.

## Milestones

1. **M1 — Country-agnostic onboarding** — Merchant install with no published country list; jurisdiction-specific compliance runs behind the scenes without becoming a geography screen.
2. **M2 — Shopify integration** — Single integration in the Shopify app store that works for every African country on the launch list; webhook bridge for order-status sync.
3. **M3 — Routing engine** — Merchant-country to buyer-country to rail mapping; FX rate lock at transaction time; reconciliation row on every settlement.
4. **M4 — Local rails** — Mobile-money and domestic-card acceptance in launch markets including Francophone Africa; payouts to local bank and mobile-money handles.
5. **M5 — Disputes and fallbacks** — Consolidated dispute inbox; fallback-rail consent at onboarding; merchant-visible retry policy.
6. **M6 — Reconciliation feed** — Per-transaction feed that names originating rail, fees, FX snapshot, and settlement destination; exportable for the merchant's accountant.

## Risks

- **Licensing gap** — operating a payment gateway without a licence in the merchant's country creates immediate regulatory exposure; the launch list has to match the licensing map, not just the technical integration map.
- **Rail availability** — a regional aggregator can degrade, raise prices, or deprecate an endpoint; the gateway's value proposition is only as strong as its fallback rail.
- **FX slippage** — locking FX at transaction time is a real cost to the platform when the merchant settles days later; the cost has to be priced in, not absorbed.
- **Chargeback handling** — chargebacks through a regional rail often have different timelines and evidence rules than those through a card network; the consolidated inbox has to translate for the merchant without misrepresenting either.
- **Sanctions drift** — a merchant whose buyer is in a sanctioned jurisdiction creates an exposure regardless of where the merchant lives; the platform's screening has to be jurisdiction-aware on the buyer side, not just the merchant side.
- **Reconciliation completeness** — a reconciliation row that drops one detail breaks the merchant's accounting, and the easiest detail to drop is the FX rate snapshot; the reconciliation feed has to be tested for completeness, not just for happy-path correctness.
- **Fallback consent fatigue** — if the merchant is asked for consent on every fallback, consent becomes reflexive and the audit value collapses; the consent flow has to be configurable rather than per-transaction.
