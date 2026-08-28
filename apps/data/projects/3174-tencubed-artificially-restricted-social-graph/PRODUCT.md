---
id: "3174"
slug: tencubed-artificially-restricted-social-graph
title: Ten_cubed – Artificially restricted social graph
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49455003"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Social, Networks, Idea, Web]
tech: [Node.js API (TanStack Start), SQLite with Drizzle ORM, Next.js client, Cloudflare Turnstile]
---
# Ten_cubed – Artificially restricted social graph

## Value Proposition

A social network where every user gets at most 10 connections and chooses their own max-degree preference (1st, 2nd or 3rd), capping the theoretical reach at 1,110 people — a designed constraint that keeps the graph small on purpose and makes the social cost of every connection legible.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Ex-users of mainstream social networks | Tired of engagement-bait feeds; want a slow, intentional network with a hard cap. |
| Researchers / journalists / artists | Want a network with a documented, bounded graph structure (N=10, k=3) for studying small-world dynamics. |
| Network-effects sceptics | Interested in seeing what a network looks like when scale is not the product. |

## Jobs To Be Done

1. **Functional job** — Maintain a small social network where every connection is a conscious choice and the graph never blows past 10 direct links.
2. **Emotional job** — Feel that the network is a club, not a megaphone; the 10-slot cap makes every slot feel chosen.
3. **Social job** — Signal intent: an open 1st-degree slot is an explicit invitation, not just an absent follow-back.

## Success Metrics

- **Slot occupancy:** average filled-slot ratio across active users after 30 days; if it sits near 10/10 the cap is binding, which is the point.
- **Churn rate:** voluntary network churn (users dropped, slots refilled) per week; high churn indicates the cap is doing its job.
- **Feed signal:** ratio of posts authored to posts read is close to 1 — i.e. the network is for talking, not for lurking.
- **Degree distribution:** the admin graph shows the expected 1,110 theoretical ceiling is actually being approached without being exceeded.

## Competitive Landscape

- **Twitter / Mastodon / Bluesky** — unlimited follows, algorithmic feeds, the engagement-bait dynamic the poster is reacting against.
- **Are.na** — small-graph energy with channels instead of follows; same idea (curated, intentional) expressed differently.
- **Cohort-based social apps (e.g. early Clubhouse rooms)** — temporary small groups, but no persistent graph constraint.
- **Academic small-world simulations** — Watts–Strogatz model is the closest published analogue; this is a deployed instance of the intuition.

## Risks & Open Questions

- [ ] Cold-start problem — the cap only matters once a user has 10 connections to drop; the first weeks are deliberately thin.
- [ ] Sybil resistance — without a cap, sock-puppets are easy; with a cap, they are still possible. What is the cost (CAPTCHA + phone) for opening an account?
- [ ] Slot economics — over time, will power users hoard 1st-degree slots? Visible "coveted slots" is a partial answer; reputation mechanics may be needed later.
- [ ] Migration path — when someone does want to leave, do they take their graph with them? Out of scope for v1 but worth a plan.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49455003) · **Category:** show-hn · **Tags:** Show HN,Social,Networks,Idea,Web
