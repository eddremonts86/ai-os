---
id: "308"
slug: problem-of-promoting-on-reddit-for-beginners
title: Problem of promoting on Reddit for beginners
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/uya9j4sm41-problem-of-promoting-on-reddit-for-begi"
category: marketing
date: "2025-11-12"
tags: [Marketing, Other]
country: UK
tech: [Next.js, TypeScript, Postgres, Anthropic Claude API, PRAW (Reddit API), Resend, Vercel]
---
# Problem of promoting on Reddit for beginners

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (readiness score gauge, 30-day plan timeline, comment coach panel)
- [ ] Provision Vercel + Neon Postgres + a Python PRAW service
- [ ] Wire Reddit OAuth app + Anthropic Claude API + Resend
- [ ] Decide on auth: email magic link

## Phase 1: Core

- [ ] Reddit OAuth: link a Reddit account, store access + refresh tokens
- [ ] PRAW snapshot service: karma by subreddit, post history, comment history, account age
- [ ] Readiness score: weighted combo of karma, account age, comment quality, subreddit presence
- [ ] 30-day plan generator: daily reading list + first-comment prompts + weekly milestone checks
- [ ] Subreddit picker: given a product description, return a shortlist with rules summaries
- [ ] Comment coach: paste a draft, Claude returns flagged spans (link in first sentence, no prior history) + rewrite
- [ ] Promotion gate: cannot paste a product link until readiness score clears "ready"
- [ ] Resend plan reminders and weekly digests
- [ ] End-to-end test: 20 test accounts over a 30-day simulated plan, measure survival rate

## Phase 2: Deploy

- [ ] Recruit 100 first-time Redditors with a product for a private beta
- [ ] Vercel-side deployment of the console + the PRAW service
- [ ] Status page + Reddit API quota monitoring
- [ ] Post-mortem after week 10 with the private beta cohort
