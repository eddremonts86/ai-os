---
id: "838"
slug: high-costs-and-complexity-of-api-integration-for-launch
title: High costs and complexity of API integration for launching a travel website
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: dev
date: "2025-11-14"
tags: [Developer, Tools]
country: India
tech: [Next.js, TypeScript, Node.js API routes, SQLite with Prisma, Vercel]
---
# High costs and complexity of API integration for launching a travel website

## Tech Stack

Next.js, TypeScript, Node.js API routes, SQLite with Prisma, Vercel.

## Architecture

Single Next.js app with server-side API routes that proxy the upstream travel APIs and add caching. UI is a minimal search-and-results page. Payment is sandbox-only.

## Milestones

- M1: reference site with flight search via one free-tier provider
- M2: add hotel and bus search
- M3: add Razorpay sandbox checkout and a cost-of-integration table

## Risks

Free tiers only at MVP. No scraping of competitor sites. All costs surfaced transparently in a table.

- Free tiers change silently; the demo will rot.
- Choosing the wrong aggregator locks the project in; flag the swap cost in the README.
