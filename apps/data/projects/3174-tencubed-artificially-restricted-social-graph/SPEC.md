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

## Problem

Social networks that grow without a hard ceiling on connections eventually slide toward enshittification: feeds become engagement-bait, follower counts become status games, and the small-network utility of "knowing who is in your circle" is lost. The poster's premise is that the fix is a hard cap on the graph itself — a designed constraint that keeps the network small on purpose. The specific proposal: each user gets 10 connections, the network extends out to at most 3rd-degree connections, and users can choose their own max-degree preference (1st, 2nd, or 3rd). Under those rules the maximum theoretical reach is 1,110 nodes per user, which keeps the graph dense and intentional.

## Objective

Ship an open social web app that enforces the 10-connection cap and per-user degree preference, with the side-effects of that constraint (coveted 1st-degree slots, networks that swell and contract as connections change) preserved rather than smoothed away.

## Target Users

- Primary: people who have already left mainstream social networks because feeds became unusable, and who want a small, slow, intentional network where the 10-slot cap is a feature.
- Secondary: researchers / journalists / artists who want a network with a documented, bounded graph structure (a known N=10 / k=3 model) instead of an opaque algorithmic feed.

## MVP Scope

- Account creation with a single degree preference (1st, 2nd or 3rd).
- A connection request flow where each user has at most 10 accepted connections.
- A feed that surfaces posts from up to 3rd-degree connections, scoped to the viewer's preference.
- Visibility of "coveted slots" — i.e. who is connected to whom and which 1st-degree slots are open — so the social cost of a connection choice is legible.
- An admin-visible graph stats page showing the distribution of network sizes, slot occupancy, and network churn rate.
- Out of scope: algorithmic ranking, ads, DMs at scale, video, group features.

## Design Direction

The UI leans into the constraint instead of hiding it: the connection list shows open / full slots explicitly, the network visualisation is a 3-hop force-graph the user can scrub, and the feed is chronological. No infinite scroll, no autoplay, no notifications badge. The visual style is monochrome with one accent; density is high because the dataset is small.

## Constraints

- The 10-connection cap must be a server-enforced invariant, not just a client-side display.
- Each user sets their own max-degree preference (1st, 2nd or 3rd); the cap is a per-account setting stored at signup.
- Posts can only be visible to connections within the viewer's chosen max-degree.
- No external tracking pixels; the only data the server logs is what the app needs to enforce the graph constraints.
