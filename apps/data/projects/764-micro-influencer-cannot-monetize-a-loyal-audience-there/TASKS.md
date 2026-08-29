---
id: "764"
slug: micro-influencer-cannot-monetize-a-loyal-audience-there
title: "Micro-influencer cannot monetize a loyal audience: there is no safe and effective platform for deals with small brands and those willing to work with small influencers in India."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/1430dgg9o1-micro-influencer-cannot-monetize-a-loyal"
category: media
date: "2026-02-11"
tags: [Media, Marketing, Other]
country: India
tech: [Next.js (App Router), TypeScript, PostgreSQL, Prisma, Razorpay Route, Cloudflare R2, Render]
---
# Micro-influencer cannot monetize a loyal audience: there is no safe and effective platform for deals with small brands and those willing to work with small influencers in India.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/764-micro-influencer-cannot-monetize-a-loyal-audience-there/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up Next.js (App Router) with TypeScript, Prisma, and a Postgres instance
- [ ] Build the user schema with role (creator or brand) and Indian phone verification
- [ ] Implement the deal state machine with five states and an audit trail row per transition
- [ ] Build the brief editor with a fixed list of deliverable types and a plain-text creative brief
- [ ] Implement the deal-tied messaging thread with off-platform contact masking
- [ ] Wire the match layer to score by brief relevance and engagement, not follower count
- [ ] Integrate the domestic Indian payout rail for creator payouts with a payout-intent table
- [ ] Add a 'payout-pending' state for rail failures and a brand-visible failure surface
- [ ] Generate the brand invoice on payout-success and the creator PDF on deal close
- [ ] Add moderation hooks for content and disclosure flags raised from the deal workspace
- [ ] Add the abuse-report surface and rate limits scoped to the Indian market
- [ ] Write an integration test that exercises the full deal lifecycle end to end on the staging rail

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
