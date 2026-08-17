---
tags: ["saas", "social-listening", "ai", "alerts"]
tech: ["Next.js", "TypeScript", "OpenAI embeddings", "Reddit API", "X.com API", "Supabase", "Resend", "Stripe"]
id: "593"
slug: social-media-alerts
title: Social Media Alerts
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voqu49/social_media_alerts/"
category: saas
date: "2026-08-15"
---
# I'm looking for a social media alert app for Reddit and X.com based on semantic search

## Problem

The poster wants a social media alert app for Reddit and X.com based on semantic search. They checked out Prowlo and Subredditsignals but were disappointed on first pass — neither had X.com support and the relevance was low. The poster explicitly excludes PR pitches. The implicit product: a semantic-search social media alert app that covers both Reddit and X.com with high relevance.

## Objective

Define the MVP scope for a semantic-search social media alert app that watches Reddit and X.com for posts matching a user-described concept (not just keywords), surfaces a daily digest, and routes by relevance tier.

## Target Users

- **Primary:** founders and indie hackers tracking brand mentions, competitor launches, and niche conversations across Reddit + X.com.
- **Secondary:** marketers running social-listening workflows.
- **Tertiary:** researchers and journalists tracking specific topics.

## MVP Scope

- Reddit + X.com ingest, both with semantic search (vector embeddings over the post text).
- Per-user concept definition: free-text description (not just keywords), converted to an embedding.
- Daily digest email: top 10 matches by relevance, with a link to the source post.
- Tiered relevance: high / medium / low, with a per-tier Slack or email route.
- Free tier: 1 concept, Reddit only. Pro at $29/month: 5 concepts, Reddit + X.com, daily digest, Slack routing.
- Excluded in v1: LinkedIn / TikTok / Instagram, custom webhooks, historical backfill, multi-user team.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single concept-watch surface — the concept list on the left, the daily digest in the centre, the per-tier routes on the right. No marketing-site chrome; the product is the digest.

## Constraints

- Semantic search must be a real embedding model (e.g. text-embedding-3-small or a local equivalent), not just keyword expansion.
- Reddit ingest must respect the API rate limits; the digest runs at a fixed cadence.
- X.com ingest must respect the elevated API pricing; the per-user cost is bounded.
