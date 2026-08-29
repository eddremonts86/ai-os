---
id: "878"
slug: search-for-an-affordable-way-to-get-pr-in-forbes-and-ot
title: Search for an affordable way to get PR in Forbes and other top media outlets
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/xi1ox0v161-search-for-an-affordable-way-to-get-pr-i"
category: marketing
date: "2025-10-26"
tags: [Marketing, Media, Other]
country: Russia
wtp:
  raw: $600-650
  currency: USD
  min: 600
  max: 650
  period: one-shot
tech: [Next.js, TypeScript, Stripe Checkout (pay-for-result escrow), Postgres with Drizzle ORM, journalist-contributor marketplace, dispute resolution, Coolify]
---
# Search for an affordable way to get PR in Forbes and other top media outlets

## Problem

A Russian founder / product launcher (Ivan) needs coverage in authoritative media — Forbes primarily, plus other top-tier outlets — every time he ships a new product or project. The existing PR market is bimodal and both ends fail him: full-service agencies charge tens of thousands of dollars per placement, well above his budget; free methods (cold-emailing editors directly, press-release wires) do not work because editors ignore emails from unknown senders. The freelancers he has hired have produced zero results. He is open to a pay-for-result model where he pays only for an actual publication in an authoritative outlet, with a stated budget of $600–$650 per placement and willingness to discuss package deals for ongoing PR support.

## Objective

Ship a pay-for-result PR marketplace that connects founders who need top-tier media coverage with vetted journalist-contributors who can place (or write and place) pieces in target outlets — with payment escrowed until the article is actually published at the target URL. The marketplace's headline promise: the founder pays only on publication, the journalist is paid only on publication, and disputes (e.g., article pulled within 30 days, or outlet not on the agreed target list) trigger an automated refund.

## Target Users

- Primary: founders and indie product launchers who need authoritative media coverage (Forbes, TechCrunch, Bloomberg, Inc, Fast Company, The Verge, Wired) per launch and cannot afford $10k–$50k agency retainers.
- Secondary: bootstrapped SaaS / crypto / consumer-product teams who treat PR as a per-launch expense, not a retainer, and want pay-for-result accountability.
- Tertiary: niche-vertical experts (fintech, healthtech, climate) who want bylined articles in vertical-specific top outlets (e.g., CoinDesk, STAT News, GreenBiz) under their own byline.

## MVP Scope

- Marketplace: founder posts a placement request (target outlet, topic, deadline, budget $600–$650 range, optional byline preference); vetted journalist-contributors submit bids with a placement plan (interview, contributed article, news hook).
- Escrow: Stripe Connect with destination charges; the founder's $600–$650 is held in escrow until the article is published at the agreed URL.
- Journalist vetting: identity verification (government ID + media bylines cross-checked against the outlet's contributor page) before a journalist can bid on requests.
- Publication verification: an automated check that the article URL is live, on the agreed outlet's domain, contains the agreed keywords / quotes, and remains live for 30 days.
- Dispute resolution: if the article is pulled within 30 days or fails the verification check, the founder can open a dispute; a human reviewer rules within 5 business days; refund or partial refund issued.
- Target-outlet catalog: an internal list of "top-tier" outlets with verification rules per outlet (Forbes contributor network, TechCrunch, Bloomberg, etc.); v1 ships with 10–15 outlets.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The author explicitly wants pay-for-result; the marketplace must escrow payment and only release it on verified publication, not on "we sent the pitch."
- The $600–$650 budget is the headline price point; the marketplace's take rate must leave ≥ 80% of the budget going to the journalist (i.e., ≤ 20% platform fee) or the unit economics break at the stated willingness-to-pay.
- Journalist vetting must be real (identity + byline cross-check), not a checkbox; otherwise the marketplace becomes a vector for pay-to-play schemes that damage the platform's reputation with editors and readers.
- The author is in Russia; cross-border payments (Stripe Connect, Wise, or crypto) must work for non-US founders or the marketplace excludes a meaningful share of the demand.
- "Top-tier outlet" must be defined explicitly per outlet (e.g., for Forbes: must be on forbes.com, must be bylined by a Forbes contributor with a verifiable profile); vague "premium media" claims are the path to disputes.
- The marketplace must not facilitate buying coverage in news sections of outlets that prohibit paid placement; contributed articles (clearly labeled) and interview-led bylines are the legitimate path.
