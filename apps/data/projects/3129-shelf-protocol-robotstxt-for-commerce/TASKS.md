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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3129-shelf-protocol-robotstxt-for-commerce/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Registry data model with `shelf.json` schema (domain, owner, products, spending-limit, allowed flag)
- [ ] DNS-TXT verification flow: merchant publishes TXT, registry resolves and confirms
- [ ] Merchant claim UI: one DNS record and ~5 minutes end-to-end
- [ ] `can_buy(merchant_domain, agent_id)` public endpoint returning {allowed, identity_verified, spending_limit}
- [ ] Agent-side auth so calling agents can be identified
- [ ] Seed ingestion from public Shopify storefront data (8 merchants, 834 products at launch)
- [ ] Per-merchant product-visibility and spending controls
- [ ] Public docs that publish the `shelf.json` schema for review
- [ ] Mechanism survey: collect community feedback on whether DNS-TXT is the right long-term primitive

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
