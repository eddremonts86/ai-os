---
id: "666"
slug: looking-to-sell-my-ai-saas-18k-revenue-in-35-months-lt4
title: "Looking to Sell my AI SaaS: $1.8K revenue in 3.5 months, <$45/month in costs"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpvny2/looking_to_sell_my_ai_saas_18k_revenue_in_35/"
category: saas
date: "2026-08-16"
tags: [saas, twitter, ai, byok]
tech: [Next.js, TypeScript, Tailwind CSS, Cloudflare, Dodo Payments, Resend, Umami]
---
# Looking to Sell my AI SaaS: $1.8K revenue in 3.5 months, <$45/month in costs

## Problem

The poster has a live X/Twitter growth and lead-generation SaaS that earned $1,800 over 3.5 months with lifetime-deal pricing, no paid acquisition, no SEO, and minimal maintenance. Monthly operating cost is under $45 and reducible to $0. The product uses a BYOK (bring-your-own-key) model so customers pay their own AI usage. Source post is an acquisition listing rather than a build request, but it documents a real product spec: contextual AI replies, original posts, custom writing-style training, keyword and conversation monitoring, target-account watchlists, outreach and DM drafts, partial organic-growth automation. The plan here is the underlying product spec — useful whether the buyer rebuilds it or the original owner keeps it.

## Objective

Define a self-hosted, BYOK X/Twitter growth tool that a single person can ship and operate for under $50/month, charges customers $80-100 lifetime (or $19-39/month recurring after the lifetime cohort is exhausted), and does not require the operator to pay for AI inference on the customer's behalf.

## Target Users

- **Primary:** founders, creators, agencies, and developers who run X/Twitter as a primary lead-generation channel and want partial automation of reply writing, post drafting, and conversation monitoring.
- **Secondary:** local-SEO providers, growth consultants, and personal-brand operators who treat X as a single channel among many and want an AI assistant that learns their writing style.
- **Explicit exclusions:** users who want fully autonomous posting without review (the source explicitly calls this "partial automation"); enterprise teams who need SOC2 or audit logs.

## MVP Scope

- **Reply drafting:** open a tweet thread, generate 3 contextual reply candidates using the customer's writing style, one-click to paste into the composer.
- **Original post drafting:** weekly scheduler with topic + tone prompts; outputs are drafts only, never auto-posted.
- **Custom writing style:** train on 20-50 example posts the customer pastes; store as a style profile in their account.
- **Keyword and conversation monitoring:** watch a list of keywords or accounts; surface recent posts in a feed inside the app.
- **Target account watchlist:** track N accounts, get a daily digest of new posts.
- **Outreach and DM drafts:** template + recipient, draft only, never auto-send.
- **BYOK:** customer connects their own OpenAI / Anthropic / xAI key once; the server makes no inference calls of its own.
- **Excluded in v1:** autonomous posting, autonomous DM-sending, multi-account (multi-X-account) management, analytics dashboards, team workspace.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single content-first surface — a sidebar of the keywords/accounts the user is tracking, a centre feed of recent posts to engage with, and a right-hand panel with drafted replies. No marketing-site chrome inside the app; the product is the feed.

## Constraints

- Operator must pay nothing for AI inference on the customer's behalf (BYOK is mandatory, not optional).
- Hosting + email + payments + domain + analytics must stay under $45/month combined — Cloudflare, Resend, Umami, Spaceship, Dodo Payments is the existing stack and the SPEC inherits it.
- Profit margin target is approximately 92% per the source; this plan must not regress it.
- No autonomous posting or DM-sending in v1 — the source explicitly scopes "partial automation".
