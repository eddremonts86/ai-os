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

## Problem

Indie makers ship side projects but can't get them in front of anyone. Distribution channels are paywalled, ad-driven, or noise-heavy, and the people who would actually use a small project never see it. The Show HN post pitches a P2P ad network as the response: a peer-to-peer layer where indie projects show each other to relevant audiences, so the visibility flows between projects rather than through a single monetised gatekeeper.

## Objective

Build a self-service product where indie makers submit one project, declare a short audience description, and receive peer impressions from other indie projects in exchange. The first cut runs on a closed pilot of a handful of projects so the matching rule can be tuned before opening sign-ups.

## Target Users

- Indie makers and solo developers with a shipped side project and no audience of their own.
- Small project teams whose launch traffic is too small to clear HN's front page or Product Hunt's leaderboard.

## MVP Scope

- A submission form: project name, one-line description, one-paragraph audience description, and a target URL the impression should send traffic to.
- A matching rule that scores two projects by audience-description overlap (keyword or embedding similarity) and pairs them for a fixed impression budget.
- An impression-tracking pixel or redirect that credits impressions honestly and resists trivial click fraud (unique-IP-per-day cap, no-JS fallback).
- A dashboard for the maker showing impressions served, impressions received, click-through rate, and outstanding balance in the exchange.
- A small moderation queue (manual, two-person) before a new project enters the matching pool.
- Out of scope: a billing layer, a public browse page, third-party ad-network integration, cross-device identity.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Matching must avoid the obvious degenerate case where every project only ever sees the same handful of large projects; the matching rule needs a fairness floor.
- No real-money exchange in the MVP — impressions are the unit of account.
- All traffic accounting must be transparent to both sides; a project that gets served can see who it was paired with, on what day, and how many times.
- Privacy: audience descriptions stay on the platform and are not exposed back to other makers as a contact list.
