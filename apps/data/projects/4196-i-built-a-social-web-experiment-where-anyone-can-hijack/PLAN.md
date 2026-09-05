---
id: "4196"
slug: i-built-a-social-web-experiment-where-anyone-can-hijack
title: "I built a social web experiment where anyone can hijack my domain"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509486"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I built a social web experiment where anyone can hijack my domain

## Tech Stack

- Single-page React + TypeScript app for the live status board
- TanStack Start as the Node.js API for leaderboard, purchase webhook, and redirect control
- SQLite with Drizzle ORM for buyer history and leaderboard totals
- Coolify + Docker to self-host the API and front-end
- Cloudflare or DNS provider API for apex domain redirect
- Whop webhook integration for payment confirmation
- Optional reverse proxy (Caddy or nginx) for 301 handling

## Architecture

The buyer pays $5 through Whop, the webhook fires, the server validates the payment, appends the buyer's spend to the cumulative leaderboard, and updates the apex DNS record to point at the buyer's URL. The status board polls the API every few seconds for the live counter, the recent activity log, and the leaderboard. A "Report this destination" button sends an abuse ticket that the operator can resolve to override the redirect.

## Milestones

1. Static landing page with the $5 button and the live counters
2. Whop webhook integration with payment verification
4. Apex DNS update path (Cloudflare API or equivalent)
5. SQLite-backed leaderboard and activity log
6. Abuse report endpoint and operator override
7. Public API exposing live counters for embedding

## Risks

- DNS TTL delays can leave the old redirect live for minutes after a takeover
- Whop TOS may not cover this use case; risk of payment processor shutdown
- Malware destination could damage domain reputation permanently
- $5 entry fee may not be enough to deter abuse at scale