---
id: "3129"
slug: shelf-protocol-robotstxt-for-commerce
title: "Shelf Protocol: robots.txt for commerce"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449679"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Node.js, TypeScript, PostgreSQL, DNS-TXT verification, Shopify storefront API, OpenAI API]
---
# Shelf Protocol: robots.txt for commerce

## Tech Stack

Node.js with TypeScript for the registry service and the `can_buy()` endpoint. PostgreSQL for merchant records, `shelf.json` documents, products, and spending limits. DNS-TXT records as the merchant-ownership primitive, with a verification flow that publishes the record and confirms the domain owner. Shopify storefront scraping for the seed data (8 merchants, 834 products at launch). An LLM-friendly endpoint surface so agents can call the registry with a single request.

## Architecture

A public `can_buy(merchant_domain, agent_id)` endpoint that returns `{allowed, identity_verified, spending_limit}`. Behind that, a registry of merchant records keyed by domain, each carrying a `shelf.json` payload and a verification status derived from DNS-TXT. A merchant-claim flow: publish a DNS-TXT record on the domain, the registry resolves it, and the merchant gets verified. Agents call the registry instead of fanning out to merchants; merchants set a ceiling and a product-visibility policy on their own record.

## Milestones

M0 — registry data model with `shelf.json` schema and a per-merchant allowed / verified / spending-limit triple. M1 — DNS-TXT verification flow with a merchant-side claim UI. M2 — `can_buy()` public endpoint with auth for calling agents. M3 — seeded public-data ingestion from Shopify storefronts (8 merchants, 834 products at launch). M4 — per-merchant product-visibility and spending controls. M5 — feedback round on the schema and on DNS-TXT as the long-term primitive.

## Risks

Onboarding velocity: until merchants claim listings, transactions cannot flow and the registry looks empty to calling agents. The poster flags DNS-TXT as the wrong long-term answer and is asking for input — a schema or primitive change mid-launch is a real cost. Cold-start seeding from Shopify storefronts relies on whatever was publicly indexable at scrape time, including any artifacts the merchant accidentally exposed. The product assumes a future in which agent platforms will skip unverified stores; if that future arrives later than expected, urgency drops.
