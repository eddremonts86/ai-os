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

## Tech Stack

Next.js with TypeScript for the seller dashboard and pipeline view. PostgreSQL for product profiles, lead posts, pipeline states. BullMQ + Redis as the work queue that fans search work across the four platforms within their quotas. OpenAI API for the no-input product-understanding step and for the judging round. Vendor APIs (Reddit, X, LinkedIn, Facebook) for the source posts.

## Architecture

Seller submits a URL. A fetcher normalises the surface (SaaS site, Etsy, App Store / Google Play, Fiverr, Skool) and passes the page content to an LLM that returns a structured target-customer profile. A BullMQ-driven fan-out runs a per-platform search for posts in the last 15 days. A second LLM pass judges each post against the profile and keeps the warm leads. Results land in PostgreSQL with a dead / reached / closed state. A daily cron re-scans the past 24 hours and appends new leads.

## Milestones

M0 — URL ingestion and product-understanding step across the five supported surfaces. M1 — Reddit, X, LinkedIn, Facebook connectors with per-platform rate-limit tokens. M2 — judging-round LLM that trims 4,000+ posts down to a curated list. M3 — pipeline view with dead / reached / closed transitions and a daily 24-hour refresh scan. M4 — v2 learning loop over accumulated pipeline data, only after enough conversions are recorded.

## Risks

Scan cost can spike above economics on heavy Etsy storefronts; the poster has not solved this. Each platform's API is fragile: a price change on X or a LinkedIn ToS enforcement could remove a channel overnight. Lead yield is bounded by the public asking volume in each niche, which the poster accepts for their pentesting firm but may not generalise.
