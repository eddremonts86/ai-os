---
id: "639"
slug: i-built-a-3mo-tool-that-auto-posts-to-linkedin-through-
title: I built a $3/mo tool that auto-posts to LinkedIn through their official API
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp7kaq/i_built_a_3mo_tool_that_autoposts_to_linkedin/"
category: saas
date: "2026-08-15"
wtp: "$3/mo basic, $6/mo higher tier"
---
# I built a $3/mo tool that auto-posts to LinkedIn through their official API

## Tech Stack

Next.js + a server-side scheduler (cron or queue like Inngest), LinkedIn Marketing Developer Platform OAuth + UGC Posts endpoint, Postgres for schedule + user state, Stripe for the two paid tiers.

## Architecture

Client (LinkedIn OAuth + composer) → Next.js API → scheduler queue → LinkedIn official Posts endpoint. Webhook listener catches publish-confirmed and failed events.

## Milestones

- [ ] OAuth flow against LinkedIn developer app
- [ ] Compose + schedule form
- [ ] Scheduler queue + worker
- [ ] Stripe Checkout for $3 and $6 tiers + webhook handling
- [ ] Rate-limit guardrail UI
- [ ] Public landing page collecting "what would make this a no-brainer" answers (founder's open question)

## Risks

- LinkedIn platform risk (terms change, API tier closes).
- Pricing floor ($3) leaves no margin for support-heavy onboarding.
- Single feature (post scheduling) is a thin wedge; needs adjacent features before being defensible.
