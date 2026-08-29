---
id: "738"
slug: startups-lose-knowledge-as-they-grow-manual-documentati
title: "Startups lose knowledge as they grow. Manual documentation doesn't work. Need a smart tool for automatic knowledge capture and retrieval. Willing to pay from $25/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/oizu9ll251-startups-lose-knowledge-as-they-grow-man"
  captured: "2026-05-25"
category: productivity
date: "2026-05-25"
tags: [Productivity, Startups, Business, AI, Other]
country: Argentina
wtp:
  raw: from $25/month (tiered by users)
  currency: USD
  min: 25
  max: 25
  period: month
  mrrMid: 25
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL with pgvector, Slack + Linear + Notion connectors]
---
# Startups lose knowledge as they grow. Manual documentation doesn't work. Need a smart tool for automatic knowledge capture and retrieval.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Stand up the Next.js + FastAPI skeleton, Postgres with pgvector, Redis for the capture queue
- [ ] Slack OAuth app registered, scopes chosen, backfill job prototyped against the team's own Slack workspace
- [ ] pgvector schema: `artifact`, `artifact_chunk`, `embedding`, `citation` tables; dedupe by source-URL + chunk-hash
- [ ] Retrieval worker skeleton with cross-encoder re-ranking and LLM composition (with citations)
- [ ] Stripe account with three products (Starter $25, Growth $79, Scale $199), test-mode webhook verified

## Phase 1: Core

- [ ] Slack connector: real-time events, 90-day historical backfill, channel-level opt-out, PII redaction by default
- [ ] Linear connector: closed-issue resolution comments captured as process artifacts, linked back to the source ticket
- [ ] Notion connector: page text + database rows captured, page-level opt-out, dedupe against Slack-captured artifacts that mention the same Notion page
- [ ] Chat-shaped retrieval surface with strict citation discipline; "I don't know" path preferred over a plausible-but-wrong answer; user thumbs-up / thumbs-down on each answer
- [ ] Cross-encoder re-ranker tuned on a small labeled set of real questions from a design-partner workspace
- [ ] Weekly knowledge-gap digest: questions the system could not answer confidently, surfaced in the dashboard and emailed to the workspace owner
- [ ] Stripe tier switches on seat count, upgrade path when a workspace exceeds its seat allowance
- [ ] Workspace permissioning: source-scoped capture, channel- and page-level exclusions, audit log of capture decisions
- [ ] End-to-end test: 5 design-partner workspaces, each connects Slack + Notion, asks 20 questions from a benchmark list, the system returns a cited answer for ≥ 14 of them, the operator marks wrong answers and the system re-embeds within 24 hours

## Phase 2: Deploy

- [ ] Stripe live-mode migration and KYC on the company entity
- [ ] Public launch post with a public benchmark of retrieval quality on the 20-question design-partner set
- [ ] Onboard 20 pilot startups across the three tiers, weekly NPS, weekly knowledge-gap review
- [ ] Public status page (connector health, retrieval latency, embedding pipeline lag) and an on-call rotation for the capture worker
- [ ] Post-mortem after week 22 with a published case study on which gaps the team closed first and which they chose to leave open
