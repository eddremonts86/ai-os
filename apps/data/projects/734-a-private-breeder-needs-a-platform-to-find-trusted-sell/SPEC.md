---
id: "734"
slug: a-private-breeder-needs-a-platform-to-find-trusted-sell
title: "A private breeder needs a platform to find trusted sellers who work for a commission. One helper at 10% commission already boosted sales. Need more people like that."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/xcnt6j8g51-a-private-breeder-needs-a-platform-to-fi"
  captured: "2026-07-17"
category: marketing
date: "2026-07-17"
tags: [Marketing, Business, Retail, Other]
country: Georgia
wtp:
  raw: "8,000 RUB per puppy (10% of 80,000 RUB sale) + platform fee TBD"
  currency: RUB
  min: 8000
  max: 8000
  period: one-shot
  mrrMid: 8000
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A private breeder needs a platform to find trusted sellers who work for a commission. One helper at 10% commission already boosted sales. Need more people like that.

## Problem

David runs a kennel in Georgia and sells purebred puppies on Avito for 80,000 rubles each. The work is dominated by listings, phone calls, and in-person meetings, and he spends a lot of his own time on it. One acquaintance of his currently sells his puppies for a 10% commission per deal — and she sells much better than David does on his own. He wants to find more helpers like her, but he has nowhere to look: his circle of acquaintances has run dry, asking around has produced refusals, and the public listings on Avito bring in strangers he does not trust to handle the dogs, the buyers, or the money honestly. There is no ready-made platform for finding verified commission-based sellers for this kind of deal — a marketplace for "trusted helpers who take a cut per closed sale and are accountable for the result." David is willing to pay the 10% commission per puppy (8,000 rubles) and would additionally pay the platform a fixed fee or a per-transaction percentage, conditional on the platform actually providing the trust guarantees he is missing.

## Objective

Build a vetted-helpers marketplace where a private breeder (or any small seller with a similar commission-based model) can discover, vet, and onboard commission-based salespeople who list and close deals on the breeder's behalf, with platform-level trust guarantees (KYC / verification / escrow / reputation) that make it safe to take on a stranger, so David can multiply the working pattern that one trusted helper already proved out.

## Target Users

- Primary: small private breeders and individual sellers of high-value, high-trust goods (purebred animals, artisan goods, custom services) who cannot scale sales through their own network alone and need pre-vetted commission-based salespeople to extend their reach.
- Secondary: freelance salespeople / "closers" looking for vetted inventory and a transparent per-deal commission structure instead of cold-calling strangers on classifieds.
- Tertiary: niche product makers (handcrafts, custom furniture, specialty foods) who face the same "I have product but not enough buyers, and I don't know who to trust" problem and would use the same marketplace under different categories.

## MVP Scope

- Seller (breeder) onboarding: kennel / business profile, listing inventory (puppies, item type, price), commission terms (e.g., 10% per closed deal), preferred regions.
- Helper (salesperson) onboarding: profile, KYC basics (government ID + selfie + phone), and an opt-in identity / reputation import (e.g., social profile, prior sales references).
- Vetting pipeline: manual review on first apply, plus an automated trust score that combines KYC, profile completeness, references, and platform history.
- Marketplace discovery: breeders post a "looking for helpers" listing; helpers filter by category, region, and commission structure; either side can initiate contact inside the platform.
- Deal ledger: every closed sale is logged with seller, helper, item, agreed commission, and timestamps; the platform charges its fee and routes the helper's commission.
- Reputation system: post-deal ratings (seller rates helper, helper rates seller), public on profile; persistent across deals.
- Dispute / refund path: when a buyer claims misrepresentation, the platform mediates with the logged deal record and the parties' reputations.
- Manual review on first vet of any helper; KYC vendor and Stripe / regional PSP for fee routing in v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The author is in Georgia and the example deal currency is rubles (Avito is Russian-language); the product must support multiple regions / currencies from day one rather than hard-coding a single market.
- Trust guarantees are the entire value proposition: KYC and identity verification cannot be deferred to "later" or the marketplace collapses back to Avito-with-extra-steps.
- The platform takes a fee (per David's stated willingness, a fixed fee or a percentage per transaction); v1 must settle that fee and the helper's 10% via a real PSP, not manual bank transfers.
- No payments pass through the platform for the puppy sale itself in v1 — only the commission settlement between breeder and helper; treating the full transaction as in-scope would force KYC and consumer-credit compliance the product does not need yet.
- One author / one region at the moment; the v1 must not invent scale claims or assume a network effect it has not earned.
- Compliance with personal-data protection law in any launched region (e.g., GDPR-style rules for Georgian / EU users) — KYC data has a real retention policy and a real deletion path.
