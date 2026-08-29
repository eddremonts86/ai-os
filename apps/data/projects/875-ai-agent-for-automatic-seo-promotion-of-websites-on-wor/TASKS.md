---
id: "875"
slug: ai-agent-for-automatic-seo-promotion-of-websites-on-wor
title: AI agent for automatic SEO promotion of websites on Wordpress and Tilda
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/seo/6ajl0f17x1-ai-agent-for-automatic-seo-promotion-of"
  captured: "2025-10-28"
category: seo
date: "2025-10-28"
tags: [SEO, Marketing, AI, Other]
country: Serbia
wtp:
  raw: $6–18/month per client
  currency: USD
  min: 6
  max: 18
  period: month
  mrrMid: 12
tech: [Next.js (agency dashboard), Node.js worker (article generation + publishing), Postgres, WordPress REST API + Tilda API connectors]
---
# AI agent for automatic SEO promotion of websites on Wordpress and Tilda

## Phase 0: Scaffold

- [x] Capture ProblemHunt post by Maxim (Serbia, 2025-10-28)
- [ ] Provision Next.js dashboard + Fastify API + Postgres on Coolify
- [ ] Define `publishDraft` connector interface (input: article payload + site credentials; output: published URL + audit row)
- [ ] Decide per-article cost ceiling and the LLM tier that hits it without collapsing approval rate
- [ ] Decide the duplicate-content check approach (provider, threshold)

## Phase 1: Core

- [ ] Agency dashboard: workspace, per-client page, manual keyword entry, publishing schedule, tone-of-voice notes
- [ ] Article-generation worker: per-article cron, fetch site context, draft 600–1200 words, target keyword density, internal links to client pages
- [ ] Duplicate-content check; surface the score in the review queue
- [ ] Review queue UI: agency sees the draft, edits if needed, clicks approve
- [ ] WordPress connector: Application Passwords + REST API; live end-to-end test on a real WP site; failure modes surfaced (wrong creds, REST disabled, plugin conflict)
- [ ] Tilda connector: Tilda API; live end-to-end test on a real Tilda site; failure modes surfaced
- [ ] Publishing: on approval, worker calls the matching connector; audit log records publish URL + timestamp
- [ ] "Wix not yet supported" banner on any client record whose site is detected as Wix
- [ ] Stripe Checkout on the three per-site tiers; subscription status gating
- [ ] End-to-end test: connect one WordPress site, schedule 4 articles/month, approve all 4 in one session, confirm publishing + audit log + cadence report

## Phase 2: Deploy

- [ ] Onboard 30 paying sites across 3 agencies
- [ ] Search Console integration (optional, read-only OAuth) with graceful degradation when the client has not granted access
- [ ] Weekly review of approval rate, publishing cadence, and per-site cost (alert if any site exceeds the cost ceiling)
- [ ] Wix connector roadmap with a real target date once WordPress + Tilda are stable
- [ ] Post-mortem at week 13: sites live, articles published, client-reported ranking movement, retention past month 3
