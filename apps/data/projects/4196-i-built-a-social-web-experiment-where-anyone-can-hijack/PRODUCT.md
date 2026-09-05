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

## Value Proposition

A $5 entry fee buys anyone the entire traffic of a single domain for as long as nobody else outbids them, and the leaderboard records every dollar spent on the domain forever.

## Target Users

- Indie hackers wanting a joke and a vanity leaderboard spot
- Small businesses willing to spend $5 to claim a meme domain for a few days
- Curious HN readers participating for fun
- Whop creators looking for a low-friction experiment example

## Jobs To Be Done

- When I want to claim a meme domain for a day, I want a $5 button that takes me straight to checkout so I do not have to email anyone
- When I take the domain, I want my redirect to land within minutes so the joke still lands in the original thread
- When I get taken over, I want my cumulative spend on the leaderboard to stay so my contribution is not erased

## Success Metrics

- 280+ redirects served in a 24h window (already observed at launch)
- Median time from $5 payment to live redirect under 5 minutes
- Leaderboard persistence across at least 3 hijack cycles without data loss

## Pricing & Monetization

$5 per hijack, paid through Whop. Buyers can pay more; the redirect is the same, but the leaderboard remembers every dollar.

## Competitive Landscape

- GoDaddy / Namecheap auctions — domain sales, not traffic redirection
- Link shorteners (bit.ly, short.io) — anyone can shorten; nobody can claim the apex
- Branded redirect services — paid SaaS, no game mechanic
- Memes and Reddit — no leaderboard, no money trail

## Risks & Open Questions

- Abuse vector: destination URL could host malware, phishing, or illegal content
- Whop's TOS may restrict this kind of redirect marketplace
- Domain reputation could be permanently tarnished by one bad actor
- Legal exposure if a buyer redirects to a scam and a third party loses money