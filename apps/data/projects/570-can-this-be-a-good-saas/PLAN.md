---
id: "570"
slug: can-this-be-a-good-saas
title: "eBay scraper — accidental capability, looking for a product shape"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vocjs9/can_this_be_a_good_saas/"
  captured: "2026-08-14"
category: scraping
date: "2026-08-14"
tags: [scraping, ecommerce, micro-saas, ebay]
scores:
  money: 4
  learn: 5
  fun: 5
---
# eBay scraper — accidental capability, looking for a product shape

## Tech Stack

Scraper backend (Python with httpx + asyncio, given the speed), a small web UI, a Stripe billing layer, a captcha-handling dependency that the author has not specified.

## Architecture

Three components: (1) scraper backend, (2) UI + API, (3) billing + auth. The scraper logic stays behind a closed endpoint to reduce TOS exposure.

## Milestones

M1: pick one persona (live bidding vs pricing research) and ship a one-person MVP. M2: 5 paying customers. M3: add the second extractor. M4: ship the suite.

## Risks

Risk: eBay blocks the scraper's IP range. Risk: captcha solver cost erodes margin. Risk: customer churn when the author moves on.
