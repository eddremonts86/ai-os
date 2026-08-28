---
id: "3154"
slug: a-single-homepage-link-you-can-buy-until-someone-pays-1
title: A single homepage link you can buy until someone pays $1 more
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447588"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# A single homepage link you can buy until someone pays $1 more

## Tech Stack

Single static page at mostexpensivelink.com plus a tiny serverless backend for the auction state.
Stripe or PayPal for the +$1 payment.
Public leaderboard of past winners (no PII).

## Architecture

Single-process deliverable: Single-page site that shows the current holder, current price, and a buy button that instantly transfers the link on payment of current+1.

## Milestones

MVP single-page auction with PayPal/Stripe and a 1-dollar increment.

## Risks

Settlement of the 'current' link if the buyer wins but the holder's link was already cached.
