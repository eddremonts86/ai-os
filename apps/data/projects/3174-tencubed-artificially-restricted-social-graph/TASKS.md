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

## Phase 0: Scaffold

- [x] Capture problem + write SPEC.md skeleton
- [ ] Decide licence (AGPL to keep any fork open, vs MIT — pick before public launch)
- [ ] Set up repo: `app/` (Next.js), `api/` (TanStack Start), `db/` (Drizzle migrations)
- [ ] Wire passwordless email-link auth (Resend or Postmark) + Turnstile CAPTCHA
- [ ] Schema: `users`, `edges (owner_id, peer_id, status)`, `posts`, `preferences (user_id, max_degree)`
- [ ] DB constraint / trigger that blocks `edges` insert if owner already has 10 accepted rows
- [ ] Daily signup cap (e.g. 50/day) to control cold start

## Phase 1: Core

- [ ] Connection request flow: send, accept, drop; open-slot count visible on profile
- [ ] Visibility resolver: BFS up to k=3, intersected with viewer's chosen max-degree
- [ ] Feed query: posts from the resolved set, chronological, paginated
- [ ] Post composer: text only, no media in v1
- [ ] Per-user network graph view (D3 force layout, 3-hop neighbourhood)
- [ ] Admin aggregate stats: slot occupancy distribution, churn rate, network-size histogram
- [ ] Export-my-graph endpoint: returns the user + their edges + their posts as JSON

## Phase 2: Deploy

- [ ] Coolify deployment with the SQLite volume mounted
- [ ] Status page + error tracking (Sentry or self-hosted)
- [ ] Show HN writeup with the graph stats page as the screenshot
- [ ] Document the cap, the BFS, and the export endpoint in the README so the constraints are not surprising
- [ ] Open 3 GitHub issues for the next features (block lists, post visibility per-degree, opt-in DMs) so contributors can pick up
