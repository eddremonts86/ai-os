---
id: "593"
slug: social-media-alerts
title: Social Media Alerts
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voqu49/social_media_alerts/"
category: saas
date: "2026-08-15"
tags: [saas, social-listening, ai, alerts]
tech: [Next.js, TypeScript, OpenAI embeddings, Reddit API, X.com API, Supabase, Resend, Stripe]
---
# I'm looking for a social media alert app for Reddit and X.com based on semantic search

## Phase 0: Scaffold

- [ ] Create `apps/593-social-media-alerts/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding per-user concept embeddings
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens
- [ ] Provision Supabase: auth, concepts, embeddings, daily digests
- [ ] Wire Reddit API and X.com API v2 ingest
- [ ] Configure the embedding model (text-embedding-3-small or local)
- [ ] Wire Resend for email and Slack webhook for Slack routing
- [ ] Wire Stripe for the Pro tier ($29/month)

## Phase 1: Core

- [ ] Reddit ingest (respect API rate limits)
- [ ] X.com ingest (per-user cost bounded)
- [ ] Semantic search via embedding model
- [ ] Daily digest email: top 10 matches by relevance
- [ ] Tiered relevance: high / medium / low, per-tier routing
- [ ] Free tier: 1 concept, Reddit only

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 30 paying founders via IndieHackers and r/SaaS
- [ ] 90-day X.com API pricing monitoring
- [ ] Post-mortem at week 9
