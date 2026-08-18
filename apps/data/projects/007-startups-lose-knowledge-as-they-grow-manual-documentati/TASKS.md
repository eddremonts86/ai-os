---
id: "007"
slug: startups-lose-knowledge-as-they-grow-manual-documentati
title: "Startups lose knowledge as they grow. Manual documentation doesn't work. Need a smart tool for automatic knowledge capture and retrieval. Willing to pay from $25/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/oizu9ll251-startups-lose-knowledge-as-they-grow-man"
  captured: "2026-07-17"
category: productivity
date: "2026-07-17"
tags: [Productivity, Startups, Business, AI, Other]
country: Argentina
wtp:
  raw: from $25/month
  currency: USD
  min: 25
  period: month
  mrrMid: 25
tech: [Next.js, Postgres, Anthropic Claude, Slack API, Notion API]
---
# Startups lose knowledge as they grow. Manual documentation doesn't work. Need a smart tool for automatic knowledge capture and retrieval. Willing to pay from $25/month.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (chat-first, citation-rich)
- [ ] Provision Next.js + Postgres + pgvector + Anthropic API key
- [ ] Slack app created; OAuth scopes reviewed with counsel
- [ ] Clerk tenant model + per-tenant schema strategy

## Phase 1: Core

- [ ] Slack OAuth: install flow, channel/DM scope selection, opt-in modal
- [ ] Ingest worker: chunk messages by thread, embed, write to pgvector with permission metadata
- [ ] Q&A path: embed query, retrieve top-k, Claude synthesis, citation list
- [ ] Permission filter: hard rule at the chunk level, never a soft prompt
- [ ] Citation rendering: clickable link to the original Slack message + verbatim quote
- [ ] Feedback loop: thumbs up/down per answer; bad answers excluded from future retrievals
- [ ] Weekly digest email: "questions the bot could answer for you"
- [ ] End-to-end test: 100k Slack messages, 50 queries, permission checks

## Phase 2: Deploy

- [ ] Notion connector + meeting transcript upload
- [ ] SSO with Google + Slack identity providers
- [ ] Recruit 10 LATAM pilot customers (25–80 seats each)
- [ ] Per-tenant usage dashboard for admins
- [ ] Billing via Stripe with LATAM-friendly payment methods
- [ ] Post-mortem at week 20 with the 10-customer cohort
