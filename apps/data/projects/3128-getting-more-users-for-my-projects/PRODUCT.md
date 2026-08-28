---
id: "3128"
slug: getting-more-users-for-my-projects
title: Getting more users for my projects
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450064"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Marketing, Indie]
tech: [TypeScript, React, Node.js, SQLite, Cloudflare Workers]
---
# Getting more users for my projects

## Value Proposition

Indie makers trade impressions with each other, peer to peer, so the visibility a project gets is proportional to the visibility it gives. The network rewards projects with a clear audience description rather than a wallet, and every impression is accounted for on both sides.

## Target Users

- Indie makers and solo developers with a shipped side project that has not yet found an audience.
- Small project teams that want launch traffic without paying for ads or gaming HN.
- Side-project collectors who want a steady stream of new things to look at, in exchange for showing their own work.

## Jobs To Be Done

- When I launch a side project, I want to put it in front of people likely to care, so the project gets its first hundred real users instead of dying on launch day.
- When I have an audience for one of my projects, I want to monetise that attention with peer impressions, so my small project helps my other small projects without selling data or running ads.
- When I run out of organic distribution channels, I want a place where the cost of an impression is showing my own project to the same pool, so my marginal CAC stays at zero.

## Success Metrics

- Number of projects in the matching pool that have been moderated in.
- Number of paired impressions served per day, balanced within ±10% across any two projects in the pool.
- Click-through rate from impression to target URL, measured per pair.
- Retention: how many submitted projects are still active in the pool after 30 days.

## Competitive Landscape

_Source does not name any competing product._ The poster links joinindie.club only; the post names no other P2P ad network for indie projects.

## Risks & Open Questions

- Matching fairness: the rule must not collapse into "everyone gets paired with the largest project" — needs a real fairness constraint.
- Sybil resistance: one person running many projects to extract impressions is the obvious attack.
- Long-tail cold start: a new project with no audience description cannot be matched; the bootstrap path needs a way to seed enough signal.
- Whether "impressions for impressions" is enough motivation to participate once novelty fades.
