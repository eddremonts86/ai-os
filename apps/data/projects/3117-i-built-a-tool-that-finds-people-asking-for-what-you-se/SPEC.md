---
id: "3117"
slug: i-built-a-tool-that-finds-people-asking-for-what-you-se
title: I built a tool that finds people asking for what you sell
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450777"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Next.js, TypeScript, PostgreSQL, OpenAI API, BullMQ + Redis, Reddit API, X API, LinkedIn API, Facebook API]
---
# I built a tool that finds people asking for what you sell

## Problem

A cybersecurity consultant who does outreach every day observes that cold LinkedIn outreach has a very low response rate, and that even free SaaS is hard to grow — whether you run an Etsy shop, an e-commerce store, or a new product. Meanwhile, people publicly ask for products and services on social media every day. The author built ReachFast to convert those public asks into a curated lead list.

The poster describes ReachFast's loop in detail: enter a SaaS website, Etsy shop, App Store / Google Play page, Fiverr profile, or Skool community link; the tool reads the site (no settings, no keywords, no social-account linking), builds a target-customer profile, then surfaces Reddit, X, LinkedIn and Facebook public posts that read like a customer asking for the product. An AI judging round trims 4,000+ posts down to 350+ for a consumer product, or 15 for a niche SaaS — every kept post is a real ask. The initial scan covers the past 15 days; daily scans cover the past 24 hours. No automated outreach, by design — the user replies in-thread or DMs from a pipeline with dead / reached / closed states.

Posters' own caveats: niche B2B services (their pentesting firm) produce few leads and that is the nature of the business; coverage is uneven by product type; scan cost can reach $8 per initial scan on some Etsy shops; a v2 learning loop is planned but not built.

## Objective

Turn a seller's URL into a daily, hand-curated list of public posts where the lead is already asking for what the seller offers, and stop doing manual cold outreach to reach them.

## Target Users

Solo operators who do daily cold outreach or run small storefronts: cybersecurity consultants, indie SaaS founders, Etsy and e-commerce shop owners, Fiverr sellers, and Skool community operators. The poster's own pentesting firm is the canonical example of a niche B2B user.

## MVP Scope

URL ingestion for the supported seller surfaces (SaaS site, Etsy, App Store / Google Play, Fiverr, Skool). LLM-driven product-understanding step that produces a target-customer profile with no manual input. Search across Reddit, X, LinkedIn and Facebook for public posts in the last 15 days. AI judging round that ranks posts by likelihood to convert into a customer. Daily refresh scan over the past 24 hours. A pipeline view with dead, reached and closed states. No automated outreach in v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Up to $8 per initial scan is acceptable but flagged as something to optimise later. No automated outbound messaging — the seller remains responsible for tone and timing. Lead yield is bounded by the nature of the product: niche B2B will see single-digit daily leads and that is accepted. Coverage is uneven across categories and the poster does not promise uniform discovery.
