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

## Problem

The poster argues that AI agents are about to start buying things for consumers. For that to work, three parties need an agreed surface: merchants, consumers, and AI agents themselves. Existing product search assumes an agent visits each merchant site one at a time; that is too slow, does not prove the merchant is who they claim to be, and gives the merchant no control over what an agent sees or how much it is allowed to spend.

Shelf Protocol is the answer: a single registry of verified merchants that an agent can query instead of fan-out search. The poster exposes a `can_buy()` function that tells the agent three things — whether the merchant allows an AI agent to transact without a human in the loop, whether the merchant is actually who they say they are, and the per-transaction spending ceiling before human approval is required. For the consumer it lets an agent spend autonomously under that ceiling at a verified store. For the merchant it is a single DNS record, free, ~5 minutes to set up, and gives control over what an agent sees and how much it can spend.

The author seeded the registry with public product data scraped from real Shopify stores: 8 merchants and 834 products are listed at launch, none verified, with a 0 spending limit until each merchant claims the listing. The poster is asking for feedback on the `shelf.json` schema and on whether DNS-TXT is the right long-term verification mechanism.

## Objective

Give AI agents a single verified directory of merchants they can transact with under per-merchant rules, and give merchants a one-DNS-record path to be visible to those agents and to control the per-transaction ceiling.

## Target Users

Three audiences in one product: merchants (especially Shopify storefronts) who want AI-agent traffic and want to set a spending ceiling; consumers running AI agents that will buy on their behalf; and AI-agent developers who want a single registry call instead of per-merchant integration.

## MVP Scope

A `can_buy()` endpoint returning allowed / identity-verified / spending-limit. A `shelf.json` schema for the merchant record. DNS-TXT based merchant verification with claim flow. A registry pre-seeded with public product data from real Shopify stores (8 merchants, 834 products at launch, 0 spending limit, unverified). Per-merchant controls for what an agent sees and what it can buy. Public feedback loop on the schema and the verification mechanism.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

The seeded registry entries are not yet verified and carry a 0 spending limit; transactions cannot flow until merchants claim the listing. DNS-TXT is the chosen verification mechanism at launch, but the poster is explicitly uncertain about it long-term. The seeded product data is from real Shopify stores and may reflect whatever publishing artefacts the merchant's storefront exposed at scrape time.
