---
id: "544"
slug: paid-ads-got-us-14-inactive-users-posting-organically-g
title: Paid ads got us 14 inactive users. Posting organically got us 800. Here’s what changed
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9mo7/paid_ads_got_us_14_inactive_users_posting/"
category: saas
date: "2026-08-14"
tags: [saas, growth, reddit, indie]
tech: [Next.js, TypeScript, Reddit API, Anthropic Claude, Supabase, Stripe]
---
# Paid ads got us 14 inactive users, posting organically got us 100

## Phase 0: Scaffold

- [ ] Create `apps/544-paid-ads-got-us-14-inactive-users-posting-organically-g/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding per-user post drafts
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens (launch-workflow visual identity)
- [ ] Provision Supabase: auth, subreddit list, post drafts, cadence tracker
- [ ] Set up the Reddit JSON API client and the sidebar parser
- [ ] Configure the Anthropic Claude API key and the per-subreddit prompt cache
- [ ] Wire Stripe for the Pro tier ($29/month)

## Phase 1: Core

- [ ] Subreddit-finder: list relevant subreddits with self-promotion rules
- [ ] Sidebar parser: extract the rule from the subreddit sidebar + pinned mod posts
- [ ] Post-drafter: Claude with a per-subreddit prompt that fits the room
- [ ] Cadence tracker: target 3-5 posts/week across 4-6 subreddits
- [ ] Weekly review: which posts got traction, which subreddits gave the most engaged users
- [ ] Free tier: 3 subreddits, 1 post/week

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 30 indie founders via IndieHackers and r/SaaS
- [ ] 90-day case-study writeup
- [ ] Post-mortem at week 9
