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

## Tech Stack

- **API:** Node.js + TanStack Start, with the social graph logic in plain TypeScript modules (a small graph library written for this, no Neo4j).
- **DB:** SQLite via Drizzle ORM; the whole graph (users, edges, posts, visibility) fits in a single file at v1 scale, with WAL for concurrent reads.
- **Client:** Next.js (App Router) for the web client; server components render feeds straight from the DB with no client-side graph library.
- **Auth:** passwordless email link with a Cloudflare Turnstile CAPTCHA on signup; no social-login providers because they would defeat the "one human one account" intent.
- **Notifications:** transactional email only; no push, no badge counts.

## Architecture

```
Browser ─▶ Next.js (server components) ─▶ TanStack Start API ─▶ Drizzle ─▶ SQLite (users, edges, posts)
                                                          │
                                                          └─▶ visibility resolver (BFS up to k=3 from viewer)
```

The visibility resolver is the hot path: for any viewer, it computes the set of users within their chosen max-degree, and the feed query is a single `IN (...)` against that set. The 10-connection cap is enforced as a DB constraint on insert into `edges`: an `INSERT ... SELECT COUNT(*) FROM edges WHERE owner_id = ?` returning < 10 is the gating subquery.

## Milestones

1. **M0 — Auth + graph primitives.** Email-link signup, CAPTCHA, `User` and `Edge` tables with the 10-cap check in a trigger. End of week 2.
2. **M1 — Connection flows.** Request / accept / drop; visible open-slot count; the feed is empty until a user has at least one connection. End of week 4.
3. **M2 — Visibility resolver.** BFS up to k=3 capped at the viewer's preference; feed query returns posts from that set. End of week 6.
4. **M3 — Admin graph view.** Per-user network graph (D3 force layout), aggregate stats page. End of week 8.
5. **M4 — Public launch.** Open signup with a daily account cap to control initial cold-start. End of week 10.

## Risks

- **Graph correctness.** A bug in the BFS that over-counts hops would silently violate the user's chosen max-degree; tests must enumerate boundary cases (exactly 3 hops, exactly 1+2+3 expansion, etc.).
- **Cold start.** With a hard cap, the first cohort has very thin feeds; mitigate with a daily signup cap and a small seed of demo accounts.
- **Spam / sock puppets.** Without social-login, cheap to spin up fake accounts; CAPTCHA + email-link throttle is the v1 line of defence.
- **Lock-in anxiety.** The cap is the product, but users who hit it will eventually want to leave; an export-my-graph endpoint should exist from day one to defuse the worst of the "what if I want out" anxiety.
