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

## Problem

An African entrepreneur in Benin (with the same problem common across much of the continent) cannot accept international payments on Shopify. PayPal has blocked the merchant's region, Stripe is unavailable, and the post argues there is no payment gateway that does not discriminate based on geography. The ProblemHunt capture is the title plus the country Benin and the tags Finance, Legal, Business and Other; nothing more — the actual missing thing is identified by the title (a non-discriminatory payment gateway) and the actor and the friction are stated (an African entrepreneur, a Shopify storefront, blocked or unavailable processors).

The structural problem is that mainstream Western payment processors maintain published and unpublished country restrictions. A merchant in Benin who has a Shopify storefront cannot plug PayPal or Stripe in and call it done, and the available alternatives tend to fragment by region (a stronger processor in one country, another in another) without covering the long tail. The post names the missing piece as a gateway that does not discriminate by geography, which the plan reads as: a single integration path that routes the payment to whatever rail actually settles in the merchant's country, rather than a different gateway per country.

Beyond that title the source names no competitor, no specific processor of the unavailable kind, no figures, and no merchant's pricing tier, so no further specifics are invented in this document. The plan reasons from the actor (African entrepreneur), the surface (Shopify), the named exclusion (PayPal blocked, Stripe unavailable), and the missing thing (a non-geographically-discriminatory gateway).

## Objective

Ship a payment gateway that a Shopify merchant in Benin (and across the African continent) can install without seeing a country-based eligibility screen, and that routes each transaction to whichever underlying rail settles in the merchant's country. The merchant integrates once and accepts international cards and local methods, with payouts reaching an African bank or mobile-money account.

## Target Users

- An African entrepreneur running a Shopify storefront in Benin who cannot list PayPal or Stripe because of country exclusions and who needs a single integration that accepts cards and local methods.
- A small merchant in a Francophone African country who specifically uses CFA-franc mobile money for receipts, and who needs a gateway that treats CFA-franc mobile money as first-class.
- A merchant who sells mostly outside the continent (the international part of the title) but lives inside it, and so must reconcile cross-border receipts with a domestic payout.
- A Shopify store builder who would normally drop in a mainstream processor and finds the geography screen blocking, and needs a single integration that works the same way regardless of country.
- A merchant in a country that does not have a single dominant gateway and who needs a fallback path that the platform handles for them, rather than the merchant adding a second or third integration manually.

## MVP Scope

- A single Shopify-integrable checkout that does not display a country-based eligibility screen to the merchant at install time.
- International card acceptance through whichever upstream processors serve the merchant's region, with card-data handling compliant with PCI-DSS via the upstream.
- Local-method acceptance (mobile money, domestic cards, bank transfer) in markets where it is the dominant rail, including Francophone Africa.
- A country router that maps the merchant's country and the buyer's country to an underlying rail, so the merchant does not pick one.
- Payouts to African bank accounts and mobile-money accounts on a settlement schedule appropriate to the local rail.
- A reconciliation feed that lists each transaction with the originating rail, the merchant's country, and the settlement destination, so the merchant's accountant can reconcile.
- A webhook to Shopify that updates order status when the upstream rail confirms or fails, so the store's own order record stays in sync.
- An FX rate lock at the moment of transaction, recorded against the order so the merchant can see what they will receive.
- A fallback path when the primary rail is unavailable, with the merchant's consent recorded for each fallback use.
- A dispute surface that lets the merchant see, accept, and respond to a chargeback through a single inbox rather than per-rail.

## Design Direction

See DESIGN.md for this project's design tokens.

## Constraints

- The capture is the title plus the country Benin and four tags; nothing beyond that is invented here, including specifics about which processors are missing, market sizes, or named merchants.
- The platform cannot be the merchant of record for transactions in jurisdictions where that requires a license it does not hold; the architecture must use licensed upstream processors in each jurisdiction rather than routing raw card data directly.
- PCI scope is decided by the upstream processors' handling of card data; the gateway itself must not store or process card data outside that handling.
- Sanctions, AML, and KYC requirements vary by jurisdiction and cannot be reduced to a single global flow; the onboarding flow has to accept jurisdiction-specific checks without making them visible as country-based discrimination.
- Pricing has to be transparent at the merchant's level, since the source names pricing discrimination as part of the problem.
- The Shopify integration has to survive merchant uninstall, so uninstall does not strand the merchant's open transactions.
